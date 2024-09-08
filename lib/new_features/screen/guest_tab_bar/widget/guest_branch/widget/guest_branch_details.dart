import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jbl/utils/device/device_utility.dart';

import '../../../../../../common/widgets/buttons/custom_guest_book_now_button.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/device/device_screen_ratio.dart';
import '../../../../../models/branch_model.dart';
import '../../../../../models/data/branch_data.dart';
import '../../../../landing_screen/landing_screen.dart';
import '../../../../select_staff/widget/custom_rating_bar_indicator.dart';

class GuestBranchDetailsScreen extends StatelessWidget {
  const GuestBranchDetailsScreen({
    super.key,
    required this.branch,
  });

  final BranchClass branch;

  @override
  Widget build(BuildContext context) {
    final isMobileSmallHeight = CustomScreen.isMobileSmallHeight();
    final isMobileMediumHeight = CustomScreen.isMobileMediumHeight();
    final isMobileLargeHeight = CustomScreen.isMobileLargeHeight();
    final isMobileExtraLargeHeight = CustomScreen.isMobileExtraLargeHeight();

    return Scaffold(
      backgroundColor: TColors.secondary,
      body: SingleChildScrollView(
        child: SizedBox(
          height: isMobileSmallHeight
              ? 920
              : isMobileMediumHeight
                  ? 950
                  : isMobileLargeHeight
                      ? 950
                      : isMobileExtraLargeHeight
                          ? 920
                          : null,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    Image.network(
                      branch.image,
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      fit: BoxFit.cover,
                    ),

                    /// Back Button
                    Positioned(
                      top: 40,
                      left: 10,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: IconButton(
                            onPressed: () => Get.back(),
                            icon: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: TColors.primary,
                              size: 20,
                            )),
                      ),
                    ),

                    /// Overlay Title
                    Positioned(
                      top: 200,
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.65),
                        ),
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          branch.title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .apply(color: Colors.white),
                                        ),
                                      ),
                                      const Expanded(
                                          flex: 1,
                                          child: Align(
                                              alignment: Alignment.centerRight,
                                              child: TRatingBarIndicator(
                                                  rating: 5)))
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      branch.weekdayHours,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .apply(color: TColors.primary, fontSizeDelta: isMobileSmallHeight ? -2 : 0),
                                    ),
                                    Text(
                                      branch.weekendHours,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .apply(color: TColors.primary),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// Details
              Expanded(
                flex: 8,
                child: SizedBox(
                  height: 600,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// Booking Status
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Booking Status:',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .apply(color: TColors.primary),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    branch.branchStatus,
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  )
                                ],
                              ),
                            ),

                            /// Distance
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Distance:',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .apply(color: TColors.primary),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(branch.distance)
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// Location
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Location:',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .apply(color: TColors.primary),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    branch.location,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .apply(heightDelta: 0.2),
                                  )
                                ],
                              ),
                            ),

                            /// Contact
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Contact:',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .apply(color: TColors.primary),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(branch.contact,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        /// Branch Badges
                        Text(
                          'Branch Badges',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .apply(color: TColors.primary),
                        ),
                        const SizedBox(height: 5),
                        Image.asset(
                          'assets/images/content/badgepink.png',
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(height: 10),

                        /// Payments Accepted
                        Text(
                          'Payments Accepted',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .apply(color: TColors.primary),
                        ),
                        const SizedBox(height: 15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            /// GCash
                            Column(
                              children: [
                                Image.asset(
                                  'assets/icons/payment_methods/gcash_app_logo.png',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'GCash',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),

                            /// Maya
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/icons/payment_methods/maya_icon.png',
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Maya',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),

                            /// Credit Card
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/icons/payment_methods/creditcard.png',
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Credit Card',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),

                            /// Cash
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/icons/payment_methods/cash.png',
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Cash',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        /// Available Staff
                        Text(
                          'Available Staff',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .apply(color: TColors.primary),
                        ),
                        const SizedBox(height: 20),
                        //
                        // for (final staff in branch.staffs)
                        //   Column(
                        //     mainAxisSize: MainAxisSize.min,
                        //     children: [
                        //       Image.asset(
                        //           'assets/images/users/default_profile.png',
                        //           width: 100),
                        //       Text(staff),
                        //     ],
                        //   ),

                        /// Staff details inside List View Builder
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            // center the widget
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: dummyBranch.length,
                            itemBuilder: (context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    Image.asset(
                                        'assets/images/users/default_profile.png',
                                        width: 90),
                                    Text(
                                      branch.staffs[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      /// -- Book with Branch
      bottomNavigationBar: const CustomGuestBookNowButton(
        text: 'Book with Branch',
      ),
    );
  }
}
