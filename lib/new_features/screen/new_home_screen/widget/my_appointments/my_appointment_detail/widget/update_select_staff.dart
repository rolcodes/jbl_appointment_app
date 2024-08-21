import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jbl/utils/device/device_utility.dart';
import 'package:provider/provider.dart';

import '../../../../../../../common/widgets/appbar/custom_appbar/custom_appbar.dart';
import '../../../../../../../services/database.dart';
import '../../../../../../../services/shared_pref.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/popups/loaders.dart';
import '../../../../../../models/calendar_model.dart';
import '../../../../../../models/service_product.dart';
import '../../../../../../models/staff_model.dart';
import '../../../../../../new_navigation_menu.dart';
import '../../../../../select_staff/widget/staff_item.dart';

class UpdateSelectTechnician extends StatefulWidget {
  const UpdateSelectTechnician({
    super.key,
    required this.services,
    required this.staff,
    required this.ds,
  });

  final List<ServiceProduct> services;
  final List<StaffModel> staff;
  final DocumentSnapshot<Object?> ds;

  @override
  State<UpdateSelectTechnician> createState() => _UpdateSelectTechnicianState();
}

class _UpdateSelectTechnicianState extends State<UpdateSelectTechnician> {
  String? time;

  TextEditingController pickedDate = TextEditingController();

  getDataFromSharedPref() async {
    time = await SharedPreferenceHelper().getServiceTime();
  }

  getOnTheLoad() async {
    await getDataFromSharedPref();
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  /// -- Method to display custom showDialog, passing data from Select Staff Screen
  void onSelectStaff(
      BuildContext context, ServiceProduct service, StaffModel staff) {
    /// Create function to reschedule booking

    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        child: SizedBox(
          height: 600,
          child: Container(
            width: TDeviceUtils.getScreenWidth(context),
            decoration: BoxDecoration(
                color: TColors.light, borderRadius: BorderRadius.circular(10)),
            padding:
                const EdgeInsets.only(top: 30, bottom: 20, left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Center(
                      child: Text(
                        'Reschedule Booking',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Center(
                      child: SizedBox(
                        width: 220,
                        child: Text(
                          'Are you sure you want to reschedule this appointment?',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                Container(
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          widget.ds['image'],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 12),
                        height: 100,
                        width: 180,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.ds['service'],
                              style: Theme.of(context).textTheme.bodyLarge,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              widget.ds['duration'],
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              widget.ds['price'],
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Spacer(),
                            Text(
                              'Booking ID: ${widget.ds['bookingId']}',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                /// Get data from Firebase
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red.shade100.withOpacity(0.2)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('From',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .apply(fontWeightDelta: 1)),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Date:',
                              style: Theme.of(context).textTheme.bodyMedium),
                          Text(widget.ds['date'],
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Time:',
                              style: Theme.of(context).textTheme.bodyMedium),
                          Text(widget.ds['time'],
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Technician:',
                              style: Theme.of(context).textTheme.bodyMedium),
                          Text(widget.ds['staffName'],
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                /// Get data from recent selection of user
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green.shade100.withOpacity(0.2)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('To',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .apply(fontWeightDelta: 1)),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Date:',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            pickedDate.text,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Time:',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            '$time',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Technician:',
                              style: Theme.of(context).textTheme.bodyMedium),
                          Text(staff.staffName,
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Cancel',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        /// -- UPDATE: update user appointment
                        await DatabaseMethods().updateUserAppointments(
                            widget.ds['bookingId'],
                            pickedDate.text,
                            time!,
                            staff.staffName);
                        print('Appointment was successfully updated!');

                        TLoaders.successBookingSnackBar(
                            title: 'Rescheduling successful',
                            message: 'Booking was rescheduled successfully!');

                        await Future.delayed(const Duration(seconds: 1));
                        Get.offAll(() => const NewNavigationMenu());
                      },
                      child: Text(
                        'Confirm',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .apply(color: CupertinoColors.activeBlue),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /// -- List to selected data, and update to text controller
    /// -- Listen to picked date and update to text controller
    pickedDate.text = DateFormat('MMM d') // EEEE, MMM d, yyyy
        .format(Provider.of<CalendarModel>(context, listen: false)
            .firstDate); //.add_yMd()

    return Scaffold(
      backgroundColor: TColors.secondary,
      appBar: CustomAppBar(
        backgroundColor: Colors.white,
        isEdit: false,
        showBackgroundColor: false,
        showIcon: true,
        isDrawer: false,
        isCenterTitle: true,
        isNotification: false,
        iconColor: TColors.primary,
        title: Text(
          'Select Technician',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .apply(fontSizeDelta: 2, color: TColors.primary),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView.separated(
          itemCount: widget.staff.length,
          itemBuilder: (ctx, index) {
            return StaffItem(
              /// staff details
              staff: widget.staff[index],

              /// checkout details
              service: widget.services[index],
              onSelectedService: (service) {
                onSelectStaff(context, service, widget.staff[index]);
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 15);
          },
        ),
      ),
    );
  }
}
