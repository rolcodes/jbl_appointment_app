import 'package:appointment_app/admin/screens/analytics/widget/monthly_bookings/bar_graph/bar_graph.dart';
import 'package:appointment_app/admin/screens/analytics/widget/admin_all_bookings.dart';
import 'package:appointment_app/admin/screens/analytics/widget/pie_chart_small/dart/sf_pie_chart.dart';
import 'package:appointment_app/admin/screens/analytics/widget/weekly_bookings/bar_graph_small.dart';
import 'package:appointment_app/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/colors.dart';
import 'package:badges/badges.dart' as badges;

import '../Reservations/widget/admin_notifications.dart';

class AdminAnalytics extends StatefulWidget {
  const AdminAnalytics({super.key});

  @override
  State<AdminAnalytics> createState() => _AdminAnalyticsState();
}

class _AdminAnalyticsState extends State<AdminAnalytics> {
  Stream? BookingStream;

  getOnTheLoad() async {
    // BookingStream = await DatabaseMethods().getAllBookings();
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  /// -- Widget for Data Analytics
  Widget allBookings() {
    return StreamBuilder(
        stream: BookingStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return

                        /// Booking Items
                        Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          leading: ClipOval(
                              child: Image.asset(
                                ds["Image"],
                                fit: BoxFit.cover,
                                width: 50,
                              )),
                          title: Text(
                            ds["Service"],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          subtitle: Text(
                            "${ds["Username"]} • ${ds["Date"]} • ${ds["Time"]}",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          trailing: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(ds["Reference"]),
                              Text(
                                ds["Booking ID"],
                                style: const TextStyle(color: TColors.primary),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })
              : Container();
        });
  }

  /// List of bookings from June to November
  List<double> monthlySummary = [
    40.40,
    60.50,
    42.42,
    20.50,
    70.20,
    88.99,
  ];

  List<double> weeklySummary = [
    20.40,
    40.50,
    30.42,
    70.50,
    90.20,
    78.99,
    50.10,
  ];

  /// -- Main Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.secondary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: TColors.secondary,
        title: Text('Analytics',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .apply(color: TColors.accent)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: badges.Badge(
              position: badges.BadgePosition.topEnd(top: -10, end: -12),
              showBadge: true,
              ignorePointer: false,
              onTap: () => Get.to(() => const AdminNotifications()),
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
              badgeStyle: const badges.BadgeStyle(badgeColor: TColors.accent),
              child: const Icon(
                Iconsax.notification,
                size: 24,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            /// Bar Chart
            Container(
              height: 240,
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                color: TColors.lightGrey,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: MyBarGraph(
                monthlySummary: monthlySummary,
              ),
            ),
            const SizedBox(height: 20),

            /// -- 2 Small Chart
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      bottom: 20, left: 10, right: 10, top: 10),
                  width: 184,
                  height: 184,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 3,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),

                  /// Bar Chart
                  child: BarGraphSmall(
                    weeklySummary: weeklySummary,
                  ),
                ),
                Container(
                  width: 184,
                  height: 184,
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 3,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: SfPieChart(),
                ),
              ],
            ),
            SizedBox(height: 5),

            /// -- Title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Bookings',
                    style: Theme.of(context).textTheme.headlineSmall),
                TextButton(
                  onPressed: () => Get.to(const AdminAllBookings()),
                  child: Text('View all',
                      style: Theme.of(context).textTheme.labelMedium),
                ),
              ],
            ),

            /// Widget of All Bookings
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SizedBox(
                height: 214,
                child: allBookings(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
