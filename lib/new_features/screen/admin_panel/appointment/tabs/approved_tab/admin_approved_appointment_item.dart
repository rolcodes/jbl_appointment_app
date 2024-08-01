import 'package:appointment_app/services/database.dart';
import 'package:appointment_app/utils/popups/loaders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utils/constants/colors.dart';

class AdminApprovedAppointmentItem extends StatelessWidget {
  const AdminApprovedAppointmentItem(
      {super.key,
      required this.ds,
      required this.onSelectedAllApprovedAppointment});

  final DocumentSnapshot<Object?> ds;
  final void Function() onSelectedAllApprovedAppointment;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectedAllApprovedAppointment,
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
                TextButton(
                  onPressed: () {
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
                            style: Theme.of(context).textTheme.labelLarge,
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
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              Get.back();
                              TLoaders.successSnackBar(
                                  title: 'Done',
                                  message:
                                      'Appointment was moved to requests tab');
                              await DatabaseMethods()
                                  .updateAppointmentStatus(ds['bookingId']);
                            },
                            style: TextButton.styleFrom(
                                overlayColor: TColors.primary),
                            child: Text(
                              'Confirm',
                              style:
                                  Theme.of(context).textTheme.bodyLarge!.apply(
                                        color: CupertinoColors.activeBlue,
                                        fontWeightDelta: 1,
                                      ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: EdgeInsets.zero,
                    minimumSize: Size(50, 20),
                  ),
                  child: Text(
                    ds['status'],
                    style: Theme.of(context).textTheme.bodySmall!.apply(
                          fontSizeDelta: -2,
                          color: CupertinoColors.activeBlue,
                        ),
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
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.grey.shade300, width: 0.5),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            ds["image"],
                            fit: BoxFit.cover,
                            width: 110,
                            height: 110,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Booking ID: ",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .apply(
                                    color: TColors.darkGrey, fontSizeDelta: -2),
                          ),
                          Text(
                            ds['bookingId'],
                            style:
                                Theme.of(context).textTheme.labelLarge!.apply(
                                      color: TColors.darkGrey,
                                    ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 14),
                  width: 280,
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

                      /// Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// -- Cancel Appointment
                          TextButton(
                            style: TextButton.styleFrom(
                              overlayColor: Colors.grey.withOpacity(0.5),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(62, 28),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: BorderSide(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                            ),
                            onPressed: () async {
                              /// -- show snackbar
                              TLoaders.cancelledApprovedSnackBar(
                                title: 'Cancelled',
                                bookingId: ds['bookingId'],
                                context: context,
                              );

                              /// -- update status [Approved]
                              await DatabaseMethods()
                                  .updateAdminCancelledStatus(ds['bookingId']);

                              /// -- add cancel reason [Cancelled by Admin]
                              await DatabaseMethods()
                                  .updateAdminReason(ds['bookingId']);
                            },
                            child: Text(
                              'Cancel',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .apply(fontWeightDelta: 1),
                            ),
                          ),

                          /// -- Expired Appointment
                          TextButton(
                            style: TextButton.styleFrom(
                              overlayColor: Colors.grey.withOpacity(0.5),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(62, 28),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: BorderSide(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                            ),
                            onPressed: () async {
                              /// -- show snackbar
                              TLoaders.expiredSnackBar(
                                title: 'Cancelled',
                                bookingId: ds['bookingId'],
                                context: context,
                              );

                              /// -- update status [Approved]
                              await DatabaseMethods()
                                  .updateAdminCancelledStatus(ds['bookingId']);
                            },
                            child: Text(
                              'Expired',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .apply(fontWeightDelta: 1),
                            ),
                          ),

                          /// -- Completed Appointment
                          TextButton(
                            style: TextButton.styleFrom(
                              overlayColor: Colors.grey.withOpacity(0.5),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              backgroundColor: Colors.green,
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(129, 28),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => CupertinoAlertDialog(
                                  title: Text(
                                    'Complete appointment',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  content: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      'Are you sure you the appointment was complete?',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: ()  async {
                                        Get.back();

                                        /// -- show snackbar
                                        TLoaders.completedSnackBar(
                                            title: 'Approved',
                                            bookingId: ds['bookingId'],
                                            context: context);

                                        /// -- update status [Completed]
                                        await DatabaseMethods()
                                            .updateAdminCompletedStatus(
                                            ds['bookingId']);
                                      },
                                      style: TextButton.styleFrom(
                                          overlayColor: TColors.primary),
                                      child: Text(
                                        'Complete',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .apply(
                                              color: Colors.green.shade700,
                                              fontWeightDelta: 1,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Text(
                              'Complete',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .apply(
                                      color: Colors.white, fontWeightDelta: 1),
                            ),
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
    );
  }
}
