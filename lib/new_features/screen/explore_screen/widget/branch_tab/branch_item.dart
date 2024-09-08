import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../common/widgets/images/custom_image_network.dart';
import '../../../../../utils/device/device_screen_ratio.dart';
import '../../../../models/branch_model.dart';
import '../../../select_staff/widget/custom_rating_bar_indicator.dart';

class BranchItem extends StatelessWidget {
  const BranchItem(
      {super.key, required this.branch, required this.onSelectBranch});

  final BranchClass branch;
  final void Function(BranchClass branch) onSelectBranch;

  @override
  Widget build(BuildContext context) {
    final isMobileSmallHeight = CustomScreen.isMobileSmallHeight();

    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(20),
      color: TColors.light,
      child: InkWell(
        onTap: () {
          onSelectBranch(branch);
        },
        splashColor: TColors.primary.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 190,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.5)),
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Column(
                children: [
                  ClipOval(
                      child: CustomImageNetwork(
                    imageUrl: branch.image,
                    width: 75,
                    height: 75,
                    fit: BoxFit.cover,
                  )),
                  Expanded(flex: 1, child: SizedBox()),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Title
                      Text(branch.title,
                          style: Theme.of(context).textTheme.headlineSmall),

                      /// Location
                      Text(
                        branch.location,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),

                      /// Rating
                      const TRatingBarIndicator(rating: 4.8),

                      /// Clinic Hours
                      Text(branch.weekdayHours),
                      Text(branch.weekendHours),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
