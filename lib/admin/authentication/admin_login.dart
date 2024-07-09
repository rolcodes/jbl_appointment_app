import 'package:appointment_app/admin/admin_navigation_menu.dart';
import 'package:appointment_app/common/widgets/loaders/animation_loader.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:appointment_app/features/authentication/screens/login/login_view.dart';
import 'package:appointment_app/utils/popups/full_screen_loader.dart';
import 'package:appointment_app/utils/popups/loaders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/constants/text_strings.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  String? username, password;

  TextEditingController usernameController = TextEditingController();
  TextEditingController userpasswordController = TextEditingController();




  /// Helps to check validation in each text fields
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            /// -- Gradient Background
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(color: TColors.secondary
                  // gradient: LinearGradient(
                  //     begin: Alignment.topCenter,
                  //     end: Alignment.bottomCenter,
                  //     colors: [
                  //       TColors.secondary,
                  //       TColors.accent,
                  //       TColors.accent,
                  //       TColors.accent,
                  //     ],
                  //     stops: [
                  //       0.3,
                  //       2,
                  //       2,
                  //       2,
                  //     ]),
                  ),
            ),

            /// BorderRadius for top left and top right
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.50),
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                  color: TColors.primary.withOpacity(0.7),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              width: MediaQuery.of(context).size.width,
            ),

            /// -- Logo
            Container(
              margin: const EdgeInsets.only(top: 110),
              child: Column(
                children: [
                  Center(
                      child: Image.asset(TImages.appLogo2,
                          width: MediaQuery.of(context).size.width / 2,
                          fit: BoxFit.cover)),
                  const SizedBox(height: 60),

                  /// -- Admin Form
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.52,
                      decoration: BoxDecoration(
                          color: TColors.light,
                          borderRadius: BorderRadius.circular(35)),
                      child: Column(
                        children: [
                          /// Logo, Title & Subtitle
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Admin Panel",
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              const SizedBox(height: 15),
                              Text(
                                "Log in as administrator. Track all reservations, check notifications, and analyze all collected data.",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .apply(fontSizeDelta: -1.4),
                              ),
                              const SizedBox(height: 30),

                              /// Form
                              Form(
                                key: _formkey,
                                child: Column(
                                  children: <Widget>[
                                    /// Username
                                    TextFormField(
                                      controller: usernameController,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(Iconsax.user),
                                        hintText: TTexts.username,
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter Username';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                        height: TSizes.spaceBtwInputFields),

                                    /// Password
                                    TextFormField(
                                      obscureText: true,
                                      controller: userpasswordController,
                                      decoration: const InputDecoration(
                                          prefixIcon:
                                              Icon(Iconsax.password_check),
                                          hintText: TTexts.password),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter Password';
                                        }
                                        return null;
                                      },
                                    ),

                                    const SizedBox(height: 55),

                                    /// Login Button
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: TColors.primary,
                                            side: const BorderSide(
                                                color: TColors.primary)),
                                        onPressed: () {
                                          if (_formkey.currentState!
                                              .validate()) {
                                            setState(() {
                                              username =
                                                  usernameController.text;
                                              password =
                                                  userpasswordController.text;
                                            });
                                          }

                                          loginAdmin();
                                        },
                                        child: Text(
                                          'Login',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .apply(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),

                                    /// Login as Administrator
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Login as ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .apply(color: TColors.darkGrey),
                                        ),
                                        GestureDetector(
                                          onTap: () =>
                                              Get.to(() => const LoginView()),
                                          child: Text(
                                            'User',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .apply(
                                                    color: const Color.fromRGBO(
                                                        219, 157, 0, 1)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// -- Login Function for Administrator
  loginAdmin() {
    /// Call the collection name Admin from Firestore
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
      /// Snapshot will be helpful to get all the documents that is available on the Admin Collection
      /// If each inputs in text field match the ID and password from collection then redirect to admin panel
      snapshot.docs.forEach((result) async {
        /// Check if ID is correct. If not correct show snackbar
        if (result.data()['id'] != usernameController.text.trim()) {
          TLoaders.errorSnackBar(
              title: 'Username is not correct!',
              message: 'Password is either empty or not correct.');
        }

        /// Check if Password is correct. If not correct show snackbar
        else if (result.data()['password'] !=
            userpasswordController.text.trim()) {
          TLoaders.errorSnackBar(

              title: 'Password is not correct!',
              message: 'Password is either empty or not correct.');
        }

        /// Check if both ID and Password is correct then go to Booking Admin Panel
        else {
          TLoaders.doneSnackBar(
              title: 'Congratulations!', message: 'Login was successful!');

          await Future.delayed(const Duration(seconds: 1));

          Get.offAll(const AdminNavigationMenu());
        }
      });
    });
  }
}
