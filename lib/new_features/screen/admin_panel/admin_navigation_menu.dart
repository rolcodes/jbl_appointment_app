import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jbl/new_features/screen/admin_panel/search/search_screen.dart';

import '../../../utils/constants/colors.dart';
import 'appointment/admin_appointment_tabs.dart';
import 'home/admin_home.dart';
import 'home/widget/admin_custom_drawer.dart';

class NewAdminNavigationMenu extends StatefulWidget {
  const NewAdminNavigationMenu({super.key});

  @override
  State<NewAdminNavigationMenu> createState() => _NewAdminNavigationMenuState();
}

class _NewAdminNavigationMenuState extends State<NewAdminNavigationMenu> {
  /// variable selected or current index
  int currentPageIndex = 0;
  List screenList = [
    const AdminPanelHome(),
    const AdminSearchScreen(),
    const AdminAppointmentTabs(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList.elementAt(currentPageIndex),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.only(top: Platform.isAndroid ? 0 : 10),
        child: NavigationBar(
          height: Platform.isAndroid ? 60 : 50,
          overlayColor: WidgetStatePropertyAll(Colors.amberAccent.shade100),
          indicatorColor: TColors.primary.withOpacity(0.2),
          animationDuration: const Duration(milliseconds: 1500),
          backgroundColor: TColors.white,
          onDestinationSelected: (value) {
            setState(() {
              currentPageIndex = value;
            });
          },
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          selectedIndex: currentPageIndex,
          indicatorShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(
                Icons.home_rounded,
                color: TColors.primary,
              ),
              icon: Icon(
                Icons.home_rounded,
                color: TColors.darkGrey,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.search_rounded,
                color: TColors.primary,
              ),
              icon: Icon(
                Icons.search_rounded,
                color: TColors.darkGrey,
              ),
              label: 'Search',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.calendar_month_rounded,
                color: TColors.primary,
              ),
              icon: Icon(
                Icons.calendar_month_rounded,
                color: TColors.darkGrey,
              ),
              label: 'Appointments',
            ),

          ],
        ),
      ),

      /// -- Drawer
      drawer: const AdminCustomDrawer(),
    );
  }
}
