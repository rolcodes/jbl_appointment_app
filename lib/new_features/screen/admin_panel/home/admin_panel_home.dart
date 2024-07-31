import 'package:appointment_app/new_features/screen/admin_panel/home/tabs/approved_tab/admin_approved_tab.dart';
import 'package:appointment_app/new_features/screen/admin_panel/home/tabs/cancelled_tab/admin_cancelled_tab.dart';
import 'package:appointment_app/new_features/screen/admin_panel/home/tabs/completed_tabs/admin_completed_tab.dart';
import 'package:appointment_app/new_features/screen/admin_panel/home/tabs/request_tab/admin_request_tab.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/custom_appbar/custom_appbar.dart';
import '../../../../utils/constants/colors.dart';

class AdminPanelHomeScreen extends StatefulWidget {
  const AdminPanelHomeScreen({super.key});

  @override
  State<AdminPanelHomeScreen> createState() => _AdminPanelHomeScreenState();
}

class _AdminPanelHomeScreenState extends State<AdminPanelHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: TColors.secondary,
        appBar: CustomAppBar(
          backgroundColor: TColors.light,
          showBackgroundColor: false,
          showIcon: false,
          isDrawer: false,
          isNotification: false,
          isEdit: false,
          title: Text(
            'All Appointments',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          isCenterTitle: true,
        ),
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(color: TColors.light),
              padding: EdgeInsets.only(bottom: 10),
              margin: EdgeInsets.only(bottom: 8),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(25)),
                child: TabBar(
                  labelPadding: EdgeInsets.zero,
                  dividerHeight: 0,
                  padding: EdgeInsets.zero,
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: -20),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: TColors.primary.withOpacity(0.5),
                  ),
                  unselectedLabelColor: TColors.black,
                  splashBorderRadius: BorderRadius.circular(25),
                  labelColor: Colors.white,
                  labelStyle: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .apply(fontSizeDelta: -3),
                  isScrollable: false,
                  tabs: const [
                    Tab(
                      child: Text('Requests'),
                    ),
                    Tab(
                      child: Text('Approved'),
                    ),
                    Tab(
                      child: Text('Completed'),
                    ),
                    Tab(
                      child: Text('Expired'),
                    ),
                    Tab(
                      child: Text('Cancelled'),
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
                    child: const Center(
                      child: AdminRequestTab(),
                    ),
                  ),

                  /// -- 2nd tab
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: const Center(
                      child: AdminApprovedTab(),
                    ),
                  ),

                  /// -- 3rd tab
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: const Center(
                      child: AdminCompletedTab(),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: const Center(
                      child: Text('4th Tab'),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: const Center(
                      child: AdminCancelledTab(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
