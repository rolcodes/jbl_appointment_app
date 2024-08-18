import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jbl/new_features/new_navigation_menu.dart';
import 'package:jbl/new_features/screen/admin_panel/admin_navigation_menu.dart';
import 'package:jbl/new_features/screen/landing_screen/landing_screen.dart';
import 'package:jbl/utils/constants/colors.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        /// [authStateChanges]: Notifies about changes to the user's sign-in state
        /// (such as sign-in or sign-out)
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          /// Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: TColors.primary,
              ),
            );
          }
          /// Error
          else if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          } else {
            /// If user not logged in go to Landing Screen
            if (snapshot.data == null) {
              return const LandingScreen();
            }
            /// If user already logged in navigate to Home Screen
            else {
              return const NewNavigationMenu();
            }
          }
        },
      ),
    );
  }
}
