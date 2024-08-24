import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jbl/new_features/screen/explore_screen/widget/branch_tab/branch_item.dart';
import 'package:jbl/new_features/screen/guest_tab_bar/widget/guest_branch/widget/guest_branch_details.dart';
import 'package:jbl/utils/device/device_screen_ratio.dart';
import 'package:jbl/utils/device/device_utility.dart';

import '../../../../../common/widgets/textfield/custom_search_button.dart';
import '../../../../models/branch_model.dart';
import 'branch_detail.dart';

class BranchTab extends StatelessWidget {
  const BranchTab({super.key, required this.branches});

  final List<BranchClass> branches;

  void selectBranch(BuildContext context, BranchClass branch) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => BranchDetailScreen(
          branch: branch,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobileExtraLarge = CustomScreen.isMobileExtraLargeHeight();

    return SingleChildScrollView(
      child: SizedBox(
        width: TDeviceUtils.getScreenWidth(context),
        height: isMobileExtraLarge ? 900 : null,
        child: Column(
          children: [
            const CustomSearchButton(),
            const SizedBox(height: 24),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: branches.length,
                  itemBuilder: (ctx, index) => BranchItem(
                      branch: branches[index],
                      onSelectBranch: (branch) {
                        selectBranch(context, branch);
                      }),
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

