import 'package:appointment_app/admin/authentication/admin_login.dart';
import 'package:appointment_app/admin/screens/Reservations/admin_reservations.dart';
import 'package:appointment_app/admin/screens/Reservations/widget/admin_notifications.dart';
import 'package:appointment_app/admin/screens/analytics/admin_analytics.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../common/widgets/list_tile/settings_menu_tile.dart';
import '../../common/widgets/custom shapes/containers/circular_container.dart';
import '../../common/widgets/custom shapes/curved_edges/curved_edges_widget.dart';
import '../../utils/popups/loaders.dart';

class AdminSettings extends StatelessWidget {
  const AdminSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.secondary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            TCurvedEdgeWidget(
              child: Container(
                color: TColors.accent,
                padding: const EdgeInsets.only(bottom: 10),

                /// -- If [size.isFinite': is not true.im Stack] error occured -> Read README.md file
                child: Stack(
                  children: [
                    /// -- Background Custom Shapes
                    Positioned(
                      top: -150,
                      right: -250,
                      child: TCircularContainer(
                          backgroundColor: TColors.textWhite.withOpacity(0.1)),
                    ),
                    Positioned(
                      top: 100,
                      right: -300,
                      child: TCircularContainer(
                          backgroundColor: TColors.textWhite.withOpacity(0.1)),
                    ),
                    Column(
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
                        const SizedBox(height: 20),

                        /// Admin Profile Card
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ListTile(
                            leading: Container(
                              width:60,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image:  AssetImage('assets/images/users/userpngtree.png'),
                                    fit: BoxFit.contain
                                ),
                              ),
                            ),
                            title: Text(
                              'Jirol Admin',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .apply(color: TColors.white),
                            ),
                            subtitle: Text(
                              'jirolds08@gmail.com',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(color: TColors.white),
                            ),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Iconsax.user_edit4,
                                  color: TColors.white,
                                )),
                          ),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Settings
                  const TSectionHeading(
                      title: 'Settings', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  TSettingMenuTile(
                    icon: Iconsax.bookmark_24,
                    title: 'All Bookings',
                    subTitle: 'Check your recent bookings',
                    onTap: () => Get.to(const AdminReservations()),
                  ),
                  TSettingMenuTile(
                      icon: Icons.show_chart,
                      title: 'Analytics',
                      subTitle: 'List of all favorite products',
                      onTap: () => Get.to(const AdminAnalytics())),
                  TSettingMenuTile(
                      icon: Iconsax.discount_shape,
                      title: 'Customers',
                      subTitle: 'List of all loyal customers',
                      onTap: () {}),
                  TSettingMenuTile(
                      icon: Iconsax.notification,
                      title: 'Notifications',
                      subTitle: 'Set any kind of notification message',
                      onTap: () => Get.to(const AdminNotifications())),

                  /// Logout Button
                  const SizedBox(height: TSizes.spaceBtwSections),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(149, 185, 197, 1.0),
                    borderRadius: BorderRadius.circular(12)),
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (ctx) => CupertinoAlertDialog(
                                title:  const Text('Logout Account'),
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
                                      TLoaders.doneSnackBar(
                                          title: 'Logged out!',
                                          message:
                                          'You have successfully logged out.');

                                      /// delay function
                                      await Future.delayed(const Duration(seconds: 1));
                                      Get.offAll(() => const AdminLogin());
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
                          style: TextStyle(color: TColors.accent),
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
