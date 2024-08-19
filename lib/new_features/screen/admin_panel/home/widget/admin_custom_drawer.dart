import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../services/auth_service.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/popups/loaders.dart';
import '../../../landing_screen/landing_screen.dart';
import '../../../landing_screen/page_views/registration_form/widget/privacy_policy.dart';

class AdminCustomDrawer extends StatelessWidget {
  const AdminCustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobileSmall = TDeviceUtils.getScreenWidth(context) <= 393;
    final auth = AuthService();

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              TColors.primary,
              TColors.secondary,
            ],
            stops: [
              0.2,
              1
            ]),
      ),
      child: Drawer(
        backgroundColor: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.only(top: 80, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: ClipOval(
                        child: Image.network(
                          'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/jbl-favicon.png',
                          scale: 8,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jirol Admin',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: Colors.white),
                        ),
                        Text(
                          'jiroladmin@gmail.com',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .apply(color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            Expanded(
              flex: isMobileSmall ? 5 : 6,
              child: ListView(
                padding: const EdgeInsets.all(0),
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Center(
                    child: SizedBox(
                      height: 2,
                      width: 270,
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Profile',
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
                      Icons.inbox_outlined,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Inbox',
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
                      'Privacy',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .apply(color: Colors.white),
                    ),
                    onTap: () => Get.to(() => const PrivacyPolicy()),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Settings',
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
                          'LOG OUT',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .apply(color: TColors.primary),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Text(
                      'Version 1.0 Build iOS 17.4     ',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .apply(color: TColors.primary),
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
