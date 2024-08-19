import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jbl/new_features/screen/profile_screen/widget/appointment_history/appointment_history.dart';
import 'package:jbl/new_features/screen/profile_screen/widget/edit_profile.dart';
import 'package:jbl/services/auth_service.dart';
import 'package:jbl/utils/device/device_utility.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/widgets/appbar/custom_appbar/custom_appbar.dart';
import '../../../common/widgets/list_tile/settings_menu_tile.dart';
import '../../../services/database.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/popups/loaders.dart';
import '../../models/user_model.dart';
import '../landing_screen/landing_screen.dart';
import '../new_home_screen/widget/chat/custom_chat_button.dart';
import '../new_home_screen/widget/my_appointments/my_appointments.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.user,
  });

  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    final isMobileSmall = TDeviceUtils.getScreenWidth(context) < 430;

    final auth = AuthService();

    return Scaffold(
      backgroundColor: TColors.secondary,
      appBar: CustomAppBar(
        backgroundColor: TColors.light,
        showBackgroundColor: false,
        iconColor: TColors.primary,
        showIcon: true,
        isDrawer: true,
        isNotification: false,
        isEdit: true,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.titleMedium!.apply(color: TColors.primary, fontSizeDelta: 2),
        ),
        isCenterTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              Material(
                color: TColors.light,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  onTap: () => Get.to(() => const EditProfileScreen()),
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
                                "${user?.name}",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text("${user?.email}"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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

                          onTap: () =>
                              Get.to(() => const MyAppointmentsScreen()),
                          titleSmall: isMobileSmall ? true : false,
                          subTitleSmall: isMobileSmall ? true : false,
                        ),
                        TSettingMenuTile(
                          icon: Iconsax.archive_book,
                          title: 'History',
                          subTitle: 'List of Appointments history',

                          onTap: () =>
                              Get.to(() => const AppointmentHistoryScreen()),
                          titleSmall: isMobileSmall ? true : false,
                          subTitleSmall: isMobileSmall ? true : false,
                        ),
                        TSettingMenuTile(
                          icon: Iconsax.notification,
                          title: 'Notification',
                          subTitle: 'Recent notifications & updates',

                          onTap: () {},
                          titleSmall: isMobileSmall ? true : false,
                          subTitleSmall: isMobileSmall ? true : false,
                        ),
                        TSettingMenuTile(
                          icon: Iconsax.heart_add,
                          title: 'Favorites',
                          subTitle: 'List of all favorite products',
                          onTap: () {},
                          titleSmall: isMobileSmall ? true : false,
                          subTitleSmall: isMobileSmall ? true : false,
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
      floatingActionButton: const CustomChatButton(),
    );
  }
}
