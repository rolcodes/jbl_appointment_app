import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jbl/new_features/screen/new_home_screen/widget/chat/custom_chat_button.dart';
import 'package:jbl/new_features/screen/new_home_screen/widget/custom_drawer.dart';
import 'package:jbl/new_features/screen/new_home_screen/widget/my_appointments/my_appointments.dart';
import 'package:jbl/new_features/screen/new_home_screen/widget/new_promo_silder.dart';
import 'package:jbl/new_features/screen/new_home_screen/widget/service_categories_see_all.dart';
import 'package:jbl/new_features/screen/new_home_screen/widget/service_category_cards/service_category_cards.dart';
import 'package:jbl/new_features/screen/new_home_screen/widget/service_category_cards/widget/services.dart';
import 'package:jbl/utils/device/device_utility.dart';

import '../../../common/widgets/appbar/custom_appbar/custom_appbar.dart';
import '../../../services/database.dart';
import '../../../services/shared_pref.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../controller/future_user.dart';
import '../../models/category_model.dart';
import '../../models/data/dummy_data.dart';
import '../admin_panel/home/widget/upcoming_appointment/admin_upcoming_appointment_item.dart';

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

  getOnTheLoad() async {
    bookingStream = await DatabaseMethods().getSpecificUserAppointments();

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
    final isMobileSmall = TDeviceUtils.getScreenWidth(context) <= 393;

    return StreamBuilder(
        stream: bookingStream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null || snapshot.data.docs.length == 0) {
            /// If no data display nothing
            return SizedBox();
          }

          /// If there is data display appointments
          return snapshot.hasData
              ? Container(
                  height: 170,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: TColors.white),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                  child: Column(
                    children: [
                      /// -- My Appointments
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'MY APPOINTMENTS',
                                style: isMobileSmall
                                    ? Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .apply(fontSizeDelta: -1)
                                    : Theme.of(context).textTheme.titleLarge,
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
                              minimumSize: Size(50, 30),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text('See All',
                                style: Theme.of(context).textTheme.bodySmall),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          // add null check in data (!) to check if snapshot is 0 then display nothing
                          // itemCount: snapshot.data.docs.length,
                          itemCount: 1,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            DocumentSnapshot ds = snapshot.data.docs[index];

                            /// -- Condition to remove cancelled, expired and completed status
                            return Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () =>
                                    Get.to(() => const MyAppointmentsScreen()),
                                child: SizedBox(
                                  width: TDeviceUtils.getScreenWidth(context),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              ds['image'],
                                              width: isMobileSmall ? 100 : 110,
                                              height: isMobileSmall ? 100 : 110,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: SizedBox(
                                              width: TDeviceUtils
                                                          .getScreenWidth(
                                                              context) >=
                                                      430
                                                  ? TDeviceUtils.getScreenWidth(
                                                          context) *
                                                      0.60
                                                  : TDeviceUtils.getScreenWidth(
                                                          context) *
                                                      0.57,
                                              height: isMobileSmall ? 100 : 110,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  FittedBox(
                                                    child: Text(
                                                      'Service Start Time: ${ds["time"]}, ${ds["date"]}',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .apply(
                                                              color: Colors
                                                                  .pinkAccent
                                                                  .shade700),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: isMobileSmall
                                                        ? 180
                                                        : 200,
                                                    child: Text(
                                                      ds["branchTitle"],
                                                      style: isMobileSmall
                                                          ? Theme.of(context)
                                                              .textTheme
                                                              .bodyLarge!
                                                              .apply(
                                                                  heightDelta:
                                                                      -0.2,
                                                                  fontSizeDelta:
                                                                      -1,
                                                                  color: TColors
                                                                      .primary)
                                                          : Theme.of(context)
                                                              .textTheme
                                                              .bodyLarge!
                                                              .apply(
                                                                  heightDelta:
                                                                      -0.2,
                                                                  color: TColors
                                                                      .primary),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 300,
                                                    child: Text(
                                                      ds["service"],
                                                      style: isMobileSmall
                                                          ? Theme.of(context)
                                                              .textTheme
                                                              .bodyLarge!
                                                              .apply(
                                                                  fontSizeDelta:
                                                                      -1)
                                                          : Theme.of(context)
                                                              .textTheme
                                                              .bodyLarge,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Technician:  ${ds["staffName"]}',
                                                    style: isMobileSmall
                                                        ? Theme.of(context)
                                                            .textTheme
                                                            .labelMedium!
                                                            .apply(
                                                                color: TColors
                                                                    .darkGrey)
                                                        : Theme.of(context)
                                                            .textTheme
                                                            .labelLarge!
                                                            .apply(
                                                                color: TColors
                                                                    .darkGrey),
                                                  ),
                                                  // Text(
                                                  //   "${TDeviceUtils.getScreenWidth(context)}",
                                                  //   style: Theme.of(context)
                                                  //       .textTheme
                                                  //       .labelSmall,
                                                  // )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              : Container();
        });
  }

  /// -- Main Widget
  @override
  Widget build(BuildContext context) {
    final isMobileSmall = TDeviceUtils.getScreenWidth(context) <= 393;

    return Scaffold(
      backgroundColor: TColors.secondary, // Colors.grey.shade300
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(TColors.primary),
              ),
            )
          : SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
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
                            isEdit: false,
                            iconColor: Colors.white,
                            showBackgroundColor: true,
                            showIcon: true,
                            isDrawer: true,
                            isNotification: true,
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
                            /// FutureBuilder was extracted to another file
                            const FutureUser(),
                            Text(
                              'BOOK AN APPOINTMENT NOW!',
                              style: isMobileSmall
                                  ? Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .apply(
                                          color: TColors.primary,
                                          letterSpacingDelta: 2)
                                  : Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .apply(
                                          color: TColors.primary,
                                          fontSizeDelta: 2,
                                          letterSpacingDelta: 2),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),

                    Column(
                      children: [
                        /// -- Appointment Item
                        userAppointments(),

                        /// -- Service Categories
                        Container(
                          height: isMobileSmall ? 300 : 315,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: [
                              SizedBox(height: isMobileSmall ? 0 : 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'SERVICE CATEGORIES',
                                    style: isMobileSmall
                                        ? Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .apply(fontSizeDelta: -1)
                                        : Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                  ),

                                  /// -- See All Categories
                                  TextButton(
                                    onPressed: () => Get.to(
                                        () => const ServiceCategoriesSeeAll()),
                                    style: TextButton.styleFrom(
                                      minimumSize: Size(50, 30),
                                      padding: EdgeInsets.zero,
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Text('See All',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),

                              /// -- Services Categories Cards
                              SizedBox(
                                height: 200,
                                child: ListView.separated(
                                  // remove hard edges and fix cropped shadows
                                  clipBehavior: Clip.none,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: availableCategories.length,
                                  itemBuilder: (ctx, index) {
                                    return ServiceCategoryCardListsItem(
                                      service: availableCategories[index],
                                      onSelectedCategory: () {
                                        _selectCategory(context,
                                            availableCategories[index]);
                                      },
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(width: 24);
                                  },
                                ),
                              ),
                              SizedBox(height: 20),

                              /// -- Promos
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('PROMOS',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall),

                                  /// -- See All Categories
                                  TextButton(
                                    onPressed: () => Get.to(
                                        () => const ServiceCategoriesSeeAll()),
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      minimumSize: Size(50, 30),
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Text('See All',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
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

                    // Container(
                    //   padding: const EdgeInsets.symmetric(horizontal: 24),
                    //   decoration: const BoxDecoration(color: Colors.white),
                    //   child:
                    //
                    //       /// -- Product Categories
                    //       Column(
                    //     children: [
                    //       const SizedBox(height: 10),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Text('PRODUCT CATEGORIES',
                    //               style:
                    //                   Theme.of(context).textTheme.headlineSmall),
                    //
                    //           /// -- See All Product Categories
                    //           TextButton(
                    //             onPressed: () =>
                    //                 Get.to(() => const ServiceCategoriesSeeAll()),
                    //             style: TextButton.styleFrom(
                    //               padding: EdgeInsets.zero,
                    //               tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    //               alignment: Alignment.centerRight,
                    //             ),
                    //             child: Text('See All',
                    //                 style: Theme.of(context).textTheme.bodySmall),
                    //           ),
                    //         ],
                    //       ),
                    //       const SizedBox(height: 5),
                    //
                    //       /// -- Services Categories Cards
                    //       SizedBox(
                    //         height: 240,
                    //         child: ListView.separated(
                    //           clipBehavior: Clip.none,
                    //           // remove hard edges and fix cropped shadows
                    //           shrinkWrap: true,
                    //           scrollDirection: Axis.horizontal,
                    //           itemCount: availableCategories.length,
                    //           itemBuilder: (ctx, index) {
                    //             return ServiceCategoryCardListsItem(
                    //               service: availableCategories[index],
                    //               onSelectedCategory: () {
                    //                 _selectCategory(
                    //                     context, availableCategories[index]);
                    //               },
                    //             );
                    //           },
                    //           separatorBuilder:
                    //               (BuildContext context, int index) {
                    //             return const SizedBox(width: 20);
                    //           },
                    //         ),
                    //       ),
                    //       const SizedBox(height: 10),
                    //
                    //       /// -- Shop
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Text('SHOP',
                    //               style:
                    //                   Theme.of(context).textTheme.headlineSmall),
                    //
                    //           /// -- See All Categories
                    //           TextButton(
                    //             onPressed: () =>
                    //                 Get.to(() => const ServiceCategoriesSeeAll()),
                    //             style: TextButton.styleFrom(
                    //               padding: EdgeInsets.zero,
                    //               tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    //               alignment: Alignment.centerRight,
                    //             ),
                    //             child: Text('See All',
                    //                 style: Theme.of(context).textTheme.bodySmall),
                    //           ),
                    //         ],
                    //       ),
                    //
                    //       const SizedBox(height: 10),
                    //     ],
                    //   ),
                    // ),
                    //
                    // /// -- Promos
                    // const NewPromoSlider(
                    //   banners: [
                    //     TImages.newBanner1,
                    //     TImages.newBanner2,
                    //     TImages.newBanner3,
                    //     TImages.newBanner4,
                    //   ],
                    //   isAppBar: false,
                    // ),
                    //
                    // /// -- About the Branches
                    // Container(
                    //   padding: const EdgeInsets.all(24),
                    //   decoration: const BoxDecoration(color: Colors.white),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text('ABOUT THE BRANCHES',
                    //           style: Theme.of(context).textTheme.headlineSmall),
                    //       const SizedBox(height: 16),
                    //       Row(
                    //         children: [
                    //           Material(
                    //             elevation: 5,
                    //             borderRadius: BorderRadius.circular(100),
                    //             child: ClipOval(
                    //               child: Image.asset(
                    //                 'assets/images/content/jbl.webp',
                    //                 width: 100,
                    //                 height: 100,
                    //                 fit: BoxFit.cover,
                    //               ),
                    //             ),
                    //           ),
                    //           const SizedBox(width: 30),
                    //           Material(
                    //             elevation: 5,
                    //             borderRadius: BorderRadius.circular(100),
                    //             child: ClipOval(
                    //               child: Image.asset(
                    //                 'assets/images/content/jss.jpeg',
                    //                 width: 100,
                    //                 height: 100,
                    //                 fit: BoxFit.cover,
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //       const SizedBox(height: 20),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),

      /// -- Drawer
      drawer: const CustomDrawer(),

      floatingActionButton: const CustomChatButton(),
    );
  }
}
