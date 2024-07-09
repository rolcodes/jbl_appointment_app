import 'package:appointment_app/admin/screens/home/widget/home_sf_pie_chart.dart';
import 'package:appointment_app/admin/screens/home/widget/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/custom shapes/containers/circular_container.dart';
import '../../../common/widgets/custom shapes/curved_edges/curved_edges_widget.dart';
import '../../../utils/constants/colors.dart';
import 'package:badges/badges.dart' as badges;

import '../Reservations/widget/admin_notifications.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.secondary,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.zero,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              /// Header
              TCurvedEdgeWidget(
                child: Container(
                  color: TColors.accent,

                  /// -- If [size.isFinite': is not true.im Stack] error occured -> Read README.md file
                  child: Stack(
                    children: [
                      /// -- SF Chart
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 580,
                        child: HomeSfPieChart(),
                      ),

                      /// -- Background Custom Shapes
                      Positioned(
                        top: -170,
                        right: -240,
                        child: TCircularContainer(
                            backgroundColor:
                                TColors.textWhite.withOpacity(0.1)),
                      ),
                      Positioned(
                        top: 90,
                        right: -340,
                        child: TCircularContainer(
                            backgroundColor:
                                TColors.textWhite.withOpacity(0.1)),
                      ),
                      Column(
                        children: [
                          TAppBar(
                            title: Text(
                              'Dashboard',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .apply(color: TColors.white),
                            ),
                            actions: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: badges.Badge(
                                  position: badges.BadgePosition.topEnd(
                                      top: -10, end: -12),
                                  showBadge: true,
                                  ignorePointer: false,
                                  onTap: () =>
                                      Get.to(() => const AdminNotifications()),
                                  badgeContent: Text(
                                    '3',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .apply(color: TColors.accent),
                                  ),
                                  badgeAnimation:
                                      const badges.BadgeAnimation.scale(
                                    animationDuration: Duration(seconds: 1),
                                    colorChangeAnimationDuration:
                                        Duration(seconds: 1),
                                    loopAnimation: false,
                                    curve: Curves.fastOutSlowIn,
                                    colorChangeAnimationCurve:
                                        Curves.easeInCubic,
                                  ),
                                  badgeStyle: const badges.BadgeStyle(
                                      badgeColor: TColors.white),
                                  child: const Icon(
                                    Iconsax.notification,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              /// Body
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                height: 240,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        /// -- Users
                        Container(
                          width: 184,
                          height: 110,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 3,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Users',
                                      style:
                                          Theme.of(context).textTheme.titleSmall),
                                  const Icon(Icons.people_outline_rounded, size: 20)
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('1572',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .apply(fontSizeDelta: 6)),
                                  Row(
                                    children: [
                                      Text('+203',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .apply(
                                                  color: Colors.green,
                                                  fontSizeDelta: -2)),
                                      const Icon(Icons.arrow_upward_rounded,
                                          size: 16, color: Colors.green),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),

                        /// -- Revenue
                        Container(
                          width: 184,
                          height: 110,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 3,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Revenue',
                                      style:
                                      Theme.of(context).textTheme.titleSmall),
                                  const Icon(Icons.monetization_on_outlined, size: 20)
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('₱53759',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .apply(fontSizeDelta: 2)),
                                  Row(
                                    children: [
                                      Text('+18743',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .apply(
                                              color: Colors.green,
                                              fontSizeDelta: -6)),
                                      const Icon(Icons.arrow_upward_rounded,
                                          size: 16, color: Colors.green),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        /// -- Completed Bookings
                        Container(
                          width: 184,
                          height: 110,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 3,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  Text('Bookings',
                                      style:
                                      Theme.of(context).textTheme.titleSmall),
                                  const Icon(Icons.collections_bookmark_outlined, size: 20)
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('325',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .apply(fontSizeDelta: 8)),
                                  Row(
                                    children: [
                                      Text('+47',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .apply(
                                              color: Colors.green,
                                              fontSizeDelta: -2)),
                                      const Icon(Icons.arrow_upward_rounded,
                                          size: 16, color: Colors.green),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),

                        /// -- Products
                        Container(
                          width: 184,
                          height: 110,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 3,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Products',
                                      style:
                                      Theme.of(context).textTheme.titleSmall),
                                  const Icon(Icons.production_quantity_limits_rounded, size: 20)
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('66',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .apply(fontSizeDelta: 8)),
                                  Row(
                                    children: [
                                      Text('+10',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .apply(
                                              color: Colors.green,
                                              fontSizeDelta: -2)),
                                      const Icon(Icons.arrow_upward_rounded,
                                          size: 16, color: Colors.green),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
