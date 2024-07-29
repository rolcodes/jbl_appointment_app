import 'package:flutter/material.dart';

import '../../../common/widgets/appbar/custom_appbar/custom_appbar.dart';
import '../../../utils/constants/colors.dart';

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
          backgroundColor: TColors.white,
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
              height: 52,
              decoration: const BoxDecoration(
                color: Colors.white
              ),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(25)),
                child: TabBar(
                  dividerHeight: 0,
                  padding: EdgeInsets.zero,
                  indicatorPadding:
                      const EdgeInsets.symmetric(horizontal: -20),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: TColors.primary.withOpacity(0.5),
                  ),
                  unselectedLabelColor: TColors.black,
                  splashBorderRadius: BorderRadius.circular(25),
                  labelColor: Colors.white,
                  isScrollable: false,
                  tabs: [
                    Tab(
                      child: Text(
                        'Requests',
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .apply(fontSizeDelta: -2),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Approved',
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .apply(fontSizeDelta: -2),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Completed',
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .apply(fontSizeDelta: -4, fontWeightDelta: 1),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Expired',
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .apply(fontSizeDelta: -2),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Cancelled',
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .apply(fontSizeDelta: -3),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  /// -- 1st tab
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: const Center(
                      child: Text('1st Tab'),
                    ),
                  ),

                  /// -- 2nd tab
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: const Center(
                      child: Text('2nd Tab'),
                    ),
                  ),

                  /// -- 3rd tab
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: const Center(
                      child: Text('3rd Tab'),
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
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: const Center(
                      child: Text('5th Tab'),
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
