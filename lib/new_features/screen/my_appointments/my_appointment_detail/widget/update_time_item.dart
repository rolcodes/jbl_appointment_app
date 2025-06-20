import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jbl/new_features/screen/my_appointments/my_appointment_detail/widget/update_select_staff.dart';
import 'package:jbl/utils/popups/loaders.dart';
import 'package:provider/provider.dart';

import '../../../../../services/shared_pref.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../models/calendar_model.dart';
import '../../../../models/data/dummy_data.dart';
import '../../../../models/time_model.dart';

class UpdateTimeItem extends StatefulWidget {
  const UpdateTimeItem({super.key, required this.selectTime, required this.ds});

  final TimeClass selectTime;
  final DocumentSnapshot<Object?> ds;

  @override
  State<UpdateTimeItem> createState() => _UpdateTimeItemState();
}

TextEditingController pickedDate = TextEditingController();

class _UpdateTimeItemState extends State<UpdateTimeItem> {
  // final Function() onSelectedTime;
  bool isPressed = false;

  /// -- Method to navigate to select staff screen
  void onSelectTime(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) {
        return UpdateSelectTechnician(
          services: dummyServices,
          staff: dummyStaff,
          ds: widget.ds,
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

          showDialog(
              barrierDismissible: false,
              context: (context),
              builder: (ctx) => CupertinoAlertDialog(
                    title: Column(
                      children: [
                        Text(
                          '${pickedDate.text}, 2024',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          selectedTime,
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      ],
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
                            /// Pop dialog box and remove indicator color in button
                            Navigator.of(context).pop();
                            setState(() {
                              isPressed = false;
                            });

                            /// Method: Go to Select Staff Screen
                            onSelectTime(context);
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
