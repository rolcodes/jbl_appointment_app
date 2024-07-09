import 'package:appointment_app/common/widgets/appbar/custom_appbar/custom_appbar.dart';
import 'package:appointment_app/new_features/screen/new_home_screen/widget/custom_drawer.dart';
import 'package:appointment_app/new_features/screen/new_home_screen/widget/my_appointments.dart';
import 'package:appointment_app/new_features/screen/new_home_screen/widget/new_promo_silder.dart';
import 'package:appointment_app/new_features/screen/new_home_screen/widget/service_categories_see_all.dart';
import 'package:appointment_app/new_features/screen/new_home_screen/widget/service_category_cards/service_category_cards.dart';
import 'package:appointment_app/new_features/screen/new_home_screen/widget/service_category_cards/widget/services.dart';
import 'package:appointment_app/services/database.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/shared_pref.dart';
import '../../../utils/constants/image_strings.dart';
import '../../models/category_model.dart';
import '../../models/data/dummy_data.dart';

class NewHomeScreen extends StatefulWidget {
  const NewHomeScreen({super.key});

  @override
  State<NewHomeScreen> createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends State<NewHomeScreen> {
  Stream? bookingStream;

  /// -- Method to get to the Services Screen whenever a user tap a services
  void _selectCategory(BuildContext context, Category category) {
    final filterServices = dummyServices
        .where((service) => service.category.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => ServiceScreen(
          title: category.title,
          services: filterServices,
        ),
      ),
    );
  }

  late bool _isLoading;
  String? name, email;
  bool isAppointment = true;

  /// Get data in local database
  getDataFromSharedPref() async {
    /// user data
    name = await SharedPreferenceHelper().getUserName();
    email = await SharedPreferenceHelper().getUserEmail();
  }

  getOnTheLoad() async {
    await getDataFromSharedPref();
    bookingStream = await DatabaseMethods().getUserAppointments(email!);
    setState(() {});
  }

