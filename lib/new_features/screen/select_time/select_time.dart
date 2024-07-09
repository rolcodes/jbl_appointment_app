import 'package:appointment_app/common/widgets/appbar/custom_appbar/custom_appbar.dart';
import 'package:appointment_app/new_features/models/data/dummy_data.dart';
import 'package:appointment_app/new_features/screen/select_staff/select_staff.dart';

import 'package:appointment_app/new_features/screen/select_time/widget/time_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/colors.dart';
import '../../models/calendar_model.dart';
import '../../models/time_model.dart';

class SelectTime extends StatelessWidget {
  SelectTime({
    super.key,
    required this.hours,
  });

  final List<TimeClass> hours;
  TextEditingController pickedDate = TextEditingController();

  /// -- Method to navigate to select staff screen
  void onSelectTime(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const SelectStaffScreen(
          services: dummyServices,
          staff: dummyStaff,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /// -- List to selected data, and update to text controller
    pickedDate.text = DateFormat('EEEE') // , MMM d, yyyy
        .format(Provider.of<CalendarModel>(context, listen: true)
            .firstDate); //.add_yMd()

    return Scaffold(
      backgroundColor: TColors.secondary,
      appBar: CustomAppBar(
        showBackgroundColor: false,
        showIcon: true,
        isDrawer: false,
        isAction: false,
        title: Text('Select Date',
            style: Theme.of(context).textTheme.headlineSmall),
        iconColor: TColors.primary,
        isCenterTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                shrinkWrap: false,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 30 / 9,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                ),
                itemCount: hours.length,
                itemBuilder: (ctx, index) => TimeItem(
                  selectTime: hours[index],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          onSelectTime(context);
        },
        child: Container(
          height: 70,
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
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
