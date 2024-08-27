import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jbl/common/widgets/appbar/custom_appbar/custom_appbar.dart';
import 'package:jbl/utils/constants/colors.dart';
import 'package:jbl/utils/device/device_utility.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
                icon: Iconsax.tag,
                text: 'Promotions',
              ),NotificationItem(
                onTap: () {},
                icon: Iconsax.discount_shape,
                text: 'Voucher Deals',
              ),NotificationItem(
                onTap: () {},
                icon: Iconsax.like_dislike,
                text: "Do's and Don'ts",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
  });

  final void Function() onTap;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: TColors.primary.withOpacity(0.1),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        splashColor: TColors.primary.withOpacity(0.5),
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          height: 125,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [TColors.primary, Colors.amber.shade900],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.headlineSmall!.apply(
                    color: TColors.primary,
                    fontSizeDelta: 10,
                    shadows: [
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(1, 3),
                        blurRadius: 4,
                        spreadRadius: 100,
                      ),
                    ],
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
