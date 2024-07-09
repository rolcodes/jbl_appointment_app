import 'package:appointment_app/common/styles/spacing_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../navigation_menu.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Image
              Image(
                image: const AssetImage(
                    'assets/images/on_boarding_images/High five-bro.png'),
                width: MediaQuery.of(context).size.width * 0.75,
              ),
              const SizedBox(height: 30),

              /// Title & Subtitle
              Text('Your account successfully created!',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: 15),
              Text(
                  "Welcome to Jevelme Beauty Lounge! Aesthetic Clinic in Bucandala IV Imus, Cavite. Get the glow you deserve with Jevelme’s exclusive deals. We got you!",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: 30),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {

                      /// Show loading screen


                      /// Proceed to Home Screen
                      Get.offAll(() => const NavigationMenu());
                    },
                    child: const Text('Continue')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
