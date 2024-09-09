import 'package:flutter/material.dart';
import 'package:jbl/common/widgets/images/custom_image_network.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/device/device_screen_ratio.dart';
import '../../../../../models/branch_model.dart';
import '../../../../select_staff/widget/custom_rating_bar_indicator.dart';

class BranchListItem extends StatelessWidget {
  const BranchListItem(
      {super.key, required this.branch, required this.onSelectBranch});

  final BranchClass branch;
  final void Function(BranchClass branch) onSelectBranch;

  @override
  Widget build(BuildContext context) {
    final isMobileExtraSmallHeight = CustomScreen.isMobileExtraSmallHeight();
    final isMobileSmallHeight = CustomScreen.isMobileSmallHeight();
    final isMobileMediumHeight = CustomScreen.isMobileMediumHeight();
    final isMobileLargeHeight = CustomScreen.isMobileLargeHeight();
    final isMobileExtraLargeHeight = CustomScreen.isMobileExtraLargeHeight();

    return Column(
      children: [
        InkWell(
          onTap: () {
            onSelectBranch(branch);
          },
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: TColors.light,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Column(
                    children: [
                      ClipOval(
                        child: CustomImageNetwork(
                            imageUrl: branch.image,
                            width: isMobileExtraSmallHeight
                                ? 70
                                : isMobileSmallHeight
                                    ? 60
                                    : 90,
                            height: isMobileExtraSmallHeight
                                ? 70
                                : isMobileSmallHeight
                                    ? 60
                                    : 90,
                            fit: BoxFit.cover),
                      ),
                      const SizedBox(height: 70),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: isMobileExtraSmallHeight
                              ? 8
                              : isMobileSmallHeight
                                  ? 10
                                  : 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Title
                          Text(branch.title,
                              style: isMobileExtraSmallHeight
                                  ? Theme.of(context).textTheme.titleLarge
                                  : Theme.of(context).textTheme.headlineSmall),

                          /// Location
                          Text(
                            branch.location,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: isMobileExtraSmallHeight ? Theme.of(context).textTheme.labelLarge : null,
                          ),

                          /// Rating
                          const TRatingBarIndicator(rating: 5),

                          /// Clinic Hours
                          Text(
                            branch.weekdayHours,
                            style: isMobileExtraSmallHeight ? Theme.of(context).textTheme.labelLarge : null,
                          ),
                          Text(
                            branch.weekendHours,
                            style: isMobileExtraSmallHeight ? Theme.of(context).textTheme.labelLarge : null,
                          ),

                          // /// Status
                          // Text(
                          //   branch.branchStatus,
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .labelLarge!
                          //       .apply(color: Colors.pinkAccent),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
