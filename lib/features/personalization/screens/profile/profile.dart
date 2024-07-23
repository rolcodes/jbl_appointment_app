import 'dart:io';

import 'package:appointment_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:appointment_app/navigation_menu.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../services/shared_pref.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../authentication/screens/login/login_view.dart';

class ProfileOldScreen extends StatefulWidget {
  const ProfileOldScreen({super.key});

  @override
  State<ProfileOldScreen> createState() => _ProfileOldScreenState();
}

class _ProfileOldScreenState extends State<ProfileOldScreen> {
  // SOLUTION #1
  // File? _image;
  // final picker = ImagePicker();
  //
  // Future getImage() async {
  //   final pickedImage = await picker.pickImage(source: ImageSource.gallery);
  //
  //   setState(() {
  //     if (pickedImage != null) {
  //       _image = File(pickedImage.path);
  //       // SharedPreferenceHelper.saveImageToPreferences(
  //       //     SharedPreferenceHelper.base64String(
  //       //         snapshot.data.readAsBytesSync()));
  //     } else {
  //       print("No image is picked");
  //     }
  //   });
  // }

  // SOLUTION #2
  // late Future<XFile?> imageFile;
  //
  // pickImageFromGallery(ImageSource source) {
  //   imageFile = ImagePicker().pickImage(source: source);
  // }
  //
  // Widget imageFromGallery() {
  //   return FutureBuilder<XFile?>(
  //     future: imageFile,
  //     builder: (BuildContext context, AsyncSnapshot<XFile?> snapshot) {
  //       if (snapshot.connectionState == ConnectionState.done) {
  //         if (null == snapshot.data) {
  //           return const Text(
  //             "Error",
  //             textAlign: TextAlign.center,
  //           );
  //         }
  //         return Image.file(snapshot.data as File);
  //       }
  //       if (null != snapshot.error) {
  //         return const Text(
  //           "Error Picking Image",
  //           textAlign: TextAlign.center,
  //         );
  //       }
  //       return const Text(
  //         'No Image Selected',
  //         textAlign: TextAlign.center,
  //       );
  //     },
  //   );
  // }

  // SOLUTION #3
  // Uint8List? _image;
  //
  // void selectImage() async {
  //   Uint8List img = await pickImage(ImageSource.gallery);
  //   setState(() {
  //     _image = img;
  //   });
  // }
  //
  // void saveProfile()async {
  //   String resp = await StoreData().saveData(file: _image!);
  // }

  // SOLUTION #5
  // File? image;
  //
  // Future pickImage() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image == null) return;
  //
  //     // final imageTemporary = File(image.path);
  //     final imagePermanent = await saveImagePermanently(image.path);
  //     setState(() => this.image = imagePermanent);
  //   } on PlatformException catch (e) {
  //     print('Failed to pick image: $e');
  //   }
  // }
  //
  // Future<File> saveImagePermanently(String imagePath) async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   final name = basename(imagePath);
  //   final image = File('${directory.path}/$name');
  //
  //   return File(imagePath).copy(image.path);
  // }

  // SOLUTION #6
  // Uint8List? pickedImage;
  //
  // Future<void> onProfileTapped() async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  //   if (image == null) return;
  //
  //   final storageRef = FirebaseStorage.instance.ref();
  //   final imageRef = storageRef.child("user_1.jpg");
  //   final imageBytes = await image.readAsBytes();
  //   await imageRef.putData(imageBytes);
  //
  //   setState(() => pickedImage = imageBytes);
  // }

  String? name, email, number, id;

  /// Get name, email, number & image from local storage
  getDataFromSharedPref() async {
    name = (await SharedPreferenceHelper().getUserName())!;
    email = (await SharedPreferenceHelper().getUserEmail())!;
    // image = await SharedPreferenceHelper().getUserImage();
    id = (await SharedPreferenceHelper().getUserID())!;
    number = (await SharedPreferenceHelper().getUserNumber())!;

    setState(() {});
  }

  getOnTheLoad() async {
    await getDataFromSharedPref();
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
     getData();
    super.initState();
  }

  // @override
  // void dispose() {
  //   getImg().dispose;
  //   super.dispose();
  // }

