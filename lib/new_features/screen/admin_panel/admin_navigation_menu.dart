import 'package:appointment_app/features/shop/screens/catalog/catalog.dart';
import 'package:appointment_app/new_features/screen/admin_panel/home/admin_panel_home.dart';
import 'package:appointment_app/new_features/screen/new_home_screen/new_home_screen.dart';
import 'package:appointment_app/new_features/screen/new_home_screen/widget/custom_drawer.dart';
import 'package:appointment_app/new_features/screen/profile_screen/profile.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class NewAdminNavigationMenu extends StatefulWidget {
  const NewAdminNavigationMenu({super.key});

  @override
  State<NewAdminNavigationMenu> createState() => _NewAdminNavigationMenuState();
}

class _NewAdminNavigationMenuState extends State<NewAdminNavigationMenu> {
  /// variable selected or current index
  int currentPageIndex = 0;
  List screenList = [
    const AdminPanelHomeScreen(),
    const Placeholder(color: Colors.red),
    const Placeholder(color: Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList.elementAt(currentPageIndex),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(top: 10),
        child: NavigationBar(
          height: 50,
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
                Icons.calendar_month_rounded,
                color: TColors.primary,
              ),
              icon: Icon(
                Icons.calendar_month_rounded,
                color: TColors.darkGrey,
              ),
              label: 'Booking',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.calendar_month_rounded,
                color: TColors.primary,
              ),
              icon: Icon(
                Icons.settings,
                color: TColors.darkGrey,
              ),
              label: 'Settings',
            ),
          ],
        ),
      ),

      /// -- Drawer
      drawer: const CustomDrawer(),

    );
  }
}
