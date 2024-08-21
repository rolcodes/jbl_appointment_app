import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jbl/new_features/screen/new_home_screen/widget/my_appointments/my_appointment_detail/widget/update_select_staff.dart';
import 'package:jbl/utils/popups/loaders.dart';
import 'package:provider/provider.dart';

import '../../../../services/shared_pref.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../models/calendar_model.dart';
import '../../../models/data/dummy_data.dart';
import '../../../models/time_model.dart';
import '../../select_staff/select_staff.dart';

class TimeItem extends StatefulWidget {
  const TimeItem({super.key, required this.selectTime});

  final TimeClass selectTime;

  @override
  State<TimeItem> createState() => _TimeItemState();
}

TextEditingController pickedDate = TextEditingController();

class _TimeItemState extends State<TimeItem> {
  // final Function() onSelectedTime;
  bool isPressed = false;

  /// -- Method to navigate to select staff screen
  void onSelectTime(BuildContext context, String selectedTime) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) {
        return SelectStaffScreen(
          services: dummyServices,
          staff: dummyStaff,
          selectedTime: selectedTime,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    String? time;

    /// -- List to selected data, and update to text controller
    /// -- Listen to picked date and update to text controller
    pickedDate.text = DateFormat('MMM d') // EEEE, MMM d, yyyy
        .format(Provider.of<CalendarModel>(context, listen: true)
            .firstDate); //.add_yMd()

    final isMobileSmall = TDeviceUtils.getScreenWidth(context) <= 393;

    final selectedTime = widget.selectTime.time;

    return Material(
      color: isPressed ? TColors.primary : Colors.grey.shade200,
      shadowColor: Colors.grey.withOpacity(0.2),
      elevation: 1,
      borderRadius: BorderRadius.circular(100),
      child: TextButton(
        style: TextButton.styleFrom(foregroundColor: Colors.red),

        /// Function
        onPressed: () {
          /// Button Color Indicator
          setState(() {
            isPressed = !isPressed;
          });

          /// Display Dialog Box
          showDialog(
              barrierDismissible: false,
              context: (context),
              builder: (ctx) => CupertinoAlertDialog(
                    title: Text(
                      '${pickedDate.text}, 2024, $selectedTime',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    content: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Are you sure to your selected schedule?',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: Text("No",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .apply(color: Colors.grey.shade700)),
                        onPressed: () {
                          setState(() {
                            isPressed = false;
                          });

                          /// Remove selected time after a pop
                          SharedPreferenceHelper().removeServiceTime();

                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text("Yes",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .apply(color: CupertinoColors.activeBlue)),
                        onPressed: () async {
                          /// Save selected time in local database using shared preferences
                          SharedPreferenceHelper()
                              .saveServiceTime(selectedTime);

                          time =
                              await SharedPreferenceHelper().getServiceTime();

                          if (time == null) {
                            TLoaders.errorSnackBar(
                                title: 'Error',
                                message:
                                    'Make sure to select time to proceed!');
                          } else {
                            onSelectTime(context, selectedTime);
                          }
                        },
                      ),
                    ],
                  ));
        },
        child: Center(
          child: Text(
            widget.selectTime.time,
            style: isMobileSmall
                ? Theme.of(context).textTheme.titleSmall!.apply(
                    color: isPressed ? Colors.white : Colors.black,
                    fontSizeDelta: -2)
                : Theme.of(context).textTheme.titleSmall!.apply(
                    color: isPressed ? Colors.white : Colors.black,
                    fontWeightDelta: isPressed ? 2 : 0),
          ),
        ),
      ),
    );
  }
}
