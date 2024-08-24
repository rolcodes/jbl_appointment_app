import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../common/widgets/appbar/custom_appbar/custom_appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../models/staff_model.dart';
import '../../landing_screen/non_screen_widget/gradient_button.dart';
import 'custom_overall_product_rating.dart';
import 'custom_rating_bar_indicator.dart';

class StaffDetails extends StatelessWidget {
  const StaffDetails({super.key, required this.staff});

  final StaffModel staff;

  @override
  Widget build(BuildContext context) {
    final isMobileSmall = TDeviceUtils.getScreenWidth(context) <= 393;

    return Scaffold(
      backgroundColor: TColors.secondary,
      appBar: CustomAppBar(
        isEdit: false,
        showBackgroundColor: false,
        showIcon: true,
        isDrawer: false,
        isNotification: false,
        isCenterTitle: true,
        iconColor: TColors.primary,
        title: Text(
          'Staff Details',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .apply(fontSizeDelta: 2, color: TColors.primary),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: TDeviceUtils.getScreenHeight(),
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.network(
                  staff.image,
                  width: 110,
                  height: 110,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 25),
              GradientButton(
                text: staff.staffName,
                color: [Colors.orange.shade800, TColors.primary],
                width: 300,
                height: 40,
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          Icon(Icons.location_on, color: TColors.primary),
                          Text(staff.location,
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Icon(Icons.check_circle, color: TColors.primary),
                          Text(staff.position,
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              GradientButton(
                text: 'Book an Appointment',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .apply(color: Colors.white),
                color: [Colors.green.shade600, Colors.lime.shade700],
                width: 220,
                height: 40,
                onPressed: () {},

                /// Redirect to Service Categories Grid Item
              ),
              SizedBox(height: 25),
              Text('Overall Rating',
                  style: Theme.of(context).textTheme.headlineSmall),
              SizedBox(height: 20),
              TOverallProductRating(rating: staff.rating),
              SizedBox(height: 20),
              Text('Reviews', style: Theme.of(context).textTheme.headlineSmall),
              SizedBox(height: 20),

              /// -- User Review
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/images/users/user2.jpeg',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Maria Gonzales',
                                  style: isMobileSmall
                                      ? Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .apply(fontSizeDelta: -2)
                                      : Theme.of(context).textTheme.titleMedium,
                                ),
                                TRatingBarIndicator(rating: staff.rating)
                              ],
                            ),
                            Text(
                              'June 24, 2024',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            SizedBox(height: 10),
                            ReadMoreText(
                              'Lorem ipsum dolor sit amet, conse adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                              trimMode: TrimMode.Line,
                              trimLines: 2,
                              colorClickableText: TColors.primary,
                              trimCollapsedText: 'Show more',
                              trimExpandedText: 'Show less',
                              moreStyle: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .apply(color: TColors.primary),
                              lessStyle: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .apply(color: TColors.primary),
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              /// See all reviews
              TextButton(
                style: TextButton.styleFrom(
                  overlayColor: TColors.primary,
                ),
                onPressed: () {},
                child: Text(
                  'See all reviews',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .apply(color: TColors.primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
