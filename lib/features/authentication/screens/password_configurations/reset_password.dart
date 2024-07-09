import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              /// Image
              Image(
                image: const AssetImage(
                    'assets/images/on_boarding_images/Mail sent-rafiki.png'),
                width: MediaQuery.of(context).size.width * 0.75,
              ),
              const SizedBox(height: 30),

              /// Title & Subtitle
              Text('Password Reset Email Sent',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: 15),
              Text(
                  "Your account security is our priority! We've sent you a secure link to safety change your password and keep your account protected.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: 30),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.back(), child: const Text('Continue')),
              ),
              const SizedBox(height: 15),

              /// Resend email: show alert dialog box
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => CupertinoAlertDialog(
                              title: const Text('Password Reset Email'),
                              content: const Text(
                                  'A secure reset link was sent. Check your mail now.'),
                              actions: [
                                TextButton(
                                  child: const Text("Open Gmail now",
                                      style: TextStyle(
                                          color: CupertinoColors.activeBlue)),
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
