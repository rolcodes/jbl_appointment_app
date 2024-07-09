import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:badges/badges.dart' as badges;

import '../../../../services/database.dart';
import '../../../../utils/constants/colors.dart';
import '../../Reservations/widget/admin_notifications.dart';

class AdminAllBookings extends StatefulWidget {
  const AdminAllBookings({super.key});

  @override
  State<AdminAllBookings> createState() => _AdminAllBookingsState();
}

class _AdminAllBookingsState extends State<AdminAllBookings> {
  Stream? BookingStream;

  getOnTheLoad() async {
    BookingStream = await DatabaseMethods().getAllBookings();
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
                          title: Text(ds["Service"],
                              maxLines: 1, overflow: TextOverflow.ellipsis),
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

  /// Main Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.secondary,
      appBar: AppBar(
        backgroundColor: TColors.secondary,
        title: Text('All Bookings',
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
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Widget of All Bookings
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 10),
              height: 800,
              child: Column(
                children: [
                  /// Widget of All Bookings
                  Expanded(child: allBookings()),
                  SizedBox(height: 18)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
