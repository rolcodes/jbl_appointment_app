import 'package:flutter/material.dart';
import 'package:jbl/new_features/screen/admin_panel/appointment/tabs/approved_tab/admin_approved_tab.dart';
import 'package:jbl/new_features/screen/admin_panel/appointment/tabs/cancelled_tab/admin_cancelled_tab.dart';
import 'package:jbl/new_features/screen/admin_panel/appointment/tabs/completed_tabs/admin_completed_tab.dart';
import 'package:jbl/new_features/screen/admin_panel/appointment/tabs/expired_tabs/admin_expired_tab.dart';
import 'package:jbl/new_features/screen/admin_panel/appointment/tabs/request_tab/admin_request_tab.dart';
import '../../../../../utils/constants/colors.dart';
import '../widget/admin_chat/admin_custom_chat_button.dart';
import '../widget/appbar/admin_custom_app_bar.dart';

class AdminAppointmentTabs extends StatefulWidget {
  const AdminAppointmentTabs({super.key});

  @override
  State<AdminAppointmentTabs> createState() => _AdminAppointmentTabsState();
}

class _AdminAppointmentTabsState extends State<AdminAppointmentTabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: TColors.secondary,
        appBar: AdminCustomAppBar(
          backgroundColor: TColors.light,
          showBackgroundColor: false,
          showIcon: false,
          isDrawer: true,
          isNotification: true,
          isEdit: false,
          title: Text(
            'Appointments',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .apply(color: TColors.primary, fontSizeDelta: 2),
          ),
          isCenterTitle: true,
        ),
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: TColors.light,

              ),
              padding: const EdgeInsets.only(bottom: 10),
              margin: const EdgeInsets.only(bottom: 8),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                          color: TColors.grey,
                          offset: Offset(0, 1),
                          spreadRadius: 1,
                          blurRadius: 2)
                    ]),
                child: TabBar(
                  labelPadding: EdgeInsets.zero,
                  dividerHeight: 0,
                  padding: EdgeInsets.zero,
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: -8),
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
                  labelStyle: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .apply(fontSizeDelta: 2, fontWeightDelta: 1),
                  unselectedLabelStyle: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .apply(fontSizeDelta: 0),
                  isScrollable: false,
                  tabs: const [
                    Tab(
                      child: Text(' Requests '),
                    ),
                    Tab(
                      child: Text('Approved'),
                    ),
                    Tab(
                      child: Text('Completed'),
                    ),
                    Tab(
                      child: Text(' Expired '),
                    ),
                    Tab(
                      child: Text(' Cancelled '),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  /// -- 1st tab
                  RefreshIndicator(
                    onRefresh: () => Future.delayed(const Duration(seconds: 3)),
                    color: TColors.primary,
                    backgroundColor: Colors.white,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const Center(
                        child: AdminRequestTab(),
                      ),
                    ),
                  ),

                  /// -- 2nd tab
                  RefreshIndicator(
                    onRefresh: () => Future.delayed(const Duration(seconds: 3)),
                    color: TColors.primary,
                    backgroundColor: Colors.white,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const Center(
                        child: AdminApprovedTab(),
                      ),
                    ),
                  ),

                  /// -- 3rd tab
                  RefreshIndicator(
                    onRefresh: () => Future.delayed(const Duration(seconds: 3)),
                    color: TColors.primary,
                    backgroundColor: Colors.white,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const Center(
                        child: AdminCompletedTab(),
                      ),
                    ),
                  ),
                  RefreshIndicator(
                    onRefresh: () => Future.delayed(const Duration(seconds: 3)),
                    color: TColors.primary,
                    backgroundColor: Colors.white,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const Center(
                        child: AdminExpiredTab(),
                      ),
                    ),
                  ),
                  RefreshIndicator(
                    onRefresh: () => Future.delayed(const Duration(seconds: 3)),
                    color: TColors.primary,
                    backgroundColor: Colors.white,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const Center(
                        child: AdminCancelledTab(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: const AdminCustomChatButton(),
      ),
    );
  }
}
