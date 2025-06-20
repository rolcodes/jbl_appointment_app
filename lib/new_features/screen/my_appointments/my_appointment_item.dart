import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jbl/common/widgets/images/custom_image_network.dart';
import 'package:jbl/utils/device/device_utility.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_screen_ratio.dart';

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
    final isMobileSmallHeight = CustomScreen.isMobileSmallHeight();
    final isMobileMediumHeight = CustomScreen.isMobileMediumHeight();
    final isMobileLargeHeight = CustomScreen.isMobileLargeHeight();
    final isMobileExtraLargeHeight = CustomScreen.isMobileExtraLargeHeight();

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
                    isMobileSmallHeight
                        ? Text(
                            'Jevelme Beauty Lounge',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .apply(fontSizeDelta: -2),
                            overflow: TextOverflow.ellipsis,
                          )
                        : Text(
                            'Jevelme Beauty Lounge',
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                                fontSizeDelta: isMobileSmallHeight ? -3 : -1),
                            overflow: TextOverflow.ellipsis,
                          ),

                    /// -- Appointment Status Update
                    ds['status'] == 'Waiting for approval'
                        ? Text(ds['status'],
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                                fontSizeDelta: isMobileSmallHeight ? -6 : -3,
                                color: Colors.grey))
                        : Text(ds['status'],
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                                fontSizeDelta: isMobileSmallHeight ? -4 : -3,
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
                        color: Colors.pinkAccent.shade700, fontSizeDelta: -1),
                    maxLines: 1,
                  ),
                ),
              ),
              Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CustomImageNetwork(
                          imageUrl: ds['image'],
                          width: isMobileSmallHeight
                              ? 85
                              : isMobileMediumHeight
                                  ? 95
                                  : isMobileLargeHeight
                                      ? 105
                                      : isMobileExtraLargeHeight
                                          ? 110
                                          : 115,
                          height: isMobileSmallHeight
                              ? 85
                              : isMobileMediumHeight
                                  ? 95
                                  : isMobileLargeHeight
                                      ? 105
                                      : isMobileExtraLargeHeight
                                          ? 110
                                          : 115,
                          fit: BoxFit.cover)),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: SizedBox(
                      width: isMobileSmallHeight
                          ? 170
                          : isMobileMediumHeight
                              ? 195
                              : isMobileLargeHeight
                                  ? 210
                                  : isMobileExtraLargeHeight
                                      ? 220
                                      : 220,
                      height: 110,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              ds["service"],
                              style: Theme.of(context).textTheme.bodyLarge,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
