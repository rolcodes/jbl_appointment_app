
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appbar/custom_appbar/custom_appbar.dart';
import '../../../../services/database.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../new_navigation_menu.dart';
import 'custom_edit_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String uid = FirebaseAuth.instance.currentUser!.uid;

  /// Edit field
  Future<void> editField(String field) async {

    String? newValue;
    return await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: TColors.light,
        title: Text('Edit $field'),
        content: TextField(
          onTapOutside: (PointerDownEvent event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          autofocus: true,
          decoration: InputDecoration(
            hintText: "Enter new $field",
          ),
          onChanged: (value) {
            newValue = value;
            setState(() {});
          },
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          TextButton(
              onPressed: () async {
                /// Update in Firestore
                if (newValue!.trim().isNotEmpty) {
                  /// only update if there is something in the textfield
                  await FirebaseFirestore.instance
                      .collection('user')
                      .doc(uid)
                      .update({field: newValue});
                }

                TLoaders.successSnackBar(
                    title: 'Saved successfully',
                    message: 'Changes was saved successfuly.');

                await Future.delayed(const Duration(seconds: 1));

                // Navigator.of(context).pop(newValue);
                Get.offAll(() => const NewNavigationMenu());
              },
              child: const Text('Save')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.secondary,
      appBar: CustomAppBar(
        backgroundColor: TColors.light,
        showBackgroundColor: false,
        showIcon: true,
        isDrawer: false,
        isNotification: false,
        iconColor: TColors.primary,
        isEdit: false,
        isCenterTitle: true,
        title: Text(
          'Edit Profile',
          style: Theme.of(context).textTheme.titleMedium!.apply(fontSizeDelta: 2, color: TColors.primary),
        ),
      ),
      body: FutureBuilder(
        future: DatabaseMethods().readUser(),
        builder: (context, snapshot) {
          /// Display Error
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong!'));
          }

          /// Show content
          else if (snapshot.hasData) {
            final isMobileSmall = TDeviceUtils.getScreenWidth(context) <= 393;

            /// Variable for data
            final user = snapshot.data;
            return user == null
                ? SizedBox(
                    height: 600,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/on_boarding_images/No data-amico.png',
                          height: 250,
                          width: 250,
                          fit: BoxFit.contain,
                        ),
                        Center(
                          child: Text(
                            'No data',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Center(
                          child: Text(
                            'Sorry. No data available.',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: TColors.darkGrey),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                  child: Stack(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Positioned(
                          top: 10,
                          left: isMobileSmall ? 120 : 138,
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/users/default_profile.png',
                              height: 150,
                              width: 150,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 104,
                          left: isMobileSmall ? 220 : 240,
                          child: IconButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.grey.shade400),
                              side: const WidgetStatePropertyAll(
                                BorderSide(color: TColors.secondary, width: 3),
                              ),
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.image_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 180,
                          child: Container(
                            height: 640,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 40),
                            decoration: BoxDecoration(
                              color: TColors.white.withOpacity(0.5),
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(60),
                                  topLeft: Radius.circular(60)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomEditField(
                                  title: 'Full Name',
                                  subtitle: user.name,
                                  isCopy: false,
                                  onTap: () {
                                    editField('name');
                                    print('full name clicked');
                                  },
                                ),
                                CustomEditField(
                                  title: 'Email',
                                  subtitle: user.email,
                                  isCopy: false,
                                  onTap: () {
                                    editField('email');
                                  },
                                ),
                                CustomEditField(
                                  title: 'Phone No.',
                                  subtitle: user.telephone,
                                  isCopy: false,
                                  onTap: () {
                                    editField('telephone');
                                  },
                                ),
                                CustomEditField(
                                  title: 'Account ID',
                                  subtitle: user.id,
                                  isCopy: true,
                                  onTap: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        duration: Duration(seconds: 2),
                                        content:
                                            Text('Text copied to clipboard.'),
                                      ),
                                    );
                                  },
                                ),
                                CustomEditField(
                                  title: 'Password',
                                  subtitle: '*********',
                                  isCopy: false,
                                  onTap: () {
                                    editField;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                );
          } else {
            /// Show loading indicator
            const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
