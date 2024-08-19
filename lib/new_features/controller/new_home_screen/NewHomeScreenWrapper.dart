import 'package:flutter/material.dart';
import 'package:jbl/new_features/screen/new_home_screen/new_home_screen.dart';
import 'package:jbl/utils/device/device_screen_ratio.dart';

import '../../../services/database.dart';
import '../../../services/shared_pref.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';
import '../../models/user_model.dart';

class NewHomeScreenWrapper extends StatelessWidget {
  const NewHomeScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel?>(
      future: DatabaseMethods().readUser(),
      builder: (context, snapshot) {
        /// Loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: TColors.primary,
            ),
          );
        }

        /// Error
        else if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        /// Data
        else if (snapshot.hasData) {
          final user = snapshot.data;

          return user == null
              ? Container()

              /// Show Home Screen with user data
              : NewHomeScreen(user: user);
        } else {
          return Container();
        }
      },
    );
  }
}
