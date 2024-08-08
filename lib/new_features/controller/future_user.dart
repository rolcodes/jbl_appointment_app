import 'package:flutter/material.dart';

import '../../services/database.dart';
import '../../services/shared_pref.dart';
import '../../utils/device/device_utility.dart';
import '../models/user_model.dart';

class FutureUser extends StatelessWidget {
  const FutureUser({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobileSmall = TDeviceUtils.getScreenWidth(context) <= 393;

    return FutureBuilder<UserModel?>(
      future: DatabaseMethods().readUser(),
      builder: (context, snapshot)  {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        } else if (snapshot.hasData)  {
          final user = snapshot.data;

          return user == null
              ? Container()
              : Text("Hi, ${user.name}",
              style: isMobileSmall ?  Theme.of(context)
                  .textTheme
                  .titleLarge!.apply(fontSizeDelta: -1) : Theme.of(context)
                  .textTheme
                  .titleLarge );
        } else {
          return Container();
        }
      },
    );


  }
}
