import 'package:appointment_app/features/shop/screens/notifications/notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import 'package:badges/badges.dart' as badges;

class NotificationBadge extends StatelessWidget {
  const NotificationBadge({
    super.key,
    this.iconColor,
  });

  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      position: badges.BadgePosition.custom(
        top: -10,
        start: 20,
        isCenter: true,
      ),
      showBadge: true,
      ignorePointer: false,
      onTap: () => Get.to(() => const NotificationScreen()),
      badgeContent: const Icon(
        Icons.circle,
        color: CupertinoColors.activeGreen,
        size: 8,
      ),
      // Text(
      //   '3',
      //   style: Theme.of(context)
      //       .textTheme
      //       .labelSmall!
      //       .apply(color: TColors.primary),
      // ),
      badgeAnimation: const badges.BadgeAnimation.scale(
        animationDuration: Duration(seconds: 1),
        colorChangeAnimationDuration: Duration(seconds: 1),
        loopAnimation: false,
        curve: Curves.fastOutSlowIn,
        colorChangeAnimationCurve: Curves.easeInCubic,
      ),
      badgeStyle: const badges.BadgeStyle(badgeColor: Colors.transparent),
      child: GestureDetector(
        onTap: () => Get.to(() => const NotificationScreen()),
        child: Align(
          alignment: Alignment.center,
          child: Icon(
            Iconsax.notification,
            size: 24,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
