import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  /// This is a custom class to create background color in TabBar
  /// To do that we need PreferredSizeWidget
  const TTabBar({
    super.key,
    required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: TColors.lightGrey,
      child: TabBar(
        padding: const EdgeInsets.only(top: 4, bottom: 4),
        dividerColor: TColors.primary,
        tabs: tabs,
        // isScrollable: true,
        // indicatorColor: Colors.orangeAccent.shade200,
        // labelColor: Colors.orangeAccent.shade200,
        // unselectedLabelColor: TColors.darkGrey,
        indicatorColor: TColors.accent,
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        unselectedLabelColor: TColors.primary,
        labelColor: TColors.accent,
        splashBorderRadius: BorderRadius.circular(20),
        labelStyle: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  @override
// TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight((TDeviceUtils.getAppBarHeight()));
}
