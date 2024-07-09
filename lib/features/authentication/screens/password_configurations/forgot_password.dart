import 'package:appointment_app/features/authentication/screens/password_configurations/reset_password.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:appointment_app/utils/constants/sizes.dart';
import 'package:appointment_app/utils/constants/text_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../res/components/custom_button.dart';
import '../../../../utils/popups/loaders.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String? email;
  TextEditingController mailcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email!);
      TLoaders.successSnackBar(
          title: 'Congratulations!', message: 'Password reset email was sent!');

      /// show loading screen

      Get.off(() => const ResetPassword());
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('No user found for the email.',
                style: TextStyle(fontSize: 20))));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.light,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Image.asset(
                      'assets/images/on_boarding_images/Reset password-bro.png',
                      width: 250)),
              const SizedBox(height: TSizes.defaultSpace),
              Text(
                "Forget Password",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 10.0),
              Text(
                "Dont' worry sometimes people can forget too, enter your email and we will send you a password reset link.",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 60),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: mailcontroller,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.direct_right),
                          hintText: TTexts.email,
                          focusColor: Colors.white),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: TSizes.defaultSpace),
                    CustomButton(
                      buttonText: ("Submit"),
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            email = mailcontroller.text;
                          });
                          resetPassword();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