  /// Initialize loading time and getOnTheLoad
  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _isLoading = false;
      });
    });
    getOnTheLoad();
    super.initState();
  }

  Widget userAppointments() {
    return StreamBuilder(
        stream: bookingStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData && isAppointment
              ? Column(
                  children: [
                    /// -- My Appointments
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'MY APPOINTMENTS',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => CupertinoAlertDialog(
                                    title: const Text('Note:'),
                                    content: const Text(
                                        'Please come to the branch at least 15 minutes before your appointment. Do note that if you miss your appointment schedule, your slot may be given to the next client. Thank you!'),
                                    actions: [
                                      TextButton(
                                        child: const Text("Got it!",
                                            style: TextStyle(
                                                color: CupertinoColors
                                                    .activeBlue)),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                              icon: const Icon(Icons.note_alt_rounded,
                                  color: TColors.primary),
                            ),
                          ],
                        ),

                        /// -- See All Appointments
                        TextButton(
                          onPressed: () =>
                              Get.to(() => const MyAppointmentsScreen()),
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              alignment: Alignment.centerRight),
                          child: Text('See All',
                              style: Theme.of(context).textTheme.bodySmall),
                        ),
                      ],
                    ),

                    /// Appointment Item in List View
                    Expanded(
                      child: ListView.separated(
                        itemCount: snapshot.data.docs.length,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          DocumentSnapshot ds = snapshot.data.docs[index];
                          return Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  ds['Image'],
                                  width: 110,
                                  height: 110,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: SizedBox(
                                  width: 260,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Service Start Time: ${ds["Time"]}, ${ds["Date"]}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .apply(
                                                  color: Colors
                                                      .pinkAccent.shade700)),
                                      Text(
                                        ds["Branch Title"],
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                          'Location:  ${ds["Branch Location"]}',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge!),
                                      SizedBox(
                                        width: 300,
                                        child: Text(
                                          ds["Service"],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Technician:  ${ds["Staff Name"]}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                          ),
                                          Text(
                                            'Booking ID:  ${ds["Booking ID"]}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 24,
                          );
                        },
                      ),
                    ),
                  ],
                )
              : Container();
        });
  }

  /// -- Main Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.secondary, // Colors.grey.shade300
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(TColors.primary),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  const Stack(
                    children: [
                      /// -- Body
                      NewPromoSlider(
                        banners: [
                          TImages.newBanner1,
                          TImages.newBanner2,
                          TImages.newBanner3,
                          TImages.newBanner4,
                          TImages.newBanner5,
                          TImages.newBanner6,
                          TImages.newBanner7,
                          TImages.newBanner8,
                        ],
                        isAppBar: true,
                      ),

                      /// -- App Bar
                      Positioned(
                        child: CustomAppBar(
                          iconColor: Colors.white,
                          showBackgroundColor: true,
                          showIcon: true,
                          isDrawer: true,
                          isAction: true,
                        ),
                      ),
                    ],
                  ),
                  Material(
                    elevation: 1,
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hi ${name!}',
                              style: Theme.of(context).textTheme.titleLarge),
                          Text(
                            'BOOK AN APPOINTMENT NOW!',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .apply(
                                    color: TColors.primary,
                                    fontSizeDelta: 2,
                                    letterSpacingDelta: 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),

                  Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    width: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, top: 10),
                    child: Column(
                      children: [
                        /// -- Appointment Item
                        isAppointment != true
                            ? Container()
                            : SizedBox(
                                height: 165,
                                child: userAppointments(),
                              ),

                        /// -- Service Categories
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('SERVICE CATEGORIES',
                                style:
                                    Theme.of(context).textTheme.headlineSmall),

                            /// -- See All Categories
                            TextButton(
                              onPressed: () =>
                                  Get.to(() => const ServiceCategoriesSeeAll()),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                alignment: Alignment.centerRight,
                              ),
                              child: Text('See All',
                                  style: Theme.of(context).textTheme.bodySmall),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        /// -- Services Categories Cards
                        SizedBox(
                          height: 240,
                          child: ListView.separated(
                            clipBehavior: Clip.none,
                            // remove hard edges and fix cropped shadows
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: availableCategories.length,
                            itemBuilder: (ctx, index) {
                              return ServiceCategoryCardListsItem(
                                service: availableCategories[index],
                                onSelectedCategory: () {
                                  _selectCategory(
                                      context, availableCategories[index]);
                                },
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(width: 20);
                            },
                          ),
                        ),
                        const SizedBox(height: 10),

                        /// -- Promos
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('PROMOS',
                                style:
                                    Theme.of(context).textTheme.headlineSmall),

                            /// -- See All Categories
                            TextButton(
                              onPressed: () =>
                                  Get.to(() => const ServiceCategoriesSeeAll()),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                alignment: Alignment.centerRight,
                              ),
                              child: Text('See All',
                                  style: Theme.of(context).textTheme.bodySmall),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  /// -- Promos
                  const NewPromoSlider(
                    banners: [
                      TImages.newBanner5,
                      TImages.newBanner6,
                      TImages.newBanner7,
                      TImages.newBanner8,
                    ],
                    isAppBar: false,
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: const BoxDecoration(color: Colors.white),
                    child:

                        /// -- Product Categories
                        Column(
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('PRODUCT CATEGORIES',
                                style:
                                    Theme.of(context).textTheme.headlineSmall),

                            /// -- See All Product Categories
                            TextButton(
                              onPressed: () =>
                                  Get.to(() => const ServiceCategoriesSeeAll()),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                alignment: Alignment.centerRight,
                              ),
                              child: Text('See All',
                                  style: Theme.of(context).textTheme.bodySmall),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),

                        /// -- Services Categories Cards
                        SizedBox(
                          height: 240,
                          child: ListView.separated(
                            clipBehavior: Clip.none,
                            // remove hard edges and fix cropped shadows
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: availableCategories.length,
                            itemBuilder: (ctx, index) {
                              return ServiceCategoryCardListsItem(
                                service: availableCategories[index],
                                onSelectedCategory: () {
                                  _selectCategory(
                                      context, availableCategories[index]);
                                },
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(width: 20);
                            },
                          ),
                        ),
                        const SizedBox(height: 10),

                        /// -- Shop
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('SHOP',
                                style:
                                    Theme.of(context).textTheme.headlineSmall),

                            /// -- See All Categories
                            TextButton(
                              onPressed: () =>
                                  Get.to(() => const ServiceCategoriesSeeAll()),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                alignment: Alignment.centerRight,
                              ),
                              child: Text('See All',
                                  style: Theme.of(context).textTheme.bodySmall),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),
                      ],
                    ),
                  ),

                  /// -- Promos
                  const NewPromoSlider(
                    banners: [
                      TImages.newBanner1,
                      TImages.newBanner2,
                      TImages.newBanner3,
                      TImages.newBanner4,
                    ],
                    isAppBar: false,
                  ),

                  /// -- About the Branches
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ABOUT THE BRANCHES',
                            style: Theme.of(context).textTheme.headlineSmall),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(100),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/content/jbl.webp',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 30),
                            Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(100),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/content/jss.jpeg',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),

      /// -- Drawer
      drawer: const CustomDrawer(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: TColors.primary,
        shape: const CircleBorder(
          side: BorderSide(
            color: Colors.transparent,
          ),
        ),
        child: const Icon(Icons.message, color: Colors.white),
      ),
    );
  }
}
