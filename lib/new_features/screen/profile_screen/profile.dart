import 'package:appointment_app/common/widgets/appbar/custom_appbar/custom_appbar.dart';
import 'package:appointment_app/features/shop/screens/notifications/notifications.dart';
import 'package:appointment_app/new_features/new_navigation_menu.dart';
import 'package:appointment_app/new_features/screen/landing_screen/landing_screen.dart';
import 'package:appointment_app/new_features/screen/new_home_screen/widget/my_appointments/my_appointments.dart';
import 'package:appointment_app/new_features/screen/profile_screen/widget/edit_profile.dart';
import 'package:appointment_app/services/database.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/widgets/list_tile/settings_menu_tile.dart';
import '../../../utils/popups/loaders.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.secondary,
      appBar: CustomAppBar(
        showBackgroundColor: false,
        showIcon: true,
        isDrawer: true,
        isNotification: false,
        isEdit: true,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        isCenterTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              FutureBuilder(
                future: DatabaseMethods().readUser(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  } else if (snapshot.hasData) {
                    final user = snapshot.data;
                    return user == null
                        ? Container()
                        : Material(
                            color: TColors.light,
                      borderRadius: BorderRadius.circular(20),
                            child: InkWell(
                              onTap: () => Get.to(() => EditProfileScreen()),
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: ClipOval(
                                        child: Image.asset(
                                          'assets/images/users/default_profile.png',
                                          height: 120,
                                          width: 120,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        children: [
                                          Text(
                                            user.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge,
                                          ),
                                          Text(user.email),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                  } else {
                    return const Center(child: CircularProgressIndicator(),);
                  }
                },
              ),
              SizedBox(height: 24),
              Column(
                children: [
                  SizedBox(
                    height: 420,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TSettingMenuTile(
                          icon: Iconsax.bookmark_24,
                          title: 'Appointments',
                          subTitle: 'Check your upcoming appointments',
                          trailing: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 20,
                          ),
                          onTap: () =>
                              Get.to(() => const MyAppointmentsScreen()),
                        ),
                        TSettingMenuTile(
                          icon: Iconsax.archive_book,
                          title: 'History',
                          subTitle: 'List of Appointments history',
                          trailing: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 20,
                          ),
                          onTap: () {},
                        ),
                        TSettingMenuTile(
                          icon: Iconsax.notification,
                          title: 'Notification',
                          subTitle: 'Recent notifications & updates',
                          trailing: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 20,
                          ),
                          onTap: () => Get.to(() => const NotificationScreen()),
                        ),
                        TSettingMenuTile(
                          icon: Iconsax.heart_add,
                          title: 'Favorites',
                          subTitle: 'List of all favorite products',
                          trailing: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 20,
                          ),
                          onTap: () {},
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (ctx) => CupertinoAlertDialog(
                                          title: const Text('Logout Account'),
                                          content: const Text(
                                              'Are you sure you want to logout your account?'),
                                          actions: [
                                            TextButton(
                                              child: const Text("Cancel",
                                                  style: TextStyle(
                                                      color: CupertinoColors
                                                          .activeBlue)),
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
                                                Get.offAll(() =>
                                                    const LandingScreen());

                                                /// Delete user data in local storage after logging out
                                                // SharedPreferences preferences = await SharedPreferences.getInstance();
                                                // await preferences.clear();
                                              },
                                            ),
                                          ],
                                        ));
                              },
                              child: const Text(
                                'Logout',
                                style: TextStyle(
                                    color: Color.fromRGBO(219, 157, 0, 1)),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
