import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../../../common/widgets/images/custom_image_network.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/device/device_screen_ratio.dart';
import '../../../../../../../utils/device/device_utility.dart';

class CompletedItem extends StatelessWidget {
  const CompletedItem({
    super.key,
    required this.ds,
    required this.onSelectedCancelledAppointment,
  });

  final DocumentSnapshot<Object?> ds;
  final void Function() onSelectedCancelledAppointment;

  @override
  Widget build(BuildContext context) {
    final isMobileSmall = CustomScreen.isMobileSmallWidth(context);
    final isMobileMedium = CustomScreen.isMobileMediumWidth(context);
    final isMobileSmallHeight = CustomScreen.isMobileSmallHeight();

    /// -- Create condition to display only cancelled appointments in Cancelled Tabs
    return ds['status'] == 'Waiting for approval' ||
            ds['status'] == 'Cancelled' ||
            ds['status'] == 'Approved' ||
            ds['status'] == 'Expired'
        ? const SizedBox()
        : Padding(
            padding: const EdgeInsets.only(top: 20),
            child: InkWell(
              onTap: onSelectedCancelledAppointment,
              child: Container(
                clipBehavior: Clip.none,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: TColors.light,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      offset: Offset(0, 2),
                      blurRadius: 6,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: isMobileSmallHeight ? 200 : 240,
                          child: Text(
                            ds["service"],
                            style: Theme.of(context).textTheme.bodySmall!.apply(
                                fontSizeDelta: isMobileSmallHeight ? -1 : 1,
                                color: Colors.black),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          ds['status'],
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .apply(fontSizeDelta: -2, color: Colors.green),
                        )
                      ],
                    ),
                    SizedBox(
                      child: Divider(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CustomImageNetwork(
                            imageUrl: ds["image"],
                            fit: BoxFit.cover,
                            width: isMobileSmallHeight ? 70 : 110,
                            height: isMobileSmallHeight ? 70 : 110,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 12),
                          width: isMobileSmall
                              ? 210
                              : isMobileMedium
                                  ? 220
                                  : 240,
                          height: isMobileSmall ? 100 : 110,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                child: Text(
                                  ds['branchTitle'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .apply(color: Colors.black),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .apply(
                                          color: TColors.darkGrey,
                                        ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Booking ID: ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .apply(
                                          color: TColors.darkGrey,
                                        ),
                                  ),
                                  Text(
                                    ds['bookingId'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .apply(
                                          color: TColors.darkGrey,
                                        ),
                                  )
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
            ),
          );
  }
}
