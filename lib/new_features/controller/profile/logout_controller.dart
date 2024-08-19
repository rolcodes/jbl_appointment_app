import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../services/auth_service.dart';
import '../../../utils/popups/loaders.dart';
import '../../screen/landing_screen/landing_screen.dart';

class Method {
  late final AuthService auth;


  Future<dynamic> buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: Text(
          'Logout Account',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        content: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'Are you sure you want to logout your account?',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        actions: [
          TextButton(
            child: Text("Cancel", style: TextStyle(color: Colors.grey.shade800)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text("Logout",
                style: TextStyle(color: CupertinoColors.destructiveRed)),
            onPressed: () async {
              /// Show snackbar
              TLoaders.successSnackBar(
                  title: 'Logged out!',
                  message: 'You have successfully logged out.');

              /// delay function
              await Future.delayed(const Duration(seconds: 1));

              /// Sign out/Log out function from auth_service.dart
              await auth.signOut();
              print('Firebase Sign Out Success!');

              /// Delete user data in local storage after logging out
              SharedPreferences preferences =
              await SharedPreferences.getInstance();
              await preferences.clear();

              Get.offAll(() => const LandingScreen());
            },
          ),
        ],
      ),
    );
  }


}