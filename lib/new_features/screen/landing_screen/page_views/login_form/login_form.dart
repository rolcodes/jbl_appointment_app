import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../services/auth_service.dart';
import '../../../../../services/shared_pref.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/popups/loaders.dart';
import '../../../../new_navigation_menu.dart';
import '../../../admin_panel/admin_panel_login.dart';
import '../../non_screen_widget/custom_textformfield.dart';
import '../../non_screen_widget/gradient_button.dart';

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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  /// Helps us to check validation in each textfield
  final formkey = GlobalKey<FormState>();

  /// Text editing controllers takes large up spaces so we have to
  /// dispose it after they are no longer required
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future userLogin() async {
    if (mail != null && password != null) {
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

        /// Navigate to Home Screen
        /// TO DO: Remove manual navigation to Home Screen
        /// Apply: Keep user logged in function
        // Get.offAll(() => const NewNavigationMenu());

      } on FirebaseAuthException catch (e) {
        AuthService().exceptionHandlerSignIn(e.code);

        // if (e.code == 'user-not-found') {
        //   TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
        // } else if (e.code == 'wrong-password') {
        //   TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
        // } else if (e.code == 'invalid-email') {
        //   TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
        // }
      }
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 2,
              child: IconButton(
                style: IconButton.styleFrom(
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
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
            const SizedBox(height: 50),
            Expanded(
              flex: 8,
              child: Center(
                child: Form(
                  key: formkey,
                  child: SizedBox(
                    height: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                            'assets/logos/jbl-logo-removebg-preview.png',
                            width: 260,
                          ),
                        ),
                        CustomTextFormField(
                          textController: emailController,
                          hint: 'Email',
                          obscureText: false,
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     showDialog(
                          //       context: context,
                          //       builder: (ctx) => CupertinoAlertDialog(
                          //         content: Text(
                          //             'Please enter your credentials.',
                          //             style: Theme.of(context)
                          //                 .textTheme
                          //                 .labelLarge!
                          //                 .apply(color: Colors.black)),
                          //         actions: [
                          //           TextButton(
                          //             child: Text("OK",
                          //                 style: Theme.of(context)
                          //                     .textTheme
                          //                     .bodyMedium),
                          //             onPressed: () {
                          //               Get.back();
                          //             },
                          //           ),
                          //         ],
                          //       ),
                          //     );
                          //   }
                          //   return null;
                          // },
                          textCapitalization: TextCapitalization.none,
                        ),
                        CustomTextFormField(
                          textController: passwordController,
                          hint: 'Password',
                          obscureText: true,
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
                                mail = emailController.text.trim();
                                password = passwordController.text.trim();
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: TextButton(
                  onPressed: () => Get.to(() => const AdminPanelLogin()),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