  // SOLUTION #7
  // File? _image;
  // Future getImage() async {
  //   var image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //
  //   setState(() {
  //     _image = image as File?;
  //     print('Image Path $_image');
  //   });
  // }
  //
  // Future uploadPic(BuildContext context) async {
  //   String filName = basename(_image!.path);
  //   StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(filName);
  // }

  // SOLUTION #8
  // Future getImage(ImageSource imageSource) async {
  //   final XFile? image =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (image == null) return;
  //
  //   final String duplicateFilePath = await getApplicationDocumentsDirectory().path;
  //
  //   final var fileName = basename(file.path);
  //   final File localImage = await image.saveTo('$duplicateFilePath/$fileName');
  //
  //   setState(() {
  //     _image = image;
  //   });
  // }

  // SOLUTION #10
  File? imgFile;
  String? imgPath;

  getImg() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      saveData(pickedImage.path.toString()); // path cache
      setState(() {
        imgFile = File(pickedImage.path);
      });

      await Future.delayed(const Duration(seconds: 1));

      TLoaders.saveSnackBar(
          title: 'Successful!',
          message: 'Profile photo was saved successfully.');
    } else {
      return null;
    }
  }

  void saveData(String val) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString('path', val);
    getData();
  }

  void getData() async {
    final sharedPref = await SharedPreferences.getInstance();
    setState(() {
      imgPath = sharedPref.getString('path');
    });
    // imageSP();
    await SharedPreferenceHelper().saveUserImage(imgPath!);
  }

  // /// Save image in shared_pref
  // void imageSP() async {
  //   await SharedPreferenceHelper().saveUserImage(imgPath!);
  // }

  // void deleteData() async {
  //   final sharedPref = await SharedPreferences.getInstance();
  //   sharedPref.remove('path');
  //   getData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: TColors.secondary,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Profile',
              style: Theme.of(context).textTheme.headlineMedium),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => Get.offAll(() => const NavigationMenu()),
                icon: const Icon(Icons.clear))
          ],
        ),

        /// Body
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 24),
            child: Column(
              children: [
                /// Custom App Bar
                // Row(
                //   children: [
                //     IconButton(
                //       onPressed: () => Get.to(() => const NavigationMenu()),
                //       icon: Icon(Icons.arrow_back_ios_new_rounded),
                //     ),
                //   ],
                // ),

                /// Profile Picture
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      // SOLUTION #1
                      // Center(
                      //   child: _image != null
                      //       ? Image.file(_image!)
                      //       : const CircleAvatar(
                      //           backgroundColor: Colors.transparent,
                      //           backgroundImage: AssetImage(
                      //               "assets/images/users/default_profile.png"),
                      //           radius: 70,
                      //         ),
                      // ),

                      // SOLUTION #5
                      // image != null
                      //     ? ClipOval(
                      //         child: Image.file(
                      //           image!,
                      //           width: 140,
                      //           height: 140,
                      //           fit: BoxFit.cover,
                      //         ),
                      //       )
                      //     : const CircleAvatar(
                      //         backgroundColor: Colors.transparent,
                      //         backgroundImage: AssetImage(
                      //             "assets/images/users/default_profile.png"),
                      //         radius: 70,
                      //       ),

                      // SOLUTION #6
                      // Container(
                      //   decoration: BoxDecoration(
                      //     color: Colors.grey,
                      //     shape: BoxShape.circle,
                      //     image: pickedImage != null
                      //         ? DecorationImage(
                      //             fit: BoxFit.cover,
                      //             image: Image.memory(
                      //               fit: BoxFit.cover,
                      //               pickedImage!,
                      //             ).image,
                      //           )
                      //         : null,
                      //   ),
                      // ),

                      // SOLUTION #7
                      // CircleAvatar(
                      //   backgroundColor: Colors.transparent,
                      //   radius: 70,
                      //   child: ClipOval(
                      //     child: (_image != null)
                      //         ? Image.file(_image!, fit: BoxFit.fill)
                      //         : Image.asset(
                      //             'assets/images/users/default_profile.png',
                      //             fit: BoxFit.fill,
                      //           ),
                      //   ),
                      // ),

                      // imgPath != null
                      //     ? ClipOval(
                      //         child: Image.file(
                      //           File(imgPath!),
                      //           width: 130,
                      //         ),
                      //       )
                      //     : const CircleAvatar(
                      //         backgroundColor: Colors.transparent,
                      //         backgroundImage: AssetImage(
                      //             "assets/images/users/default_profile.png"),
                      //         radius: 70,
                      //       ),

                      // imgPath == null ? const CircleAvatar(
                      //   backgroundColor: Colors.transparent,
                      //   backgroundImage: AssetImage(
                      //       "assets/images/users/default_profile.png"),
                      //   radius: 70,
                      // ) : ClipOval(
                      //   child: Image.file(
                      //     File(imgPath!),
                      //     width: 130,
                      //   ),
                      // ),

                      const CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage(
                            "assets/images/users/default_profile.png"),
                        radius: 70,
                      ),

                      TextButton(
                        onPressed: () {
                          // getImg();

                          // UserPreferences.setUser(user);
                          // getImage();

                          // onProfileTapped();

                          // pickImage();

                          // getImage();

                          // Solution #4
                          // ImagePicker imagePicker = ImagePicker();
                          // XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
                          // print('${file?.path}');
                          //
                          // if (file == null) return;
                          // String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
                          //
                          // // Get a reference to storage root
                          // Reference referenceRoot = FirebaseStorage.instance.ref();
                          // Reference referenceDirImages = referenceRoot.child('images');
                          //
                          // // Create a reference for the image to be stored
                          // Reference referenceImagetoUpload = referenceDirImages.child(uniqueFileName);
                          //
                          // // Handle errors/success
                          // try{
                          //   // Store the file
                          //   await referenceImagetoUpload.putFile(File(file!.path));
                          //   // Success: get the download URL
                          //   imageUrl = await referenceImagetoUpload.getDownloadURL();
                          // } catch(error) {
                          //   // Some error occured
                          // }
                          //
                          // // Store the file
                          // referenceImagetoUpload.putFile(File(file!.path));
                        },
                        child: const Text(
                          'Change Profile Picture',
                          style: TextStyle(color: TColors.primary),
                        ),
                      ),

                      // TextButton(
                      //   onPressed: () {
                      //     deleteData();
                      //   },
                      //   child: const Text(
                      //     'Delete Picture',
                      //     style: TextStyle(color: Colors.red),
                      //   ),
                      // )
                    ],
                  ),
                ),

                /// Details
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                /// Heading Profile Info
                const TSectionHeading(
                    title: 'Profile Information', showActionButton: false),

                // Null Check: Safe
                if (name != null)
                  TProfileMenu(
                    onPressed: () {},
                    title: 'Name',
                    value: name!,
                    icon: Icons.edit_outlined,
                  ),

                if (id != null)
                  TProfileMenu(
                    onPressed: () {},
                    title: 'User ID',
                    value: id!,
                    icon: Icons.copy_rounded,
                  ),
                if (email != null)
                  TProfileMenu(
                    onPressed: () {},
                    title: 'Email',
                    value: email!,
                    icon: Icons.edit_outlined,
                  ),
                if (number != null)
                  TProfileMenu(
                    onPressed: () {},
                    title: 'Phone Number',
                    value: number!,
                    icon: Icons.edit_outlined,
                  ),

                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                Center(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        textStyle: Theme.of(context).textTheme.labelLarge),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (ctx) => CupertinoAlertDialog(
                                title: const Text('Deactivate Account'),
                                content: const Text(
                                    'Are you sure you want to deactivate your account?'),
                                actions: [
                                  TextButton(
                                    child: const Text("Deactivate",
                                        style: TextStyle(
                                            color: CupertinoColors
                                                .destructiveRed)),
                                    onPressed: () async {
                                      /// Show snackbar
                                      TLoaders.successSnackBar(
                                          title: 'Deactivation is done!',
                                          message:
                                              'Your account has been deactivated! Thank you for trying our app.');

                                      /// delay function
                                      await Future.delayed(
                                          const Duration(seconds: 1));
                                      Get.offAll(() => const LoginView());
                                    },
                                  ),
                                  TextButton(
                                    child: const Text("Cancel",
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
                      'Deactivate Account',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
