import 'package:appointment_app/features/authentication/screens/onboarding/widgets/onboarding._page.dart';
import 'package:appointment_app/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:appointment_app/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:appointment_app/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onboarding/onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children:  const [
              OnBoardingPage(
                  image: 'assets/images/on_boarding_images/Oncology patient-amico.png',
                  title: 'Jevelme Beauty Lounge',
                  subTitle: 'Get the glow you deserve with Jevelme’s exclusive deals. We got you!'),
              OnBoardingPage(
                  image: 'assets/images/on_boarding_images/Facial massage-amico.png',
                  title: 'Skilled Professionals',
                  subTitle: 'Pamper yourself with a rejuvenating facial at Jevelme Beauty Lounge.'),
              OnBoardingPage(
                  image: 'assets/images/on_boarding_images/Online calendar-amico.png',
                  title: 'Start Pampering Yourself!',
                  subTitle: 'Book an appointment now and indulge in some self-care. You deserve it!'),
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          /// Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}