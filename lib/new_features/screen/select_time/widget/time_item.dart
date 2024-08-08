
import 'package:flutter/material.dart';

import '../../../../services/shared_pref.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../models/time_model.dart';

class TimeItem extends StatefulWidget {
  const TimeItem({super.key, required this.selectTime});

  final TimeClass selectTime;

  @override
  State<TimeItem> createState() => _TimeItemState();
}

class _TimeItemState extends State<TimeItem> {
  // final Function() onSelectedTime;
  // bool click = false;

  @override
  Widget build(BuildContext context) {
    final isMobileSmall = TDeviceUtils.getScreenWidth(context) <= 393;

    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: Colors.grey.shade300,
          foregroundColor: TColors.primary),

      /// Function
      onPressed: () async {
        /// Save selected time in local database using shared preferences
        await SharedPreferenceHelper().saveServiceTime(widget.selectTime.time);
      },
      child: Center(
        child: Text(
          widget.selectTime.time,
          style: isMobileSmall ? Theme.of(context)
              .textTheme
              .titleSmall!
              .apply(color: Colors.black, fontSizeDelta: -2) : Theme.of(context)
              .textTheme
              .titleSmall!
              .apply(color: Colors.black),
        ),
      ),
    );
  }
}
