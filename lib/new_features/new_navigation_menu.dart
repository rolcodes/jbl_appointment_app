
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jbl/new_features/controller/new_home_screen/NewHomeScreenWrapper.dart';
import 'package:jbl/new_features/controller/profile/profile_wrapper.dart';
import 'package:jbl/new_features/screen/explore_screen/explore_screen.dart';
import 'package:jbl/new_features/screen/new_home_screen/new_home_screen.dart';
import 'package:jbl/new_features/screen/new_home_screen/widget/custom_drawer.dart';
import 'package:jbl/new_features/screen/profile_screen/profile.dart';

import '../utils/constants/colors.dart';

class NewNavigationMenu extends StatefulWidget {
  const NewNavigationMenu({super.key});

  @override
  State<NewNavigationMenu> createState() => _NewNavigationMenuState();
}

class _NewNavigationMenuState extends State<NewNavigationMenu> {
  /// variable selected or current index
  int currentPageIndex = 0;
  List screenList = [
    const NewHomeScreenWrapper(),
    const ExploreScreen(),
    const ProfileWrapper(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList.elementAt(currentPageIndex),
      bottomNavigationBar: Container(
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
              label: 'Explore',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.person,
                color: TColors.primary,
              ),
              icon: Icon(
                Icons.person_outline_rounded,
                color: TColors.darkGrey,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),

      /// -- Drawer
      drawer: const CustomDrawer(),

    );
  }
}
