import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/widgets/images/custom_image_network.dart';
import '../../../../../../services/database.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/device/device_screen_ratio.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../../../../../../utils/popups/loaders.dart';

class AdminAppointmentItem extends StatelessWidget {
  const AdminAppointmentItem(
      {super.key,
      required this.ds,
      required this.onSelectedAllRequestAppointment});

  final DocumentSnapshot<Object?> ds;
  final void Function() onSelectedAllRequestAppointment;

  @override
  Widget build(BuildContext context) {
    final isMobileSmall = CustomScreen.isMobileSmallWidth(context);
    final isMobileSmallHeight = CustomScreen.isMobileSmallHeight();
    final isMobileMediumHeight = CustomScreen.isMobileMediumHeight();
    final isMobileLargeHeight = CustomScreen.isMobileLargeHeight();
    final isMobileExtraLargeHeight = CustomScreen.isMobileExtraLargeHeight();

    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(20),
        color: TColors.white,
        child: InkWell(
          onTap: onSelectedAllRequestAppointment,
          splashColor: TColors.primary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 90,
                      width: 90,
                      child: Container(
                        height: isMobileSmall ? 80 : 90,
                        width: isMobileSmall ? 80 : 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.grey.withOpacity(0.5), width: 0.5),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CustomImageNetwork(
                            imageUrl: ds["image"],
                            fit: BoxFit.cover,
                            width: isMobileSmall ? 80 : 90,
                            height: isMobileSmall ? 80 : 90,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 14),
                      width: isMobileSmallHeight
                          ? 210
                          : isMobileMediumHeight
                              ? 220
                              : isMobileLargeHeight
                                  ? 240
                                  : isMobileExtraLargeHeight
                                      ? 260
                                      : null,
                      height: 90,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ds['service'],
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .apply(color: Colors.black),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ds['name'],
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .apply(color: Colors.black),
                              ),
                              Text(
                                ds['email'],
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .apply(
                                        color: TColors.darkGrey,
                                        fontSizeDelta: -2),
                              ),
                            ],
                          ),
                          Text(
                            ds['bookingId'] +
                                "   ${ds['date']}, ${ds['time']}   " +
                                ds["price"],
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: TColors.darkGrey),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}
