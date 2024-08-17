import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jbl/utils/device/device_utility.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/device/device_screen_ratio.dart';

class MyAppointmentItem extends StatelessWidget {
  const MyAppointmentItem({
    super.key,
    required this.ds,
    required this.onSelectedAppointment,
  });

  final DocumentSnapshot<Object?> ds;
  final void Function() onSelectedAppointment;

  @override
  Widget build(BuildContext context) {
    final isMobileSmall = CustomScreen.isMobileSmallWidth(context);
    final isMobileMedium = CustomScreen.isMobileMediumWidth(context);

    return Material(
        elevation: 3,
        color: TColors.light,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onSelectedAppointment,
          child: Container(
            height: 220,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: TDeviceUtils.getScreenWidth(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isMobileSmall ? Text(
                        'Jevelme Beauty Lounge',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(fontSizeDelta: -2),
                        overflow: TextOverflow.ellipsis,
                      ) : Text(
                        'Jevelme Beauty Lounge',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(fontSizeDelta: -1),
                        overflow: TextOverflow.ellipsis,
                      ),

                      /// -- Appointment Status Update
                      ds['status'] == 'Waiting for approval'
                          ? Text(ds['status'],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .apply(
                                      fontSizeDelta: -3, color: Colors.grey))
                              : Text(ds['status'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .apply(
                                          fontSizeDelta: -3,
                                          color: Colors.blue)),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      'Service Start Time: ${ds["time"]}, ${ds["date"]}',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: Colors.pinkAccent.shade700,
                          fontSizeDelta: -1),
                      maxLines: 1,
                    ),
                  ),
                ),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        ds['image'],
                        width: isMobileSmall ? 100 : 110,
                        height: isMobileSmall ? 100 : 110,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: SizedBox(
                        width: isMobileSmall ? 192 : isMobileMedium ? 200 : 220,
                        height: 110,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Text(
                                ds["service"],
                                style:
                                    Theme.of(context).textTheme.bodyLarge,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Technician: ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .apply(color: TColors.darkGrey),
                                ),
                                Text(
                                  ds["staffName"],
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .apply(color: TColors.darkGrey),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Contact: ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .apply(color: TColors.darkGrey),
                                ),
                                Text(
                                  ds["branchContact"],
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .apply(color: TColors.darkGrey),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Booking ID: ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .apply(color: TColors.darkGrey),
                                ),
                                Text(
                                  ds["bookingId"],
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .apply(color: TColors.darkGrey),
                                ),
                              ],
                            ),
                            Align(
                              alignment: AlignmentDirectional.bottomEnd,
                              child: Text(
                                'Price:  ${ds["price"]}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(fontSizeDelta: 0),
                              ),
                            ),
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
  }
}
