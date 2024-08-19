import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../services/auth_service.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/popups/loaders.dart';
import '../../landing_screen/landing_screen.dart';
import '../../landing_screen/page_views/registration_form/widget/privacy_policy.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [TColors.primary, Colors.orange.shade800])),
      child: Drawer(
        backgroundColor: Colors.transparent,
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  const SizedBox(height: 60),
                  ListTile(
                    leading: const Icon(
                      Icons.bookmark_add,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Book an appointment',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .apply(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.shopify_rounded,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Products',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .apply(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.privacy_tip_rounded,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Privacy Notice',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .apply(color: Colors.white),
                    ),
                    onTap: () => Get.to(() => const PrivacyPolicy()),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.call_rounded,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Contact Us',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .apply(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.warning,
                      color: Colors.white,
                    ),
                    title: Text(
                      'FAQs',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .apply(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),

            /// -- Logout Button
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (ctx) => CupertinoAlertDialog(
                              title: const Text('Logout Account'),
                              content: const Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                    'Are you sure you want to logout your account?'),
                              ),
                              actions: [
                                TextButton(
                                  child: Text("Cancel",
                                      style: TextStyle(
                                          color: Colors.grey.shade800)),
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
                                    print('Firebase Sign Out Success!');

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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Log Out',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .apply(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Text(
                      'Version 1.2 Build iOS 17.4     ',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .apply(color: Colors.white),
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
