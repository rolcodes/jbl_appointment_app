import 'package:appointment_app/new_features/models/data/branch_data.dart';
import 'package:appointment_app/new_features/screen/guest_tab_bar/widget/guest_branch/widget/branch_list_item.dart';
import 'package:appointment_app/new_features/screen/guest_tab_bar/widget/guest_branch/widget/guest_branch_details.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../models/branch_model.dart';

class GuestBranchTab extends StatelessWidget {
  const GuestBranchTab(
      {super.key, required this.title, required this.branches});

  final String title;
  final List<BranchClass> branches;

  void selectBranch(BuildContext context, BranchClass branch) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => GuestBranchDetailsScreen(
          branch: branch,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Search Button
        TextField(
          decoration: InputDecoration(
            isDense: true,
            prefixIcon: const Icon(Iconsax.search_normal),
            filled: true,
            fillColor: TColors.light,
            focusColor: TColors.light,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: TColors.grey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: TColors.grey,
                )),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: TColors.grey,
              ),
            ),
            hintText: 'Search',
            hintStyle: const TextStyle(
              color: TColors.darkGrey,
            ),
          ),
        ),
        SizedBox(height: 24),

        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: branches.length,
            itemBuilder: (ctx, index) => BranchListItem(
                branch: branches[index],
                onSelectBranch: (branch) {
                  selectBranch(context, branch);
                }),
          ),
        ),
      ],
    );
  }
}
