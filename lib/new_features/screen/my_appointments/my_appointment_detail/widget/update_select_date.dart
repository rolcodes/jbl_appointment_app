import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jbl/new_features/screen/my_appointments/my_appointment_detail/widget/update_select_time.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

import '../../../../../common/widgets/appbar/custom_appbar/custom_appbar.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../models/calendar_model.dart';
import '../../../../models/data/time_data.dart';
import '../../../select_time/select_time.dart';

class UpdateSelectDateScreen extends StatefulWidget {
  const UpdateSelectDateScreen({super.key, required this.ds});

  final DocumentSnapshot<Object?> ds;

  @override
  State<UpdateSelectDateScreen> createState() => _UpdateSelectDateScreenState();
}

class _UpdateSelectDateScreenState extends State<UpdateSelectDateScreen> {
  /// Variable Declaration
  DateTime? selectedDate;

  TextEditingController pickedDate = TextEditingController();

  /// Calendar Controller
  final calendarController = CleanCalendarController(
    minDate: DateTime.now(),
    maxDate: DateTime.now().add(
      const Duration(days: 365),
    ),
    weekdayStart: DateTime.sunday,
    rangeMode: false,
    initialDateSelected: DateTime.now(),
  );

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.secondary,
      appBar: CustomAppBar(
        isEdit: false,
        backgroundColor: TColors.light,
        showBackgroundColor: false,
        showIcon: true,
        isDrawer: false,
        isNotification: false,
        title: Text('Select Date',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.primary)),
        iconColor: TColors.primary,
        isCenterTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20)),
        child: ScrollableCleanCalendar(
          calendarController: calendarController,
          layout: Layout.BEAUTY,
          calendarCrossAxisSpacing: 10,
          padding: const EdgeInsets.all(20),
          monthTextStyle: Theme.of(context)
              .textTheme
              .headlineMedium!
              .apply(color: TColors.primary),
          monthTextAlign: TextAlign.right,
          daySelectedBackgroundColor: TColors.primary,
          dayDisableColor: Colors.grey,
          dayRadius: 100,
        ),
      ),

      /// -- Create a button to trigger the event
      bottomNavigationBar: Consumer<CalendarModel>(
        builder: ((context, calendar, child) {
          return GestureDetector(
            onTap: () {
              /// pass selected date and notify all the level of the app using provider
              calendar.getDataRange(calendarController.rangeMinDate!);

              /// -- List to selected data, and update to text controller
              pickedDate.text = DateFormat('EEEE') // , MMM d, yyyy
                  .format(Provider.of<CalendarModel>(context, listen: false)
                      .firstDate); //.add_yMd()

              /// -- Check if date is Weekend or Weekday, then show appropriate time data
              if (pickedDate.text == 'Saturday' ||
                  pickedDate.text == 'Sunday') {
                Get.to(() => UpdateSelectTime(
                      hours: weekendHours,
                      ds: widget.ds,
                    ));
                print('weekend hours');
              } else {
                Get.to(() => UpdateSelectTime(
                      hours: weekdayHours,
                      ds: widget.ds,
                    ));
                print('weekday hours');
              }
            },
            child: Container(
              height: Platform.isAndroid ? 50 : 70,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.orange.shade800, TColors.primary])),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Continue',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .apply(color: Colors.white),
                    ),
                    SizedBox(height: Platform.isAndroid ? 0 : 10),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
