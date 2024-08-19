import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../new_features/screen/landing_screen/landing_screen.dart';
import '../../../services/auth_service.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/popups/loaders.dart';

class CustomLogoutButton extends StatelessWidget {
  const CustomLogoutButton({
    super.key,
    required this.auth,
  });

  final AuthService auth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (ctx) => CupertinoAlertDialog(
                  title: Text(
                    'Logout Account',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge,
                  ),
                  content: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Are you sure you want to logout your account?', style: Theme.of(context).textTheme.labelLarge,),
                  ),
                  actions: [
                    TextButton(
                      child: Text("Cancel",
                          style: TextStyle(
                              color: Colors
                                  .grey.shade800)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text("Logout",
                          style: TextStyle(
                              color: CupertinoColors
                                  .destructiveRed)),
                      onPressed: () async {
                        /// Show snackbar
                        TLoaders.successSnackBar(
                            title: 'Logged out!',
                            message:
                            'You have successfully logged out.');

                        /// delay function
                        await Future.delayed(
                            const Duration(seconds: 1));

                        /// Sign out/Log out function from auth_service.dart
                        await auth.signOut();
                        print(
                            'Firebase Sign Out Success!');

                        /// Delete user data in local storage after logging out
                        SharedPreferences preferences =
                        await SharedPreferences
                            .getInstance();
                        await preferences.clear();

                        Get.offAll(() =>
                        const LandingScreen());
                      },
                    ),
                  ],
                ));
          },
          child: Text(
            'Logout',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .apply(color: TColors.primary),
          )),
    );
  }
}
