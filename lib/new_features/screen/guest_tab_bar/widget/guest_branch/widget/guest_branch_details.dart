import 'dart:ui';

import 'package:appointment_app/common/widgets/products/product_cards/widget/rating_indicator.dart';
import 'package:appointment_app/new_features/models/branch_model.dart';
import 'package:appointment_app/new_features/models/data/branch_data.dart';
import 'package:appointment_app/new_features/screen/landing_screen/landing_screen.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GuestBranchDetailsScreen extends StatelessWidget {
  const GuestBranchDetailsScreen({
    super.key,
    required this.branch,
  });

  final BranchClass branch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.secondary,
      body: Stack(
        children: [
          Positioned(
            top: 56,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Image
                  Image.network(
                    branch.image,
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    fit: BoxFit.cover,
                  ),

                  /// Details
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: SingleChildScrollView(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      )
                                    ],
                                  ),
                                ),

                                /// Distance
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
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
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
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
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
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
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
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

          /// Back Button
          Positioned(
            top: 65,
            left: 10,
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: TColors.primary,
                    size: 25,
                  )),
            ),
          ),

          /// Overlay Title
          Positioned(
            top: 266,
            child: Container(
              height: 90,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.65),
              ),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 250,
                            child: Text(
                              branch.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .apply(color: Colors.white),
                            ),
                          ),
                          const TRatingBarIndicator(rating: 5)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            branch.weekdayHours,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(color: TColors.primary),
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

      /// -- Book with Branch
      bottomNavigationBar: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (ctx) => CupertinoAlertDialog(
                    title: Text('Register now!',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .apply(color: Colors.black)),
                    content: Text(
                        'You need to log in or register to book a service. Would you like to proceed?',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: Colors.black)),
                    actions: [
                      TextButton(
                        child: Text("NO",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: Colors.black)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text("YES",
                            style: Theme.of(context).textTheme.bodyMedium),
                        onPressed: () {
                          Get.offAll(() => const LandingScreen());
                        },
                      ),
                    ],
                  ));
        },
        child: Container(
          height: 65,
          decoration: const BoxDecoration(
            color: TColors.primary,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Book with Branch',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .apply(color: Colors.white),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
