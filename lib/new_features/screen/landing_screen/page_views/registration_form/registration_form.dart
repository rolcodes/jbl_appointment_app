import 'package:appointment_app/new_features/models/user_model.dart';
import 'package:appointment_app/new_features/new_navigation_menu.dart';
import 'package:appointment_app/new_features/screen/landing_screen/non_screen_widget/gradient_button.dart';
import 'package:appointment_app/new_features/screen/landing_screen/page_views/regex/regex.dart';
import 'package:appointment_app/new_features/screen/landing_screen/page_views/registration_form/widget/privacy_policy.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';
import '../../../../../services/database.dart';
import '../../../../../services/shared_pref.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/popups/loaders.dart';
import '../../landing_screen.dart';
import '../../non_screen_widget/custom_textformfield.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  /// -- Variables
  String? name, mail, password, number;
  bool checkedValue = false;

  /// Handle user inputs in text fields
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /// Registration
  registration() async {
    if (password != null && name != null && mail != null && number != null) {
      try {
        /// Creating user
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: mail!, password: password!);

        /// Each user needs to have random IDs
        String id = randomAlphaNumeric(10).toUpperCase();

        /// Get current user
        String uid = FirebaseAuth.instance.currentUser!.uid;

        /// Save Data Locally
        await SharedPreferenceHelper().saveUserName(nameController.text);
        await SharedPreferenceHelper().saveUserNumber(numberController.text);
        await SharedPreferenceHelper().saveUserEmail(emailController.text);
        await SharedPreferenceHelper()
            .saveUserImage("assets/images/users/default_profile.png");
        await SharedPreferenceHelper().saveUserId(id);

        /// Save Data in Firebase using Map String Dynamic
        // Map<String, dynamic> userInfoMap = {
        //   "name": nameController.text,
        //   "email": emailController.text,
        //   "telephone.": numberController.text,
        //   "id": uid,
        //   "image":
        //       "https://jblnew.keywcomm.com/wp-content/uploads/2024/07/default_profile.png"
        // };

        final user = UserModel(
          name: nameController.text,
          email: emailController.text,
          telephone: numberController.text,
          id: uid,
        );
        final json = user.toJson();

        /// Add User Data in Firebase, using the id as Document ID name in Firebase
        // await DatabaseMethods().addUserDetails(userInfoMap, id);
        await DatabaseMethods().addUserDetails(json);


        TLoaders.successSnackBar(
            title: 'Congratulations!',
            message: 'Your account was successfully created!',
            duration: 3);

        Future.delayed(const Duration(seconds: 3));

        /// -- Show Verify Screen
        Get.offAll(() => const NewNavigationMenu());

        /// ignore: use_build_context_synchronously
        // Get.offAll(const NavigationMenu());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          // TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
        } else if (e.code == 'email-already-in-use') {
          TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
        } else if (e.code == 'invalid-email') {
          TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
        }
      }
    }
  }

  /// Helps to check validation in each text fields
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 56),
          Padding(
            padding: const EdgeInsets.only(right: 5, top:5),
            child: IconButton(
              onPressed: () {
                widget.pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              },
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: TColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 70),
          Center(
            child: Image.asset(
              'assets/logos/jbl-logo-removebg-preview.png',
              width: 300,
            ),
          ),
          const SizedBox(height: 40),
          Center(
            child: SizedBox(
              height: 400,
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomTextFormField(
                      textController: nameController,
                      hint: 'Full Name',
                      obscureText: false,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r"[a-zA-Z]+|\s"),
                        )
                      ],
                      validator: (value) {
                        if (!value!.isValidName) {
                          return 'Please enter your full name';
                        }
                      },
                      textCapitalization: TextCapitalization.words,
                    ),
                    CustomTextFormField(
                      textController: emailController,
                      hint: 'Email',
                      obscureText: false,
                      validator: (value) {
                        if (!value!.isValidEmail) {
                          return 'Please enter valid email';
                        }
                      },
                      textCapitalization: TextCapitalization.none,
                    ),
                    CustomTextFormField(
                      textController: numberController,
                      hint: 'Phone Number',
                      obscureText: false,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r"[0-9]"),
                        ),
                      ],
                      validator: (value) {
                        if (!value!.isValidPhone) {
                          return 'Please enter a valid number';
                        }
                      },
                      textCapitalization: TextCapitalization.none,
                    ),
                    CustomTextFormField(
                      textController: passwordController,
                      hint: 'Password',
                      obscureText: false,
                      validator: (value) {
                        if (!value!.isValidPassword) {
                          return 'Please enter a valid password';
                        }
                      },
                      textCapitalization: TextCapitalization.none,
                    ),

                    /// -- Checkbox for Terms & Conditions
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          focusColor: Colors.white,
                          fillColor:
                              const WidgetStatePropertyAll(TColors.primary),
                          activeColor: Colors.white,
                          checkColor: Colors.white,
                          // hoverColor: Colors.white,
                          // overlayColor: WidgetStatePropertyAll(Colors.white),
                          side: const BorderSide(color: Colors.white),
                          value: checkedValue,
                          onChanged: (newValue) {
                            setState(() {
                              checkedValue = newValue!;
                            });
                          },
                        ),
                        SizedBox(
                          width: 240,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'By creating an account, you',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      offset: Offset(1, 1),
                                      blurRadius: 20,
                                      color: Colors.grey.withOpacity(1),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'agree to our ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .apply(
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(1, 1),
                                          blurRadius: 20,
                                          color: Colors.grey.withOpacity(1),
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                      style: const ButtonStyle(
                                        padding: WidgetStatePropertyAll(
                                            EdgeInsets.zero),
                                        minimumSize: WidgetStatePropertyAll(
                                          Size(50, 30),
                                        ),
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      onPressed: () =>
                                          Get.to(() => const PrivacyPolicy()),
                                      child: Text(
                                        'Privacy Policy',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .apply(
                                          color: Colors.amberAccent.shade700,
                                          fontWeightDelta: 1,
                                          shadows: [
                                            Shadow(
                                              offset: Offset(1, 1),
                                              blurRadius: 20,
                                              color: Colors.grey.withOpacity(1),
                                            ),
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 18),

                    /// -- Button
                    GradientButton(
                      text: 'Continue',
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          setState(() {
                            name = nameController.text.trim();
                            mail = emailController.text;
                            number = numberController.text.trim();
                            password = passwordController.text;
                          });
                          print('Set State');
                        }

                        /// -- Condition for Checkbox
                        checkedValue
                            ? registration()
                            : showDialog(
                                context: context,
                                builder: (ctx) => CupertinoAlertDialog(
                                  content: Text(
                                      'Please fill out the following fields to proceed.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .apply(color: Colors.black)),
                                  actions: [
                                    TextButton(
                                      child: Text("OK",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium),
                                      onPressed: () {
                                        Get.back();
                                      },
                                    ),
                                  ],
                                ),
                              );
                      },
                      color: [Colors.orange.shade800, TColors.primary],
                      width: 260,
                      height: 42,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
