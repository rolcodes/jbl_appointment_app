import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../new_features/screen/landing_screen/landing_screen.dart';
import '../../../utils/constants/colors.dart';

class CustomGuestBookNowButton extends StatelessWidget {
  const CustomGuestBookNowButton({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (ctx) => CupertinoAlertDialog(
              title: Text('Register now!',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .apply(color: Colors.black)),
              content: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                    'You need to log in or register to book a service. Would you like to proceed?',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: Colors.black)),
              ),
              actions: [
                TextButton(
                  child: Text("NO",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .apply(color: Colors.black)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text("YES",
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                          fontWeightDelta: 1,
                          color: CupertinoColors.activeBlue)),
                  onPressed: () {
                    Get.offAll(() => const LandingScreen());
                  },
                ),
              ],
            ));
      },
      child: Container(
        height: Platform.isAndroid ? 50 : 65,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.orange.shade800, TColors.primary])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .apply(color: Colors.white),
              ),
            ),
            SizedBox(height: Platform.isAndroid ? 0 : 12),
          ],
        ),
      ),
    );
  }
}
