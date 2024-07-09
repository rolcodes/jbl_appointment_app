import 'package:appointment_app/new_features/models/time_model.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../services/shared_pref.dart';

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
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .apply(color: Colors.black),
        ),
      ),
    );
  }
}
