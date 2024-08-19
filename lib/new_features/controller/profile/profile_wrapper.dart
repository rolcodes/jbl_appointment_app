import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jbl/new_features/screen/profile_screen/profile.dart';

import '../../../services/database.dart';
import '../../../utils/constants/colors.dart';
import '../../screen/profile_screen/widget/edit_profile.dart';

class ProfileWrapper extends StatelessWidget {
  const ProfileWrapper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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

              /// Show Profile Screen
              : ProfileScreen(user: user);
        } else {
          return Container();
        }
      },
    );
  }
}
