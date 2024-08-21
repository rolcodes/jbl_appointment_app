import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jbl/new_features/screen/select_time/widget/time_item.dart';

import '../../../common/widgets/appbar/custom_appbar/custom_appbar.dart';
import '../../../services/shared_pref.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/popups/loaders.dart';
import '../../models/data/dummy_data.dart';
import '../../models/time_model.dart';
import '../select_staff/select_staff.dart';

class SelectTime extends StatefulWidget {
  const SelectTime({
    super.key,
    required this.hours,
  });

  final List<TimeClass> hours;

  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  /// -- Method to navigate to select staff screen
  // void onSelectTime(BuildContext context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (ctx) => const SelectStaffScreen(
  //         services: dummyServices,
  //         staff: dummyStaff,
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    String? time;

    /// -- List to selected data, and update to text controller
    // pickedDate.text = DateFormat('EEEE') // , MMM d, yyyy
    //     .format(Provider.of<CalendarModel>(context, listen: true)
    //         .firstDate); //.add_yMd()

    return Scaffold(
      backgroundColor: TColors.secondary,
      appBar: AppBar(
        backgroundColor: TColors.light,
        title: Text('Select Time',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .apply(color: TColors.primary, fontSizeDelta: 2)),
        leading: IconButton(
          onPressed: () {
            Get.back();
            SharedPreferenceHelper().removeServiceTime();
            print('Time was deleted');
          },
          icon: Container(
            height: 50,
            width: 50,
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: TColors.primary,
              size: 20,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 10, right: 5),
                child: CupertinoScrollbar(
                  thickness: 4,
                  thicknessWhileDragging: 8,
                  radius: const Radius.circular(2),
                  thumbVisibility: true,
                  child: GridView.builder(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 10, right: 15),
                    shrinkWrap: false,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 30 / 14,
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
            ),
          ],
        ),
      ),
      // bottomNavigationBar: InkWell(
      //   onTap: () async {
      //     time = await SharedPreferenceHelper().getServiceTime();
      //
      //     if (time == null) {
      //       TLoaders.errorSnackBar(
      //           title: 'Error',
      //           message: 'Make sure to select time to proceed!');
      //     }
      //     // else {
      //     //   onSelectTime(context);
      //     // }
      //   },
      //   child: Container(
      //     height: Platform.isAndroid ? 50 : 70,
      //     decoration: BoxDecoration(
      //         gradient: LinearGradient(
      //             colors: [Colors.orange.shade800, TColors.primary])),
      //     child: Center(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Text(
      //             'Continue',
      //             style: Theme.of(context)
      //                 .textTheme
      //                 .titleSmall!
      //                 .apply(color: Colors.white),
      //           ),
      //           SizedBox(height: Platform.isAndroid ? 0 : 10),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
