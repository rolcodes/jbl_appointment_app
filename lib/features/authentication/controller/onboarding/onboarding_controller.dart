import 'package:appointment_app/features/authentication/screens/login/login_view.dart';
import 'package:appointment_app/features/authentication/screens/signup/signup_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update Current Index when Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Jump to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  /// Update Current Index & jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      // final storage = GetStorage();
      //
      // if (kDebugMode) {
      //   print('============== GET STORAGE Next Button ==============');
      //   print(storage.read('IsFirstTime'));
      // }
      //
      // storage.write('IsFirstTime', false);

      Get.to(SignupView());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  /// Update Current Index & jump to the last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
