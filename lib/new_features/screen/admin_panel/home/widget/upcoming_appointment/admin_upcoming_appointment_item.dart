import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jbl/utils/device/device_screen_ratio.dart';

import '../../../../../../common/widgets/images/custom_image_network.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/device/device_utility.dart';

class AdminUpcomingAppointmentItem extends StatelessWidget {
  const AdminUpcomingAppointmentItem({
    super.key,
    required this.ds,
    required this.onSelectedAUpcomingAppointment,
  });

  final DocumentSnapshot<Object?> ds;
  final void Function() onSelectedAUpcomingAppointment;

  @override
  Widget build(BuildContext context) {
    final isMobileSmall = CustomScreen.isMobileSmallWidth(context);
    final isMobileMedium = CustomScreen.isMobileMediumWidth(context);
    final isMobileLarge = CustomScreen.isMobileLargeWidth(context);

    return InkWell(
      onTap: onSelectedAUpcomingAppointment,
      splashColor: Colors.grey.shade300.withOpacity(0.2),
      borderRadius: BorderRadius.circular(20),
      child: Ink(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.amber,
                Colors.amber,
                TColors.primary,
                TColors.primary,
              ],
              stops: [
                0,
                0.2,
                0.8,
                1,
              ]),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upcoming Appointment',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .apply(color: Colors.white, shadows: [
                Shadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 1),
                    blurRadius: 10)
              ]),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0, 1),
                      blurRadius: 4,
                    )
                  ], borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CustomImageNetwork(
                      imageUrl: ds["image"],
                      fit: BoxFit.cover,
                      width: 70,
                      height: 70,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  width: isMobileSmall
                      ? 242
                      : isMobileMedium
                          ? 258
                          : isMobileLarge
                              ? 270
                              : 280,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: isMobileSmall
                                ? 160
                                : isMobileMedium
                                    ? 175
                                    : 190,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                isMobileSmall
                                    ? Text(
                                        ds['service'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .apply(
                                                color: Colors.white,
                                                fontSizeDelta: -2),
                                      )
                                    : Text(
                                        ds['service'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .apply(color: Colors.white),
                                      ),
                                isMobileSmall
                                    ? Text(
                                        ds['price'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .apply(
                                                color: Colors.white,
                                                fontSizeDelta: -2),
                                      )
                                    : Text(
                                        ds['price'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .apply(color: Colors.white),
                                      ),
                              ],
                            ),
                          ),
                          isMobileSmall
                              ? Text(
                                  "Booking ID: ${ds['bookingId']}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .apply(
                                          color: Colors.white,
                                          fontSizeDelta: -2),
                                )
                              : Text(
                                  "Booking ID: ${ds['bookingId']}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .apply(color: Colors.white),
                                ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          isMobileSmall
                              ? Text(
                                  ds['date'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .apply(
                                          color: Colors.white,
                                          fontSizeDelta: -2),
                                )
                              : Text(
                                  ds['date'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .apply(color: Colors.white),
                                ),
                          isMobileSmall
                              ? Text(
                                  ds['time'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .apply(
                                          color: Colors.white,
                                          fontSizeDelta: -2),
                                )
                              : Text(
                                  ds['time'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .apply(color: Colors.white),
                                ),
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
    );
  }
}
