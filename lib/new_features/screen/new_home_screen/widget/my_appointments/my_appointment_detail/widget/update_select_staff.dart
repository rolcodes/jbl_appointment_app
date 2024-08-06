import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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

  /// -- Method to navigate to Checkout Screen, passing data from Select Staff Screen
  void onSelectStaff(
      BuildContext context, ServiceProduct service, StaffModel staff) {
    /// Create function to reschedule booking

    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        child: SizedBox(
          height: 400,
          child: Container(
            decoration: BoxDecoration(
                color: TColors.light, borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Center(
                      child: Text(
                        'Reschedule Booking',
                        style: Theme.of(context).textTheme.titleLarge,
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

                /// Get data from Firebase
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('From',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(fontWeightDelta: 1)),
                    const SizedBox(height: 6),
                    Text(
                        'Date: ${widget.ds['date']}, 2024, ${widget.ds['time']}',
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text('Technician: ${widget.ds['staffName']}',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),

                /// Get data from recent selection of user
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('To',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(fontWeightDelta: 1)),
                    const SizedBox(height: 6),
                    Text(
                      'Date: ${pickedDate.text}, $time',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text('Technician: ${staff.staffName}',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Cancel',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        /// -- UPDATE: update user appointment
                        await DatabaseMethods().updateUserAppointments(widget.ds['bookingId'],
                             pickedDate.text, time!, staff.staffName);
                        print('Appointment was successfully updated!');

                        TLoaders.successBookingSnackBar(title: 'Rescheduling successful', message: 'Booking was rescheduled successfully!');

                        await Future.delayed(const Duration(seconds: 2));
                        Get.offAll(() => const NewNavigationMenu());

                      },
                      child: Text(
                        'Yes',
                        style: Theme.of(context).textTheme.bodyLarge,
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
    pickedDate.text = DateFormat('MMM d, yyyy') // EEEE, MMM d, yyyy
        .format(Provider.of<CalendarModel>(context, listen: false)
            .firstDate); //.add_yMd()

    return Scaffold(
      backgroundColor: TColors.secondary,
      appBar: CustomAppBar(        isEdit: false,

        showBackgroundColor: false,
        showIcon: true,
        isDrawer: false,
        isCenterTitle: true,
        isNotification: false,
        iconColor: TColors.primary,
        title: Text(
          'Select Technician',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: ListView.separated(
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
          return const SizedBox(height: 5);
        },
      ),
    );
  }
}
