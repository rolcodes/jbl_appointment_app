import 'package:appointment_app/admin/authentication/admin_login.dart';
import 'package:appointment_app/common/styles/spacing_styles.dart';
import 'package:appointment_app/navigation_menu.dart';
import 'package:appointment_app/res/components/custom_button.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:appointment_app/utils/constants/image_strings.dart';
import 'package:appointment_app/utils/constants/text_strings.dart';
import 'package:appointment_app/features/authentication/screens/password_configurations/forgot_password.dart';
import 'package:appointment_app/features/authentication/screens/signup/signup_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/popups/loaders.dart';

enum ButtonState { init, loading, done, wrong }

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isAnimating = true;

  /// Initialized button state
  ButtonState state = ButtonState.init;

  /// Variables
  String? mail, password;

  /// Controllers
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  /// Helps us to check validation in each textfield
  final _formkey = GlobalKey<FormState>();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: mail!, password: password!);

      // setState(() => state = ButtonState.loading);
      // await Future.delayed(const Duration(seconds: 1));
      setState(() => state = ButtonState.done);
      // await Future.delayed(const Duration(milliseconds: 2));
      // setState(() => state = ButtonState.init);

      /// Show snackbar
      TLoaders.successSnackBar(
          title: 'Congratulations!', message: 'Sign in was successful!');
      // ignore: use_build_context_synchronously
      await Future.delayed(const Duration(seconds: 2));
      Get.offAll(() => const NavigationMenu());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
        // /// loading
        // setState(() => state = ButtonState.loading);
        // await Future.delayed(const Duration(seconds: 1));
        //
        // /// icon shows
        // setState(() => state = ButtonState.wrong);
        // await Future.delayed(const Duration(seconds: 1));
      } else if (e.code == 'wrong-password') {
        TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
        // /// loading
        // setState(() => state = ButtonState.loading);
        // await Future.delayed(const Duration(seconds: 1));
        //
        // /// icon shows
        // setState(() => state = ButtonState.wrong);
        // await Future.delayed(const Duration(seconds: 1));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isStretched = isAnimating || state == ButtonState.init;
    final isDone = state == ButtonState.done;
    // final isWrong = state == ButtonState.wrong;

    return Scaffold(
      backgroundColor: TColors.light,
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title & Subtitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  const Image(
                    height: 50,
                    image: AssetImage(TImages.appLogo2),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    TTexts.loginTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    TTexts.loginSubTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: TSizes.spaceBtwSections),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          /// Email
                          TextFormField(
                            controller: emailcontroller,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.user),
                                hintText: TTexts.email),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: TSizes.spaceBtwInputFields),

                          /// Password
                          TextFormField(
                            obscureText: true,
                            controller: passwordcontroller,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.password_check),
                                hintText: TTexts.password),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Password';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: TSizes.spaceBtwInputFields),

                          /// Forget Password
                          GestureDetector(
                            onTap: () => Get.to(() => const ForgotPassword()),
                            child: const Align(
                              alignment: Alignment.centerRight,
                              child: Text(TTexts.forgetPassword),
                            ),
                          ),
                          const SizedBox(height: TSizes.spaceBtwInputFields),

                          // /// Sign In Button
                          // CustomButton(
                          //     buttonText: TTexts.signIn,
                          //     onTap: () {
                          //       if (_formkey.currentState!.validate()) {
                          //         setState(() {
                          //           mail = emailcontroller.text;
                          //           password = passwordcontroller.text;
                          //         });
                          //         userLogin();
                          //       }
                          //     }),
                          // const SizedBox(height: TSizes.spaceBtwItems),

                          /// Animated Button / Build Button
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                            width: state == ButtonState.init ? width : 70,
                            onEnd: () =>
                                setState(() => isAnimating = !isAnimating),
                            child: isStretched
                                ? buildButton()
                                : buildSmallButton(isDone),
                          ),

                          const SizedBox(height: TSizes.spaceBtwItems),

                          /// Create Account Button
                          SizedBox(
                              width: double.infinity,
                              child: OutlinedButton(
                                  onPressed: () =>
                                      Get.to(() => const SignupView()),
                                  child: const Text(TTexts.createAccount))),
                          const SizedBox(height: 25),

                          /// Login as Administrator
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Login as  ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(color: TColors.darkGrey),
                              ),
                              GestureDetector(
                                onTap: () => Get.to(() => const AdminLogin()),
                                child: Text(
                                  'Administrator',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(color: TColors.accent),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),

                          /// Divider
                          TFormDivider(
                              dividerText: TTexts.orSignInWith.capitalize!),
                          const SizedBox(height: TSizes.spaceBtwSections),

                          /// Footer
                          const TSocialButtons(),
                        ],
                      ),
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

  /// Function for animated button
  Widget buildButton() => ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () async {
        /// loading
        setState(() => state = ButtonState.loading);
        await Future.delayed(const Duration(seconds: 1));

        // /// icon shows
        // setState(() => state = ButtonState.wrong);
        // await Future.delayed(const Duration(seconds: 1));

        /// animation back to button
        await Future.delayed(const Duration(seconds: 1));
        setState(() => state = ButtonState.init);


        if (_formkey.currentState!.validate()) {
          setState(() {
            mail = emailcontroller.text;
            password = passwordcontroller.text;
          });

          //await Future.delayed(const Duration(seconds: 2));
          /// loading
          setState(() => state = ButtonState.loading);

          /// Login Function
          userLogin();
          await Future.delayed(const Duration(seconds: 2));
          setState(() => state = ButtonState.init);
        } else {
          TLoaders.errorSnackBar(title: 'Error', message: 'Incorrect username or password!');
          await Future.delayed(const Duration(seconds: 1));
          setState(() => state = ButtonState.init);
        }
      },
      child: const Text('Sign In'));

  /// Check Icon if user input is correct
  Widget buildSmallButton(bool isDone) {
    final color = isDone ? TColors.primary : TColors.primary;

    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: SizedBox(
        height: 50,
        width: 50,
        child: Center(
          child: isDone
              ? const Icon(Icons.done, size: 40, color: Colors.white)
              : const CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );
  }

  // /// Show this if user input is not correct
  // Widget buildWrongButton(bool isWrong) {
  //   final color = isWrong ? TColors.primary : TColors.primary;
  //
  //   return Container(
  //     decoration: BoxDecoration(shape: BoxShape.circle, color: color),
  //     child: SizedBox(
  //       height: 50,
  //       width: 50,
  //       child: Center(
  //         child: isWrong
  //             ? const Icon(Icons.clear, size: 40, color: Colors.white)
  //             : const CircularProgressIndicator(color: Colors.white),
  //       ),
  //     ),
  //   );
  // }
}
