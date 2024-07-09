import 'package:appointment_app/common/widgets/appbar/tabbar.dart';
import 'package:appointment_app/features/shop/screens/catalog/widgets/eye_tab/eye_tab.dart';
import 'package:appointment_app/features/shop/screens/catalog/widgets/facial_tab/facial_tab.dart';
import 'package:appointment_app/features/shop/screens/catalog/widgets/facial_tab/widget/banner_slider.dart';
import 'package:appointment_app/features/shop/screens/catalog/widgets/gluta_tab/gluta_tab.dart';
import 'package:appointment_app/features/shop/screens/catalog/widgets/massage_tab/massage_tab.dart';
import 'package:appointment_app/features/shop/screens/catalog/widgets/slimming_tab/slimming_tab.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../notifications/notifications.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        backgroundColor: TColors.secondary,
        appBar: AppBar(
          title: Image.asset(
            'assets/logos/jbl-logo-removebg-preview.png',
            width: 160,
            fit: BoxFit.contain,
          ),
          automaticallyImplyLeading: false,
          backgroundColor: TColors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: badges.Badge(
                position: badges.BadgePosition.topEnd(top: -10, end: -12),
                showBadge: true,
                ignorePointer: false,
                onTap: () => Get.to(() => const NotificationScreen()),
                badgeContent: Text(
                  '3',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .apply(color: TColors.white),
                ),
                badgeAnimation: const badges.BadgeAnimation.scale(
                  animationDuration: Duration(seconds: 1),
                  colorChangeAnimationDuration: Duration(seconds: 1),
                  loopAnimation: false,
                  curve: Curves.fastOutSlowIn,
                  colorChangeAnimationCurve: Curves.easeInCubic,
                ),
                badgeStyle: const badges.BadgeStyle(badgeColor: TColors.primary),
                child: const Icon(
                  Iconsax.notification,
                  size: 24,
                  color: TColors.primary,
                ),
              ),
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: Colors.white,
                expandedHeight: 400,
                flexibleSpace: Padding(
                  padding:
                      const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 20),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          prefixIcon: const Icon(Iconsax.search_normal),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: TColors.grey,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: TColors.grey,
                              )),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: TColors.grey,
                            ),
                          ),
                          hintText: 'Search',
                          hintStyle: const TextStyle(
                            color: TColors.darkGrey,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      Text(
                        "Featured Promos",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: TColors.accent),
                      ),
                      const SizedBox(height: 20),

                      /// -- Banner Slider
                      const BannerSlider(banners: [
                        TImages.bannerFacial1,
                        TImages.bannerFacial2,
                        TImages.bannerFacial3,
                        TImages.bannerFacial4,
                        TImages.bannerFacial5,
                        TImages.bannerFacial6,
                        TImages.bannerFacial7,
                        TImages.bannerFacial8,
                        TImages.bannerFacial9,
                      ]),
                    ],
                  ),
                ),
                bottom: const TTabBar(
                  tabs: [
                    Tab(
                      child: Text('Facial'),
                    ),
                    Tab(
                      child: Text('Gluta Drips'),
                    ),
                    Tab(
                      child: Text('Massage'),
                    ),
                    Tab(
                      child: Text('Eye'),
                    ),
                    Tab(
                      child: Text('Slimming'),
                    ),
                    Tab(
                      child: Text('Carbon Laser Treatment'),
                    ),
                    Tab(
                      child: Text('Diode Hair Removal'),
                    ),
                    Tab(
                      child: Text('Waxing Hair Removal'),
                    ),
                    Tab(
                      child: Text('Warts Removal'),
                    ),
                  ],
                ),
              )
            ];
          },
          body: TabBarView(
            children: [
              /// -- Facial tab
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: const FacialTab(),
              ),

              /// -- Gluta tab
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: const GlutaTab(),
              ),

              /// -- Massage tab
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: const MassageTab(),
              ),

              /// -- Eye tab
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: const EyeTab(),
              ),

              /// -- Slimming tab
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: const SlimmingTab(),
              ),

              /// -- Carbon Laser Treatment tab
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 24, right: 24),
              ),

              /// -- Diode Hair Removal tab
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: const Center(child: Text('1st Tab')),
              ),

              /// -- Waxing Hair tab
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: const Center(child: Text('1st Tab')),
              ),

              /// -- Warts Removal tab
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: const Center(child: Text('1st Tab')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
