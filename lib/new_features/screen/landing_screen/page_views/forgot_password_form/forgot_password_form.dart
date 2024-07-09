import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../features/authentication/screens/password_configurations/reset_password.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/popups/loaders.dart';
import '../../non_screen_widget/custom_textformfield.dart';
import '../../non_screen_widget/gradient_button.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  String? email;

  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email!);
      TLoaders.successSnackBar(
          title: 'Congratulations!', message: 'Password reset email was sent!');

      /// show loading screen

      Get.to(() => const ResetPassword());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('No user found for the email.',
                style: TextStyle(fontSize: 20))));
      } else if (e.code == 'invalid-email') {
        TLoaders.errorSnackBar(title: 'Invalid Email!', message: 'Please enter your correct email.');

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 56),
        Padding(
          padding: const EdgeInsets.only(left: 10),
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
        Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Forgot your password?',
                style: Theme.of(context).textTheme.headlineMedium!.apply(
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Center(
                child: SizedBox(
                  width: 350,
                  child: Text(
                    "Dont' worry sometimes people can forget too, enter your email and we will send you a password reset link.",
                    style: Theme.of(context).textTheme.bodyLarge!.apply(
                      color: Colors.white,
                      shadows: [
                        Shadow(

                          offset: Offset(1, 1),
                          blurRadius: 15,
                          color: Colors.black.withOpacity(0.5),

                        ),
                      ],
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                textController: emailController,
                hint: 'Email',
                obscureText: false,
                textCapitalization: TextCapitalization.none,
                validator: (value) {
                  if (value!.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (ctx) => CupertinoAlertDialog(
                        content: Text('Please enter your credential.',
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
                },
              ),
              GradientButton(
                text: 'Continue',
                color: [Colors.orange.shade800, TColors.primary],
                width: 260,
                height: 40,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      email = emailController.text;
                    });
                    resetPassword();
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
