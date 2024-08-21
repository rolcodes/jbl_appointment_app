import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jbl/new_features/screen/new_home_screen/widget/my_appointments/my_appointment_detail/widget/custom_choicechip.dart';
import 'package:jbl/new_features/screen/new_home_screen/widget/my_appointments/my_appointment_detail/widget/update_select_date.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../common/widgets/appbar/custom_appbar/custom_appbar.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/device/device_screen_ratio.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../../../../select_date/select_date.dart';

class AppointmentsDetail extends StatefulWidget {
  const AppointmentsDetail({super.key, required this.ds});

  final DocumentSnapshot<Object?> ds;

  @override
  State<AppointmentsDetail> createState() => _AppointmentsDetailState();
}

class _AppointmentsDetailState extends State<AppointmentsDetail> {
  /// not working in simulator, we have to use real device
  void _launchURL(Uri uri, bool inApp) async {
    try {
      if (inApp) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      } else {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobileSmallWidth = CustomScreen.isMobileSmallWidth(context);
    final isMobileMediumWidth = CustomScreen.isMobileMediumWidth(context);
    final isMobileLargeWidth = CustomScreen.isMobileLargeWidth(context);

    return Scaffold(
      appBar: CustomAppBar(
        isEdit: false,
        showBackgroundColor: false,
        showIcon: true,
        isDrawer: false,
        iconColor: TColors.primary,
        backgroundColor: TColors.light,
        isNotification: false,
        isCenterTitle: true,
        title: Text('Appointment',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .apply(color: TColors.primary, fontSizeDelta: 2)),
      ),
      backgroundColor: TColors.secondary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              margin: EdgeInsets.only(top: 8),
              padding: const EdgeInsets.only(
                  right: 24, left: 24, top: 24, bottom: 12),
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      ClipOval(
                        child: Image.network(
                          widget.ds['branchImage'],
                          height: isMobileSmallWidth ? 90 : 100,
                          width: isMobileSmallWidth ? 90 : 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: isMobileSmallWidth ? 240 : 260,
                    padding: isMobileMediumWidth
                        ? const EdgeInsets.only(left: 8)
                        : const EdgeInsets.only(left: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.ds['branchTitle'],
                          style: isMobileSmallWidth
                              ? Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .apply(fontSizeDelta: -1)
                              : Theme.of(context).textTheme.headlineSmall,
                          maxLines: 2,
                        ),
                        Text(
                          widget.ds['branchLocation'],
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(widget.ds['branchContact'],
                                style: Theme.of(context).textTheme.bodyMedium),
                            IconButton(
                              padding: EdgeInsets.zero,

                              /// not working in simulator, we have to use real device
                              onPressed: () {},
                              icon: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: TColors.primary,
                                    borderRadius: BorderRadius.circular(100)),
                                child: const Icon(
                                  Icons.call_rounded,
                                  color: Colors.white,
                                  size: 20,
                                ),
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
            const SizedBox(height: 8),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
              height: 230,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Appointment Details",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .apply(fontWeightDelta: 2)),
                  const SizedBox(height: 5),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Technician:",
                          style: Theme.of(context).textTheme.bodyMedium),
                      Text(widget.ds['staffName'],
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),

                  // TODO: Add duration time then calculate end time of appointment
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Schedule:',
                          style: Theme.of(context).textTheme.bodyMedium),
                      Text('${widget.ds['time']}, ${widget.ds["date"]}',
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                color: Colors.pinkAccent.shade700,
                              )),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Payment:",
                          style: Theme.of(context).textTheme.bodyMedium),
                      Text(widget.ds['price'],
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Payment method:",
                          style: Theme.of(context).textTheme.bodyMedium),
                      Text("Pay on-site",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Booking ID:",
                          style: Theme.of(context).textTheme.bodyMedium),
                      Text(widget.ds['bookingId'],
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      widget.ds['image'],
                      width: isMobileSmallWidth ? 110 : 120,
                      height: isMobileSmallWidth ? 110 : 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: isMobileSmallWidth ? 110 : 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: isMobileSmallWidth ? 200 : 220,
                          child: Text(
                            widget.ds['service'],
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .apply(fontSizeDelta: -1),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(widget.ds['duration'],
                            style: Theme.of(context).textTheme.bodyMedium),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(widget.ds['price'],
                                style: Theme.of(context).textTheme.bodyMedium),
                          ),
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

      /// -- Create condition if appointment status is "Approved" or "Cancelled" then display nothing
      bottomNavigationBar: widget.ds['status'] == 'Approved' ||
              widget.ds['status'] == 'Cancelled'
          ? const SizedBox()
          : Container(
              width: MediaQuery.of(context).size.width,
              height: Platform.isAndroid ? 50 : 70,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.orange.shade800, TColors.primary]),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => StatefulBuilder(
                            builder: (context, setState) => Dialog(
                              child: SizedBox(
                                height: 400,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: TColors.light,
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: const EdgeInsets.all(24),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(
                                        width: 220,
                                        child: Text(
                                          'Your feedback matters! \nTell us why you cancelled your appointment.',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      CustomChoiceChip(
                                        dsID: widget.ds.id,
                                        ds: widget.ds,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 75,
                            right: isMobileSmallWidth ? 60 : 75,
                            top: Platform.isAndroid ? 0 : 25,
                            bottom: Platform.isAndroid ? 0 : 25),
                        child: Text(
                          'Cancel',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .apply(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Get.to(() => UpdateSelectDateScreen(ds: widget.ds));
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            left: isMobileSmallWidth
                                ? 40
                                : isMobileMediumWidth
                                    ? 49
                                    : isMobileLargeWidth
                                        ? 60
                                        : 55,
                            right: 60,
                            top: Platform.isAndroid ? 0 : 25,
                            bottom: Platform.isAndroid ? 0 : 25),
                        child: Text(
                          'Reschedule',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .apply(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
