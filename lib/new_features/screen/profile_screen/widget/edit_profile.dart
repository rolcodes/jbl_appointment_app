import 'package:appointment_app/common/widgets/appbar/custom_appbar/custom_appbar.dart';
import 'package:appointment_app/services/database.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import 'custom_edit_field.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.secondary,
      appBar: CustomAppBar(
        showBackgroundColor: false,
        showIcon: true,
        isDrawer: false,
        isNotification: false,
        isEdit: false,
        isCenterTitle: true,
        title: Text(
          'Edit Profile',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: DatabaseMethods().readUser(),
          builder: (context, snapshot) {
            /// Display Error
            if (snapshot.hasError) {
              return Center(child: Text('Something went wrong!'));
            }

            /// Show content
            else if (snapshot.hasData) {
              /// Variable for data
              final user = snapshot.data;
              return user == null
                  ? Container()
                  : Container(
                      height: 600,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/users/default_profile.png',
                                height: 120,
                                width: 120,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          CustomEditField(
                            title: 'Full Name',
                            subtitle: user.name,
                            onTap: () {},
                          ),
                          CustomEditField(
                            title: 'Email',
                            subtitle: user.email,
                            onTap: () {},
                          ),
                          CustomEditField(
                            title: 'Phone No.',
                            subtitle: user.telephone,
                            onTap: () {},
                          ),
                          CustomEditField(
                            title: 'Account ID',
                            subtitle: user.id,
                            onTap: () {},
                          ),
                          CustomEditField(
                            title: 'Password',
                            subtitle: '',
                            onTap: () {},
                          ),
                        ],
                      ),
                    );
            } else {
              /// Show loading indicator
              Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
