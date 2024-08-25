
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../common/widgets/images/custom_image_network.dart';
import '../../../../../../services/database.dart';
import '../../../../../../utils/device/device_screen_ratio.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../../../../../../utils/popups/loaders.dart';

class AdminExpiredAppointmentItem extends StatelessWidget {
  const AdminExpiredAppointmentItem(
      {super.key,
        required this.ds,
        required this.onSelectedAllExpiredAppointment});

  final DocumentSnapshot<Object?> ds;
  final void Function() onSelectedAllExpiredAppointment;

  @override
  Widget build(BuildContext context) {
    final isMobileSmall = CustomScreen.isMobileSmallWidth(context);
    final isMobileMedium = CustomScreen.isMobileMediumWidth(context);

    return InkWell(
      onTap: onSelectedAllExpiredAppointment,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: TColors.light,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    ds["service"],
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(fontSizeDelta: 1, color: Colors.black),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                /// -- Approved Status
                Text(
                  ds['status'],
                  style: Theme.of(context).textTheme.bodySmall!.apply(
                    fontSizeDelta: -2,
                    color: Colors.orange.shade600,
                  ),
                )
              ],
            ),
            const SizedBox(height: 2),
            SizedBox(
                child: Divider(
                  color: Colors.grey.shade300,
                )),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 160,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: isMobileSmall ? 100 : 110,
                        width: isMobileSmall ? 100 : 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.grey.shade300, width: 0.5),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CustomImageNetwork(
                            imageUrl: ds["image"],
                            fit: BoxFit.cover,
                            width: isMobileSmall ? 100 : 110,
                            height: isMobileSmall ? 100 : 110,
                          ),
                        ),
                      ),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.fromBorderSide(
                            BorderSide(
                              width: 1,
                              color: Colors.grey.shade300.withOpacity(1),
                            ),
                          ),
                        ),
                        child: IconButton(
                          style: IconButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                          onPressed: () {
                            /// -- Dialog Box
                            showDialog(
                              context: context,
                              builder: (ctx) => CupertinoAlertDialog(
                                title: Text(
                                  'Put to requests',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                content: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Are you sure you want to put back this appointment to requests tab?',
                                    style:
                                    Theme.of(context).textTheme.labelLarge,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    style: TextButton.styleFrom(
                                        overlayColor: TColors.primary),
                                    child: Text(
                                      'Cancel',
                                      style:
                                      Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      Get.back();
                                      TLoaders.undoCancelledToRequestsSnackBar(
                                        title: 'Done',
                                        message:
                                        'Appointment was moved to requests tab',
                                        bookingId: ds['bookingId'],
                                        context: context,
                                      );
                                      await DatabaseMethods()
                                          .updateAppointmentStatus(
                                          ds['bookingId']);
                                    },
                                    style: TextButton.styleFrom(
                                        overlayColor: TColors.primary),
                                    child: Text(
                                      'Confirm',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .apply(
                                        fontWeightDelta: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          icon: Icon(Icons.more_horiz, size: 20, color: Colors.black,),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 14),
                  width: isMobileSmall
                      ? 252
                      : isMobileMedium
                      ? 260
                      : 280,
                  height: 160,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ds['name'],
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .apply(color: Colors.black),
                          ),
                          Text(
                            ds['telephone'],
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .apply(color: TColors.black, fontSizeDelta: -2),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Email:',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: TColors.darkGrey),
                          ),
                          Text(
                            ds['email'],
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: TColors.darkGrey),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Schedule:',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: TColors.darkGrey),
                          ),
                          Text(
                            "${ds['date']}, ${ds['time']}",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: TColors.darkGrey),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Technician:",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: TColors.darkGrey),
                          ),
                          Text(
                            ds['staffName'],
                            style:
                            Theme.of(context).textTheme.labelLarge!.apply(
                              color: TColors.darkGrey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Booking ID: ",
                            style:
                            Theme.of(context).textTheme.labelLarge!.apply(
                              color: TColors.darkGrey,
                            ),
                          ),
                          Text(
                            ds['bookingId'],
                            style:
                            Theme.of(context).textTheme.labelLarge!.apply(
                              color: TColors.darkGrey,
                            ),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
