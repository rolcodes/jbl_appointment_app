import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../../../common/widgets/appbar/custom_appbar/custom_appbar.dart';
import '../../../../../../../common/widgets/images/custom_image_network.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/device/device_screen_ratio.dart';

class ExpiredAppointmentDetail extends StatefulWidget {
  const ExpiredAppointmentDetail({super.key, required this.ds});

  final DocumentSnapshot<Object?> ds;

  @override
  State<ExpiredAppointmentDetail> createState() =>
      _CancelledAppointmentDetail();
}

class _CancelledAppointmentDetail extends State<ExpiredAppointmentDetail> {
  @override
  Widget build(BuildContext context) {
    final isMobileSmall = CustomScreen.isMobileSmallWidth(context);
    final isMobileMedium = CustomScreen.isMobileMediumWidth(context);

    return Scaffold(
      appBar: CustomAppBar(
        isEdit: false,
        showBackgroundColor: false,
        showIcon: true,
        isDrawer: false,
        isNotification: false,
        isCenterTitle: true,
        title: Text(
          'Completed Appointment',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      backgroundColor: TColors.secondary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              padding: const EdgeInsets.only(
                  right: 24, left: 24, top: 24, bottom: 12),
              decoration: const BoxDecoration(color: TColors.light),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      ClipOval(
                        child: CustomImageNetwork(
                          imageUrl: widget.ds['branchImage'],
                          fit: BoxFit.cover,
                          height: isMobileSmall ? 90 : 100,
                          width: isMobileSmall ? 90 : 100,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 260,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.ds['branchTitle'],
                          style: Theme.of(context).textTheme.headlineSmall,
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
              decoration: const BoxDecoration(color: TColors.light),
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
                  SizedBox(height: 5),

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
                    child: CustomImageNetwork(
                      imageUrl: widget.ds['image'],
                      width: isMobileSmall ? 110 : 120,
                      height: isMobileSmall ? 110 : 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 220,
                          child: Text(
                            widget.ds['service'],
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .apply(fontSizeDelta: -1),
                            maxLines: 2,
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
    );
  }
}
