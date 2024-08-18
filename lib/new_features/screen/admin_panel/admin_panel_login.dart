import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/popups/loaders.dart';
import '../landing_screen/non_screen_widget/custom_textformfield.dart';
import '../landing_screen/non_screen_widget/gradient_button.dart';
import 'admin_navigation_menu.dart';

class AdminPanelLogin extends StatefulWidget {
  const AdminPanelLogin({super.key});

  @override
  State<AdminPanelLogin> createState() => _AdminPanelLoginState();
}

class _AdminPanelLoginState extends State<AdminPanelLogin> {
  String? username, password;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /// Helps to check validation in each text fields
  final _formKey = GlobalKey<FormState>();

  /// Text editing controllers takes large up spaces so we have to
  /// dispose it after they are no longer required
  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.light,

      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(),
              child: Image.network(
                'https://jblnew.keywcomm.com/wp-content/uploads/2024/07/brunette-woman-in-sunglasses-and-white-bikini-sunbathing-on-beach-on-vacation.jpg',
                fit: BoxFit.cover,
                alignment: Alignment(-0.1, 0),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        TColors.secondary,
                        Colors.white.withOpacity(0.0),
                      ],
                      stops: [
                        0.1,
                        0.9,
                      ])),
            ),
            Positioned(
              left: 5,
              top: 60,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: TColors.primary,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.95,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(50),
                    padding: EdgeInsets.all(50),
                    decoration: BoxDecoration(
                      border: Border.all(color: TColors.primary.withOpacity(0.3),width: 2),
                        borderRadius: BorderRadius.circular(20),
                        color: TColors.secondary.withOpacity(0.7),
                        boxShadow: [
                          BoxShadow(
                            color: TColors.secondary.withOpacity(0.5),
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: const Offset(0, 2),
                          )
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/logos/jbl-logo-removebg-preview.png',
                            width: 300,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Form(
                          key: _formKey,
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  'Admin Panel',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .apply(
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        offset: const Offset(1, 1),
                                        blurRadius: 10,
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const SizedBox(height: 20),
                                CustomTextFormField(
                                  textController: usernameController,
                                  hint: 'Email',
                                  obscureText: false,
                                  textCapitalization: TextCapitalization.none,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      showDialog(
                                        context: context,
                                        builder: (ctx) => CupertinoAlertDialog(
                                          content: Text(
                                              'Please enter your credential.',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge!
                                                  .apply(color: Colors.black)),
                                          actions: [
                                            TextButton(
                                              child: Text("OK",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium),
                                              onPressed: () {
                                                Get.back();
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                    return null;
                                  },
                                ),
                                CustomTextFormField(
                                  textController: passwordController,
                                  hint: 'Password',
                                  obscureText: true,
                                  textCapitalization: TextCapitalization.none,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      showDialog(
                                        context: context,
                                        builder: (ctx) => CupertinoAlertDialog(
                                          content: Text(
                                              'Please enter your credential.',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge!
                                                  .apply(color: Colors.black)),
                                          actions: [
                                            TextButton(
                                              child: Text("OK",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium),
                                              onPressed: () {
                                                Get.back();
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                    return null;
                                  },
                                ),
                                GradientButton(
                                  text: 'Continue',
                                  color: [
                                    Colors.orange.shade800,
                                    TColors.primary
                                  ],
                                  width: 260,
                                  height: 40,
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        username = usernameController.text;
                                        password = passwordController.text;
                                      });
                                      adminLogin();
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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

  adminLogin() {
    /// Call the collection name Admin from Firestore
    FirebaseFirestore.instance.collection("admin").get().then(
      (snapshot) {
        /// Snapshot will be helpful to get all the documents that is available on the Admin Collection
        /// If inputs in text field match the ID and password from collection then redirect to admin panel
        snapshot.docs.forEach(
          (result) async {
            /// Check if ID is correct. If not correct show error snackbar
            if (result.data()['email'] != usernameController.text.trim()) {
              TLoaders.errorSnackBar(
                  title: 'Username is not correct!',
                  message: 'Username is either empty or not correct.');
            }

            /// Check if Password is correct
            else if (result.data()['password'] !=
                passwordController.text.trim()) {
              TLoaders.errorSnackBar(
                  title: 'Password is not correct!',
                  message: 'Password is either empty or not correct.');
            }

            /// Check if both ID and Password is correct then go to Booking Admin Panel
            else {
              TLoaders.successSnackBar(
                  title: 'Welcome Back Admin!', message: 'Check upcoming appointments now.');

              await Future.delayed(const Duration(seconds: 1));

              Get.offAll(const NewAdminNavigationMenu());
            }
          },
        );
      },
    );
  }
}
