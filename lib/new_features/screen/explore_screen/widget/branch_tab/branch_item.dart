import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../models/branch_model.dart';
import '../../../select_staff/widget/custom_rating_bar_indicator.dart';

class BranchItem extends StatelessWidget {
  const BranchItem(
      {super.key, required this.branch, required this.onSelectBranch});

  final BranchClass branch;
  final void Function(BranchClass branch) onSelectBranch;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelectBranch(branch);
      },
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 190,
          decoration: BoxDecoration(
              color: TColors.light,
              borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Column(
                children: [
                  ClipOval(
                    child: Image.network(
                      branch.image,
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(flex: 1,child: SizedBox()),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
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
