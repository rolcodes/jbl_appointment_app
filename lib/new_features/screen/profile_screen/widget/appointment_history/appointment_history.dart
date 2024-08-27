import 'package:flutter/material.dart';
import 'package:jbl/new_features/screen/profile_screen/widget/appointment_history/widget/cancelled_tab/cancelled_tab.dart';
import 'package:jbl/new_features/screen/profile_screen/widget/appointment_history/widget/completed_tab/completed_tab.dart';
import 'package:jbl/new_features/screen/profile_screen/widget/appointment_history/widget/expired_tab/expired_tab.dart';

import '../../../../../common/widgets/appbar/custom_appbar/custom_appbar.dart';
import '../../../../../utils/constants/colors.dart';

class AppointmentHistoryScreen extends StatelessWidget {
  const AppointmentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: TColors.secondary,
        appBar: CustomAppBar(
          backgroundColor: TColors.light,
          iconColor: TColors.primary,
          showBackgroundColor: false,
          showIcon: true,
          isDrawer: false,
          isNotification: false,
          isEdit: false,
          isCenterTitle: true,
          title: Text(
            'Appointment History',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .apply(fontSizeDelta: 2, color: TColors.primary),
          ),
        ),
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(color: TColors.light),
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(25)),
                child: TabBar(
                  dividerHeight: 0,
                  indicatorPadding:
                      const EdgeInsets.only(left: -22, right: -21),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: TColors.primary.withOpacity(0.5),
                  ),
                  unselectedLabelColor: TColors.black,
                  splashBorderRadius: BorderRadius.circular(25),
                  labelColor: Colors.white,
                  isScrollable: false,
                  labelStyle: Theme.of(context).textTheme.bodyLarge,
                  unselectedLabelStyle: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(fontSizeDelta: 1),
                  tabs: const [
                    Tab(
                      child: Text(' Cancelled '),
                    ),
                    Tab(
                      child: Text('Completed'),
                    ),
                    Tab(
                      child: Text('    Expired    '),
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
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: const CancelledTab(),
                    ),
                  ),

                  /// -- 2nd tab
                  RefreshIndicator(
                    onRefresh: () => Future.delayed(const Duration(seconds: 3)),
                    color: TColors.primary,
                    backgroundColor: Colors.white,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: const Center(
                        child: CompletedTab(),
                      ),
                    ),
                  ),

                  /// -- 3rd tab
                  RefreshIndicator(
                    onRefresh: () => Future.delayed(const Duration(seconds: 3)),
                    color: TColors.primary,
                    backgroundColor: Colors.white,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: const Center(
                        child: ExpiredTab(),
                      ),
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
