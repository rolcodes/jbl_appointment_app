import 'package:appointment_app/features/authentication/screens/signup/verify_email.dart';
import 'package:appointment_app/navigation_menu.dart';
import 'package:appointment_app/res/components/custom_button.dart';
import 'package:appointment_app/services/database.dart';
import 'package:appointment_app/services/shared_pref.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:appointment_app/utils/constants/text_strings.dart';
import 'package:appointment_app/features/authentication/screens/login/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:random_string/random_string.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/popups/loaders.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  String? name, mail, password, number;

  /// Handle user inputs in text fields
  TextEditingController namecontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  /// Helps to check validation in each text fields
  final _formkey = GlobalKey<FormState>();

  registration() async {
    if (password != null && name != null && mail != null) {
      try {
        /// Creating user
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: mail!, password: password!);

        /// Each user needs to have random IDs
        String id = randomAlphaNumeric(10).toUpperCase();

        /// Save Data Locally
        await SharedPreferenceHelper().saveUserName(namecontroller.text);
        await SharedPreferenceHelper().saveUserNumber(numbercontroller.text);
        await SharedPreferenceHelper().saveUserEmail(emailcontroller.text);
        await SharedPreferenceHelper()
            .saveUserImage("assets/images/users/default_profile.png");
        await SharedPreferenceHelper().saveUserId(id);

        /// Save Data in Firebase using Map String Dynamic
        Map<String, dynamic> userInfoMap = {
          "Name": namecontroller.text,
          "Email": emailcontroller.text,
          "Phone No.": numbercontroller.text,
          "Id": id,
          "Image": "assets/images/users/default_profile.png"
        };

        /// Add User Data in Firebase, using the id as Document ID name in Firebase
        await DatabaseMethods().addUserDetails(userInfoMap);

        /// -- Show Verify Screen
        Get.to(() => VerifyEmailScreen(email: mail));

        /// ignore: use_build_context_synchronously
        // Get.offAll(const NavigationMenu());
      } on FirebaseAuthException catch (e) {
        TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.light,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      alignment: const Alignment(0, -1.9),
                      image: const AssetImage(
                          "assets/images/banners/410505343_717263193720588_2903025780141441988_n.jpg"),
                      fit: BoxFit.contain,
                      colorFilter: ColorFilter.mode(
                          Colors.grey.shade300.withOpacity(0.5),
                          BlendMode.modulate)),
                ),
              ),
              Positioned(
                  top: 65,
                  right: 90,
                  child: Image.asset(
                      'assets/logos/jbl-logo-removebg-whiteshadow.png',
                      width: 250)),
              Positioned(
                top: 300,
                child: Container(
                  height: 1200,
                  width: MediaQuery.of(context).size.width / 1,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 20,
                          offset: const Offset(0, -4),
                        )
                      ],
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      children: [
                        /// Logo, Title & Subtitle
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const Image(
                            //   height: 50,
                            //   image: AssetImage(TImages.appLogo),
                            // ),
                            const SizedBox(height: 10),
                            Text(
                              TTexts.createAccountTitle,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              TTexts.loginSubTitle,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),

                            /// Form
                            Form(
                              key: _formkey,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: TSizes.spaceBtwSections),
                                child: Column(
                                  children: <Widget>[
                                    /// Full name
                                    TextFormField(
                                      controller: namecontroller,
                                      decoration: const InputDecoration(
                                          prefixIcon: Icon(Iconsax.user),
                                          hintText: TTexts.fullName),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter Name';
                                        }
                                        return null;
                                      },
                                      // First Letter Capital
                                      textCapitalization:
                                          TextCapitalization.words,
                                    ),
                                    const SizedBox(
                                        height: TSizes.spaceBtwInputFields),

                                    /// Number
                                    TextFormField(
                                      controller: numbercontroller,
                                      decoration: const InputDecoration(
                                          prefixIcon: Icon(Iconsax.call),
                                          hintText: TTexts.number),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your number!';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                        height: TSizes.spaceBtwInputFields),

                                    /// Email
                                    TextFormField(
                                      controller: emailcontroller,
                                      decoration: const InputDecoration(
                                          prefixIcon: Icon(Iconsax.message),
                                          hintText: TTexts.email),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter Email';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                        height: TSizes.spaceBtwInputFields),

                                    /// Password
                                    TextFormField(
                                      obscureText: true,
                                      controller: passwordcontroller,
                                      decoration: const InputDecoration(
                                          prefixIcon:
                                              Icon(Iconsax.password_check),
                                          hintText: TTexts.password),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter Password';
                                        }
                                        return null;
                                      },
                                    ),

                                    const SizedBox(
                                        height: TSizes.spaceBtwSections),

                                    /// Create Account Button
                                    CustomButton(
                                        buttonText: TTexts.createAccount,
                                        onTap: () {
                                          if (_formkey.currentState!
                                              .validate()) {
                                            setState(() {
                                              mail = emailcontroller.text;
                                              number = numbercontroller.text;
                                              name = namecontroller.text;
                                              password =
                                                  passwordcontroller.text;
                                            });
                                          }

                                          registration();
                                        }),
                                    const SizedBox(height: TSizes.defaultSpace),

                                    /// Already have an account?
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(TTexts.alreadyHaveAccount),
                                        const SizedBox(
                                            height: TSizes.defaultSpace),
                                        const SizedBox(
                                            width: TSizes.spaceBtwItems / 2),
                                        GestureDetector(
                                          onTap: () =>
                                              Get.to(() => const LoginView()),
                                          child: const Text(TTexts.login,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
