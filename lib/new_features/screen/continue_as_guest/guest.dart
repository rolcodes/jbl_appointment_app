
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_screen_ratio.dart';
import '../../models/data/branch_data.dart';
import '../guest_tab_bar/widget/guest_branch/guest_branch_tab.dart';
import '../guest_tab_bar/widget/guest_service_category/guest_service_category.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({super.key});

  @override
  State<GuestScreen> createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  @override
  Widget build(BuildContext context) {
    final isMobileExtraSmallHeight = CustomScreen.isMobileExtraSmallHeight();
    final isMobileSmallHeight = CustomScreen.isMobileSmallHeight();
    final isMobileMediumHeight = CustomScreen.isMobileMediumHeight();
    final isMobileLargeHeight = CustomScreen.isMobileLargeHeight();
    final isMobileExtraLargeHeight = CustomScreen.isMobileExtraLargeHeight();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: TColors.secondary,
        appBar: AppBar(
          toolbarHeight: 50,
          title: Image.asset(
            'assets/logos/jbl-logo-removebg-preview.png',
            fit: BoxFit.contain,
            width: 120,
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const SizedBox(
              height: 50,
              width: 50,
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: TColors.primary,
                size: 20,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            TabBar(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              indicatorPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: -25),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: TColors.primary,
              ),
              dividerHeight: 2,
              unselectedLabelColor: TColors.accent,
              labelColor: Colors.white,
              splashBorderRadius: BorderRadius.circular(20),
              labelStyle: isMobileExtraSmallHeight ? Theme.of(context).textTheme.labelMedium : Theme.of(context).textTheme.titleMedium,
              tabs: const [
                Tab(
                  child: Text('Branch'),
                ),
                Tab(
                  child: Text('Service'),
                ),
                Tab(
                  child: Text('Product'),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                /// -- 1st tab
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                  child: GuestBranchTab(branches: dummyBranch, title: 'Some Title',),
                ),

                /// -- 2nd tab
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: GuestServiceCategory(),
                ),

                /// -- 3rd tab
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Center(
                    child: Text('No Products Available.'),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
