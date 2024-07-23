import 'package:appointment_app/features/shop/screens/notifications/notifications.dart';
import 'package:appointment_app/features/shop/screens/reservations/reservations.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:appointment_app/features/authentication/screens/login/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../common/widgets/appbar/appbar.dart';

import '../../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../common/widgets/custom shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/list_tile/settings_menu_tile.dart';
import '../../../../services/shared_pref.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../personalization/screens/profile/profile.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String? name, email;
  String? image;

  /// Get name, email, number & image from local storage
  getDataFromSharedPref() async {
    name = await SharedPreferenceHelper().getUserName();
    email = await SharedPreferenceHelper().getUserEmail();
    image = await SharedPreferenceHelper().getUserImage();
    setState(() {});
  }

  getOnTheLoad() async {
    await getDataFromSharedPref();
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.secondary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white),
                    ),
                  ),
                  Stack(children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Column(
                        children: [
                          /// Null Safety
                          // image != null
                          //     ? ClipOval(
                          //         child: Image.asset(
                          //           image!,
                          //           width: 130,
                          //         ),
                          //       )
                          //     : const CircleAvatar(
                          //         backgroundColor: Colors.transparent,
                          //         backgroundImage: AssetImage(
                          //             "assets/images/users/default_profile.png"),
                          //         radius: 70,
                          //       ),

                          const CircleAvatar(
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage(
                                "assets/images/users/default_profile.png"),
                            radius: 70,
                          ),
                          const SizedBox(height: 15),

                          /// Null Safety
                          if (name != null) // Safe
                            Text(
                              name!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .apply(color: TColors.white),
                            ),

                          /// Null Safety
                          if (email != null) // Safe
                            Text(
                              email!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(color: TColors.white),
                            ),
                        ],
                      ),
                    ),
                    Positioned(
                        top: 94,
                        left: 244,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                              color: TColors.light, shape: BoxShape.circle),
                          child: IconButton(
                              onPressed: () =>
                                  Get.to(() => const ProfileOldScreen()),
                              icon: const Icon(
                                Iconsax.user_edit4,
                                color: TColors.primary,
                                size: 15,
                              )),
                        ))
                  ]),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25, top: 5),
              child: Column(
                children: [
                  /// Account Settings
                  const TSectionHeading(
                      title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  TSettingMenuTile(
                    icon: Iconsax.bookmark_24,
                    title: 'Bookings',
                    subTitle: 'Check your recent bookings',
                    onTap: () => Get.to(() => const Reservations()),
                  ),
                  TSettingMenuTile(
                      icon: Iconsax.heart_add,
                      title: 'Favorites',
                      subTitle: 'List of all favorite products',
                      onTap: () {}),
                  TSettingMenuTile(
                      icon: Iconsax.discount_shape,
                      title: 'My Coupons',
                      subTitle: 'List of all the discounted coupons',
                      onTap: () {}),
                  TSettingMenuTile(
                      icon: Iconsax.notification,
                      title: 'Notification',
                      subTitle: 'Set any kind of notification message',
                      onTap: () => Get.to(() => const NotificationScreen())),
                  TSettingMenuTile(
                    icon: Iconsax.information,
                    title: 'About Us',
                    subTitle: 'Learn more about us',
                    onTap: () {},
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.message_question,
                    title: 'Help & Support',
                    subTitle: 'Need help? Contact us',
                    onTap: () {},
                  ),
                  SizedBox(height: 20),

                  /// Logout Button
                  const SizedBox(height: TSizes.spaceBtwSections),
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
                                          Get.offAll(() => const LoginView());
                                        },
                                      ),
                                      TextButton(
                                        child: const Text("Cancel",
                                            style: TextStyle(
                                                color: CupertinoColors
                                                    .activeBlue)),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ));
                        },
                        child: const Text(
                          'Logout',
                          style:
                              TextStyle(color: Color.fromRGBO(219, 157, 0, 1)),
                        )),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections * 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
