import 'package:appointment_app/new_features/screen/admin_panel/admin_panel_login.dart';
import 'package:appointment_app/new_features/screen/landing_screen/non_screen_widget/custom_textformfield.dart';
import 'package:appointment_app/new_features/screen/landing_screen/non_screen_widget/gradient_button.dart';
import 'package:appointment_app/new_features/screen/landing_screen/page_views/forgot_password_form/forgot_password_form.dart';
import 'package:appointment_app/new_features/screen/landing_screen/page_views/login_form/login_form.dart';
import 'package:appointment_app/new_features/screen/landing_screen/page_views/registration_form/registration_form.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../continue_as_guest/guest.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late PageController pageController;


  @override
  void initState() {
    pageController = PageController(initialPage: 1);

    /// For loading
    _isLoading = true;
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int pageChanged = 0;

  late bool _isLoading;

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(TColors.primary),
              ),
            ),
          )
        : Scaffold(
            body: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(),
                  child: Image.network(
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/07/brunette-woman-in-sunglasses-and-white-bikini-sunbathing-on-beach-on-vacation.jpg',
                    fit: BoxFit.cover,
                    alignment: Alignment(-0.1, 0),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: LinearGradient(
                          begin: FractionalOffset.topLeft,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            TColors.secondary,
                            Colors.white.withOpacity(0.0),
                          ],
                          stops: [
                            0.1,
                            0.9,
                          ])),
                ),
                PageView(
                  pageSnapping: true,
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      pageChanged = index;
                    });
                    print(pageChanged);
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  reverse: false,
                  children: [
                    /// -- Page View of Registration Form
                    RegistrationForm(
                      pageController: pageController,
                    ),

                    Column(
                      children: [
                        const SizedBox(height: 140),
                        Image.asset(
                          'assets/logos/vertical_logo_jbl.png',
                          width: 260,
                          height: 260,
                        ),
                        const SizedBox(height: 140),

                        /// Page 1
                        Container(
                          height: 220,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GradientButton(
                                text: 'LOGIN',
                                color: [
                                  Colors.orange.shade800,
                                  TColors.primary
                                ],
                                onPressed: () {
                                  pageController.animateToPage(++pageChanged,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut);
                                },
                                width: 260,
                                height: 42,
                              ),
                              GradientButton(
                                text: 'REGISTER',
                                color: [
                                  Colors.orange.shade800,
                                  TColors.primary
                                ],
                                onPressed: () {
                                  pageController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut);
                                },
                                width: 260,
                                height: 42,
                              ),
                              GradientButton(
                                style: Theme.of(context).textTheme.titleMedium!.apply(color: Colors.white),
                                text: 'Facebook',
                                color: [
                                  Colors.blue.shade800,
                                  Colors.blue.shade800
                                ],
                                imageIcon:
                                    'assets/logos/facebook-176-svgrepo-com.png',
                                width: 260,
                                height: 42,
                              ),
                              GradientButton(
                                text: 'CONTINUE AS GUEST',
                                color: [
                                  Colors.orange.shade800,
                                  TColors.primary
                                ],
                                onPressed: () =>
                                    Get.to(() => const GuestScreen()),
                                width: 260,
                                height: 42,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    /// Page 2 = Login Form
                    LoginForm(pageController: pageController),

                    /// Page 3 = Forgot Password
                    ForgotPasswordForm(pageController: pageController),
                  ],
                ),
              ],
            ),
          );
  }
}

