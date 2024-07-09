import 'package:appointment_app/features/shop/screens/notifications/notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import 'package:badges/badges.dart' as badges;

class TNotificationsMenuIcon extends StatelessWidget {
  const TNotificationsMenuIcon({
    super.key,
    required this.onPressed,
    this.iconColor = TColors.white,
  });

  final VoidCallback onPressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {

    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: -10, end: -12),
      showBadge: true,
      ignorePointer: false,
      onTap: () => Get.to(() => NotificationScreen()),
      badgeContent: Text(
        '3',
        style: Theme.of(context)
            .textTheme
            .labelSmall!
            .apply(color: TColors.primary),
      ),
      badgeAnimation: const badges.BadgeAnimation.scale(
        animationDuration: Duration(seconds: 1),
        colorChangeAnimationDuration: Duration(seconds: 1),
        loopAnimation: false,
        curve: Curves.fastOutSlowIn,
        colorChangeAnimationCurve: Curves.easeInCubic,
      ),
      badgeStyle: const badges.BadgeStyle(badgeColor: TColors.white),
      child: const Icon(
        Iconsax.notification,
        size: 24,
        color: TColors.white,
      ),
    );
  }
}
