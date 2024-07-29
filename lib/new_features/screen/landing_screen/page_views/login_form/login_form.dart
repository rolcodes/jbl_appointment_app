import 'package:appointment_app/new_features/new_navigation_menu.dart';
import 'package:appointment_app/new_features/screen/admin_panel/admin_panel_login.dart';
import 'package:appointment_app/new_features/screen/landing_screen/non_screen_widget/gradient_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../services/shared_pref.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/popups/loaders.dart';
import '../../non_screen_widget/custom_textformfield.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  /// Variables
  String? mail, password;

  /// Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /// Helps us to check validation in each textfield
  final formkey = GlobalKey<FormState>();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: mail!, password: password!);

      /// Save Data Locally, Alter the email from previous user
      await SharedPreferenceHelper().saveUserEmail(emailController.text);


      /// Show snackbar
      TLoaders.successSnackBar(
          title: 'Congratulations!', message: 'Sign in was successful!');
      // ignore: use_build_context_synchronously
      await Future.delayed(const Duration(seconds: 2));
      Get.offAll(() => const NewNavigationMenu());

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      } else if (e.code == 'wrong-password') {
        TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      } else if (e.code == 'invalid-email') {
        TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      } else if (e.code == 'email-already-in-use') {
        TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 56),
          Padding(
            padding: const EdgeInsets.only(left: 5, top: 5),
            child: IconButton(
              onPressed: () {
                widget.pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: TColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 170),
          Center(
            child: Image.asset(
              'assets/logos/jbl-logo-removebg-preview.png',
              width: 300,
            ),
          ),
          const SizedBox(height: 50),
          Center(
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomTextFormField(
                    textController: emailController,
                    hint: 'Email',
                    obscureText: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (ctx) => CupertinoAlertDialog(
                            content: Text('Please enter your credentials.',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .apply(color: Colors.black)),
                            actions: [
                              TextButton(
                                child: Text("OK",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
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
                    textCapitalization: TextCapitalization.none,
                  ),
                  CustomTextFormField(
                    textController: passwordController,
                    hint: 'Password',
                    obscureText: false,
                    textCapitalization: TextCapitalization.none,
                  ),
      
                  /// -- Button for Login Function
                  GradientButton(
                    text: 'LOGIN',
                    color: [Colors.orange.shade800, TColors.primary],
                    width: 260,
                    height: 40,
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        // If the form is valid, display a snackbar.
                        setState(() {
                          mail = emailController.text;
                          password = passwordController.text;
                        });
                        print('set state');
                      }
                      userLogin();
                      print('user login');
                    },
                  ),
                  const SizedBox(height: 10),
      
                  /// -- Navigate to next Page View = Forgot Password
                  TextButton(
                    onPressed: () {
                      widget.pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    },
                    child: Text(
                      'Forgot username or password?',
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: const Offset(1, 1),
                            blurRadius: 20,
                            color: Colors.grey.withOpacity(1),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 220),
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: TextButton(
                      onPressed: () {
                        Get.to(() => const AdminPanelLogin());
                      },
                      child: Text(
                        'Login as Administrator',
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: const Offset(0, 2),
                              blurRadius: 25,
                              color: Colors.black.withOpacity(0.5),
      
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
