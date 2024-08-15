
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jbl/new_features/screen/new_home_screen/widget/my_appointments/my_appointment_detail/widget/update_select_staff.dart';

import '../../../../../../../common/widgets/appbar/custom_appbar/custom_appbar.dart';
import '../../../../../../../services/shared_pref.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/popups/loaders.dart';
import '../../../../../../models/data/dummy_data.dart';
import '../../../../../../models/time_model.dart';
import '../../../../../select_time/widget/time_item.dart';

class UpdateSelectTime extends StatefulWidget {
  const UpdateSelectTime({
    super.key,
    required this.hours,
    required this.ds,
  });

  final List<TimeClass> hours;
  final DocumentSnapshot<Object?> ds;

  @override
  State<UpdateSelectTime> createState() => _UpdateSelectTimeState();
}

class _UpdateSelectTimeState extends State<UpdateSelectTime> {
  /// -- Method to navigate to select staff screen
  void onSelectTime(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => UpdateSelectTechnician(
          services: dummyServices,
          staff: dummyStaff,
          ds: widget.ds,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String? time;

    /// -- List to selected data, and update to text controller
    // pickedDate.text = DateFormat('EEEE') // , MMM d, yyyy
    //     .format(Provider.of<CalendarModel>(context, listen: true)
    //         .firstDate); //.add_yMd()

    return Scaffold(
      backgroundColor: TColors.secondary,
      appBar: CustomAppBar(
        isDeleteTime: true,
        isEdit: false,
        showBackgroundColor: false,
        showIcon: true,
        isDrawer: false,
        isNotification: false,
        title: Text('Select Time',
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
                itemCount: widget.hours.length,
                itemBuilder: (ctx, index) => TimeItem(
                  selectTime: widget.hours[index],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: InkWell(
        onTap: () async {
          time = await SharedPreferenceHelper().getServiceTime();

          if (time == null) {
            TLoaders.errorSnackBar(title: 'Error', message: 'Make sure to select time to proceed!');
          } else {
            onSelectTime(context);
          }        },
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
