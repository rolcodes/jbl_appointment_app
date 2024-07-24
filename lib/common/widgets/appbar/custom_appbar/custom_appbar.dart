import 'package:appointment_app/common/widgets/appbar/custom_appbar/widget/notification_badge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/device/device_utility.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.iconColor,
    required this.showBackgroundColor,
    required this.showIcon,
    required this.isDrawer,
    this.isCenterTitle,
    required this.isNotification,
    required this.isEdit,
  });

  final Widget? title;
  final List<Widget>? actions;
  final Color? iconColor;
  final bool showBackgroundColor;
  final bool showIcon;
  final bool isDrawer;
  final bool? isCenterTitle;
  final bool isNotification;
  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 10),
      child: AppBar(
          iconTheme: IconThemeData(color: iconColor),
          title: title,
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          centerTitle: isCenterTitle,
          forceMaterialTransparency: true,
          leading: isDrawer
              ? Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      icon: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: showBackgroundColor
                              ? TColors.primary.withOpacity(0.75)
                              : Colors.transparent,
                        ),
                        child: Icon(
                          Icons.menu,
                          color: showIcon ? iconColor : Colors.transparent,
                        ),
                      ),
                    );
                  },
                )
              : IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: showBackgroundColor
                          ? TColors.primary.withOpacity(0.75)
                          : Colors.transparent,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: showIcon ? iconColor : Colors.transparent,
                      size: 20,
                    ),
                  ),
                ),
          actions: [
            isNotification
                ? Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: showBackgroundColor
                          ? TColors.primary.withOpacity(0.75)
                          : Colors.transparent,
                    ),
                    child: Center(
                      child: NotificationBadge(
                        iconColor: showBackgroundColor
                            ? TColors.white
                            : TColors.primary,
                      ),
                    ),
                  )
                : isEdit
                    ? InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          decoration: BoxDecoration(
                            color: showBackgroundColor
                                ? TColors.primary.withOpacity(0.75)
                                : Colors.transparent,
                          ),
                          child: const Icon(Icons.edit_outlined),
                        ),
                      )
                    : Container(),
          ]),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
