import 'package:appointment_app/common/widgets/success_screen/success_screen.dart';
import 'package:appointment_app/features/authentication/screens/login/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/popups/loaders.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginView()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              /// Image
              Image(
                image: const AssetImage(
                    'assets/images/on_boarding_images/Mail sent-rafiki.png'),
                width: MediaQuery.of(context).size.width * 0.6,
              ),
              const SizedBox(height: 30),

              /// Title & Subtitle
              Text('Verify your email address!',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: 15),
              Text(email!),
              const SizedBox(height: 15),
              Text(
                  'Verify your email and start transforming your look and boost your confidence with JBL’s expert beauty treatments.',
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: 30),

              /// Continue button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {

                        /// Show snackbar
                        TLoaders.successSnackBar(
                            title: 'Congratulations!',
                            message:
                                'Your account has been created! Verify email to get limited discounts and coupons');

                        await Future.delayed(const Duration(seconds: 3));
                        Get.offAll(() => const SuccessScreen());
                      },
                      child: const Text('Continue'))),
              const SizedBox(height: 15),

              /// Resend email: show alert dialog box
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => CupertinoAlertDialog(
                              title: const Text('Email Sent'),
                              content: const Text(
                                  'Verification email was sent. Check your mail now.'),
                              actions: [
                                TextButton(
                                  child: const Text("Open Gmail now",
                                      style: TextStyle(
                                          color: CupertinoColors.activeBlue)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text("Verify later",
                                      style: TextStyle(
                                          color: CupertinoColors.black)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ));
                  },
                  child: const Text(
                    'Resend Email',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
