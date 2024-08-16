import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jbl/new_features/screen/new_home_screen/widget/chat/custom_chat_button.dart';
import 'package:jbl/new_features/screen/new_home_screen/widget/custom_drawer.dart';
import 'package:jbl/new_features/screen/new_home_screen/widget/custom_sizedbox_height.dart';
import 'package:jbl/new_features/screen/new_home_screen/widget/new_promo_silder.dart';
import 'package:jbl/new_features/screen/new_home_screen/widget/service_categories_see_all.dart';
import 'package:jbl/new_features/screen/new_home_screen/widget/service_category_cards/service_category_cards.dart';
import 'package:jbl/new_features/screen/new_home_screen/widget/service_category_cards/widget/services.dart';
import 'package:jbl/new_features/screen/new_home_screen/widget/user_appointment_display.dart';
import 'package:jbl/utils/device/device_utility.dart';

import '../../../common/widgets/appbar/custom_appbar/custom_appbar.dart';
import '../../../services/database.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../controller/future_user.dart';
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

  /// -- Main Widget
  @override
  Widget build(BuildContext context) {
    final isMobileSmall = TDeviceUtils.getScreenWidth(context) <= 393;

    return Scaffold(
      backgroundColor: TColors.secondary,
      // Colors.grey.shade300
      appBar: CustomAppBar(
        backgroundColor: Colors.white,
        isEdit: false,
        iconColor: Colors.white,
        showBackgroundColor: true,
        showIcon: true,
        isDrawer: true,
        isNotification: true,
        isCenterTitle: true,
        title: Image.asset('assets/logos/jbl-logo.jpg', fit: BoxFit.contain, width: 145,),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(TColors.primary),
              ),
            )
          : SingleChildScrollView(
              child: CustomSizedboxHeight(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 0,
                      child: Container(
                        padding: const EdgeInsets.only(left: 20,right: 20, top: 10),
                        decoration: const BoxDecoration(color: Colors.white),
                        child: const NewPromoSlider(
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
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),

                    Expanded(
                      flex: 0,
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

                    Expanded(
                      flex: 7,
                      child: Column(
                        children: [
                          /// -- Appointment Item
                          UserAppointmentDisplay(context: context, bookingStream: bookingStream),

                          /// -- Service Categories
                          Container(
                            height: isMobileSmall ? 300 : 540,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(height: isMobileSmall ? 15 : 15),
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
                                              .apply(fontSizeDelta: 0)
                                          : Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                    ),

                                    /// -- See All Categories
                                    TextButton(
                                      onPressed: () => Get.to(
                                          () => const ServiceCategoriesSeeAll()),
                                      style: TextButton.styleFrom(
                                        minimumSize: const Size(50, 30),
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
                                  height: 190,
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
                                const SizedBox(height: 20),

                                /// -- Promos
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('PROMOS',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge),

                                    /// -- See All Categories
                                    TextButton(
                                      onPressed: () => Get.to(
                                          () => const ServiceCategoriesSeeAll()),
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        minimumSize: const Size(50, 30),
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
                                SizedBox(height: 10),
                                /// -- Promos
                                const NewPromoSlider(
                                  banners: [
                                    TImages.newBanner5,
                                    TImages.newBanner6,
                                    TImages.newBanner7,
                                    TImages.newBanner8,
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),


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

