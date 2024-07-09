import 'package:appointment_app/features/shop/screens/catalog/catalog.dart';
import 'package:appointment_app/features/shop/screens/home/home.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:appointment_app/features/shop/screens/settings/settings.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  /// variable selected or current index
  int selectedIndex = 0;
  List screenList = [
    const HomeScreen(),
    const CatalogScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList.elementAt(selectedIndex),
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        animationDuration: const Duration(milliseconds: 500),
        backgroundColor: TColors.secondary,
        color: const Color.fromRGBO(219, 157, 0, 50),
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: const [
          Icon(
            Icons.home_rounded,
            color: Colors.white,
          ),
          Icon(
            Icons.clean_hands_rounded,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
