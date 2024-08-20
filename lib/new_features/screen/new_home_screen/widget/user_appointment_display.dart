import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/device/device_utility.dart';
import 'my_appointments/my_appointments.dart';

class UserAppointmentDisplay extends StatelessWidget {
  const UserAppointmentDisplay({
    super.key,
    required this.context,
    required this.bookingStream,
  });

  final BuildContext context;
  final Stream? bookingStream;

  @override
  Widget build(BuildContext context) {
    final isMobileSmall = TDeviceUtils.getScreenWidth(context) <= 393;

    return StreamBuilder(
        stream: bookingStream,
        builder: (context, AsyncSnapshot snapshot) {
          // if (snapshot.data == null || snapshot.data.docs.length == 0) {
          //   /// If no data display nothing
          //   return const SizedBox();
          // }

          return
              /// No Data
              snapshot.data == null || snapshot.data.docs.length == 0
                  ? const SizedBox()

                  /// Data
                  : snapshot.hasData
                      ? Container(
                          height: 160,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(color: TColors.white),
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, top: 0, bottom: 0),
                          child: Column(
                            children: [
                              /// -- My Appointments
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            : Theme.of(context)
                                                .textTheme
                                                .titleLarge,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (ctx) =>
                                                CupertinoAlertDialog(
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
                                    onPressed: () => Get.to(
                                        () => const MyAppointmentsScreen()),
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
                              Expanded(
                                child: ListView.builder(
                                  // add null check in data (!) to check if snapshot is 0 then display nothing
                                  // itemCount: snapshot.data.docs.length,
                                  itemCount: 1,
                                  padding: EdgeInsets.zero,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    DocumentSnapshot ds =
                                        snapshot.data.docs[index];

                                    /// -- Condition to remove cancelled, expired and completed status
                                    return Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(10),
                                        onTap: () => Get.to(
                                            () => const MyAppointmentsScreen()),
                                        child: SizedBox(
                                          width: TDeviceUtils.getScreenWidth(
                                              context),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.network(
                                                      ds['image'],
                                                      width: isMobileSmall
                                                          ? 100
                                                          : 110,
                                                      height: isMobileSmall
                                                          ? 100
                                                          : 110,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: SizedBox(
                                                      width: TDeviceUtils.getScreenWidth(context) >=
                                                              430
                                                          ? TDeviceUtils
                                                                  .getScreenWidth(
                                                                      context) *
                                                              0.60
                                                          : TDeviceUtils
                                                                  .getScreenWidth(
                                                                      context) *
                                                              0.57,
                                                      height: isMobileSmall
                                                          ? 100
                                                          : 110,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          FittedBox(
                                                            child: Text(
                                                              'Service Start Time: ${ds["time"]}, ${ds["date"]}',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyMedium!
                                                                  .apply(
                                                                      color: Colors
                                                                          .pinkAccent
                                                                          .shade700),
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: isMobileSmall
                                                                ? 180
                                                                : 200,
                                                            child: Text(
                                                              ds["branchTitle"],
                                                              style: isMobileSmall
                                                                  ? Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodyLarge!
                                                                      .apply(
                                                                          heightDelta:
                                                                              -0.2,
                                                                          fontSizeDelta:
                                                                              -1,
                                                                          color: TColors
                                                                              .primary)
                                                                  : Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodyLarge!
                                                                      .apply(
                                                                          heightDelta:
                                                                              -0.2,
                                                                          color:
                                                                              TColors.primary),
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 300,
                                                            child: Text(
                                                              ds["service"],
                                                              style: isMobileSmall
                                                                  ? Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodyLarge!
                                                                      .apply(
                                                                          fontSizeDelta:
                                                                              -1)
                                                                  : Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodyLarge,
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                          Text(
                                                            'Technician:  ${ds["staffName"]}',
                                                            style: isMobileSmall
                                                                ? Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .labelMedium!
                                                                    .apply(
                                                                        color: TColors
                                                                            .darkGrey)
                                                                : Theme.of(
                                                                        context)
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
}
