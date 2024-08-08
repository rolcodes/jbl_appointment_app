import 'package:flutter/material.dart';
import 'package:jbl/utils/device/device_utility.dart';

class TSettingMenuTile extends StatelessWidget {
  const TSettingMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.trailing,
    this.onTap,
    required this.titleSmall,
    required this.subTitleSmall,
  });

  final bool titleSmall, subTitleSmall;
  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          leading: Icon(icon, size: 28, color: Colors.black),
          title: titleSmall
              ? Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .apply(fontSizeDelta: -1))
              : Text(title, style: Theme.of(context).textTheme.titleMedium),
          subtitle: subTitleSmall
              ? Text(subTitle,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(fontSizeDelta: -1))
              : Text(subTitle, style: Theme.of(context).textTheme.labelMedium),
          trailing: trailing,
          onTap: onTap,
        ),
      ),
    );
  }
}
