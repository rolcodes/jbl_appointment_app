import 'package:appointment_app/admin/screens/analytics/admin_analytics.dart';
import 'package:appointment_app/admin/screens/admin_settings.dart';
import 'package:appointment_app/admin/screens/Reservations/admin_reservations.dart';
import 'package:appointment_app/admin/screens/home/admin_home.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../utils/constants/colors.dart';

class AdminNavigationMenu extends StatefulWidget {
  const AdminNavigationMenu({super.key});

  @override
  State<AdminNavigationMenu> createState() => _AdminNavigationMenuState();
}

class _AdminNavigationMenuState extends State<AdminNavigationMenu> {
  int selectedIndex = 0;
  List screenList = [
    const AdminHome(),
    const AdminReservations(),
    const AdminAnalytics(),
    const AdminSettings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList.elementAt(selectedIndex),
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        animationDuration: const Duration(milliseconds: 500),
        backgroundColor: TColors.secondary,
        color: TColors.accent,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: const [
          Icon(
            Icons.home_rounded,
            color: TColors.white,
          ),
          Icon(
            Icons.star_rounded,
            color: TColors.white,
          ),
          Icon(
            Icons.bar_chart,
            color: TColors.white,
          ),
          Icon(
            Icons.person,
            color: TColors.white,
          ),
        ],
      ),
    );
  }
}
