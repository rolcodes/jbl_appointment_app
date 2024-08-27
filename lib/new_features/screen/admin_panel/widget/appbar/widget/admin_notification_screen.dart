import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';
import 'package:jbl/common/widgets/appbar/custom_appbar/custom_appbar.dart';
import 'package:jbl/new_features/screen/notification_screen/widget/notification_item.dart';
import 'package:jbl/utils/constants/colors.dart';
import 'package:jbl/utils/device/device_utility.dart';

class AdminNotificationScreen extends StatelessWidget {
  const AdminNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.light,
      appBar: CustomAppBar(
        showBackgroundColor: false,
        showIcon: true,
        iconColor: TColors.primary,
        isDrawer: false,
        isNotification: false,
        isEdit: false,
        isCenterTitle: true,
        title: Text(
          'Notification',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .apply(fontSizeDelta: 2, color: TColors.primary),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: TDeviceUtils.getScreenWidth(context),
          height: 580,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NotificationItem(
                onTap: () {},
                icon: Iconsax.notification_bing,
                text: 'Alerts',
              ),
              NotificationItem(
                onTap: () {},
                icon: Iconsax.direct_inbox,
                text: 'Requests',
              ),NotificationItem(
                onTap: () {},
                icon: Iconsax.slash,
                text: 'Cancelled',
              ),NotificationItem(
                onTap: () {},
                icon: Iconsax.box,
                text: 'Emails',
              ),
            ],
          ),
        ),
      ),
    );
  }
}


