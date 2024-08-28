import 'package:flutter/material.dart';
import 'package:jbl/new_features/models/data/branch_data.dart';
import 'package:jbl/new_features/models/data/dummy_data.dart';
import 'package:jbl/new_features/screen/explore_screen/widget/branch_tab/branch_tab.dart';
import 'package:jbl/new_features/screen/explore_screen/widget/services_category_tab/services_category_tab.dart';
import 'package:jbl/new_features/screen/explore_screen/widget/staff_tab/staff_tab.dart';

import '../../../../common/widgets/appbar/custom_appbar/custom_appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../utils/device/device_screen_ratio.dart';
import '../new_home_screen/widget/chat/custom_chat_button.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: TColors.secondary.withOpacity(0.5),
        appBar: CustomAppBar(
          backgroundColor: TColors.white,
          isEdit: false,
          isCenterTitle: true,
          iconColor: TColors.primary,
          showBackgroundColor: false,
          showIcon: false,
          isDrawer: false,
          isNotification: true,
          title: Image.asset(
            'assets/logos/jbl-logo.jpg',
            fit: BoxFit.contain,
            width: 145,
          ),
        ),
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                decoration: BoxDecoration(
                    color: TColors.light,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                          color: TColors.grey,
                          offset: Offset(0, 1),
                          spreadRadius: 0.5,
                          blurRadius: 2)
                    ]),
                child: TabBar(
                  dividerHeight: 0,
                  indicatorPadding:
                      const EdgeInsets.only(left: -22, right: -21),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                      color: Colors.amber.shade50,
                      boxShadow: [
                        BoxShadow(
                            color: TColors.grey,
                            offset: const Offset(0, 1),
                            spreadRadius: 0.5,
                            blurRadius: 1)
                      ]),
                  unselectedLabelColor: TColors.black,
                  splashBorderRadius: BorderRadius.circular(25),
                  labelColor: TColors.primary,
                  isScrollable: false,
                  labelStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .apply(fontWeightDelta: 1),
                  unselectedLabelStyle: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(fontSizeDelta: 1),
                  tabs: const [
                    Tab(
                      child: Text('   Services   '),
                    ),
                    Tab(
                      child: Text('     Branch     '),
                    ),
                    Tab(
                      child: Text('       Staff       '),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  /// -- 1st tab
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const ServicesCategoryTab(),
                  ),

                  /// -- 2nd tab
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const BranchTab(branches: dummyBranch),
                  ),

                  /// -- 3rd tab
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const StaffTab(
                          services: dummyServices, staff: dummyStaff)),
                ],
              ),
            )
          ],
        ),
        floatingActionButton: const CustomChatButton(),
      ),
    );
  }
}
