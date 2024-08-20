import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jbl/new_features/screen/new_home_screen/widget/my_appointments/my_appointment_detail/widget/update_select_staff.dart';
import 'package:jbl/utils/popups/loaders.dart';
import 'package:provider/provider.dart';

import '../../../../../../../services/shared_pref.dart';
import '../../../../../../../utils/device/device_utility.dart';
import '../../../../../../models/calendar_model.dart';
import '../../../../../../models/data/dummy_data.dart';
import '../../../../../../models/time_model.dart';

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
  // bool click = false;

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

    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: Colors.grey.shade300, foregroundColor: Colors.red),

      /// Function
      onPressed: () {
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
                        time = await SharedPreferenceHelper().getServiceTime();

                        if (time == null) {
                          TLoaders.errorSnackBar(
                              title: 'Error',
                              message: 'Make sure to select time to proceed!');
                        } else {
                          onSelectTime(context);
                        }
                      },
                    ),
                  ],
                ));

        /// Save selected time in local database using shared preferences
        SharedPreferenceHelper().saveServiceTime(selectedTime);
      },
      child: Center(
        child: Text(
          widget.selectTime.time,
          style: isMobileSmall
              ? Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(color: Colors.black, fontSizeDelta: -2)
              : Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(color: Colors.black),
        ),
      ),
    );
  }
}
