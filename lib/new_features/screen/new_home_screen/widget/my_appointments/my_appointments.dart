import 'package:appointment_app/common/widgets/appbar/custom_appbar/custom_appbar.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../services/database.dart';
import '../../../../../services/shared_pref.dart';
import '../../../../../utils/popups/loaders.dart';
import '../../../../new_navigation_menu.dart';
import 'my_appointment_item.dart';
import 'my_appointment_detail/my_appointments_detail.dart';

class MyAppointmentsScreen extends StatefulWidget {
  const MyAppointmentsScreen({super.key});

  @override
  State<MyAppointmentsScreen> createState() => _MyAppointmentsScreenState();
}

class _MyAppointmentsScreenState extends State<MyAppointmentsScreen> {
  Stream? bookingStream;
  String? email;

  final now_date = DateFormat('MMM d').format(DateTime.now());

  /// Function to navigate to Appointment Detail Screen
  Future<void> _selectAppointment(
      BuildContext context, DocumentSnapshot<Object?> ds) async {
    /// Navigate to specific appointment
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => AppointmentsDetail(
              ds: ds,
            )));

    /// Automatically delete appointment if date was exceeded
    if (ds['date'] == now_date) {
      await Future.delayed(const Duration(days: 1));

      /// DELETE function: Delete Document ID of Booking in database
      await DatabaseMethods().deleteBooking(ds.id);
      TLoaders.successSnackBar(title: 'Expired', message: 'Sorry. Booking was already expired.');
      await Future.delayed(const Duration(seconds: 1));

      Get.offAll(() => const NewNavigationMenu());
    }
  }

  /// get updated email from sharedpreference
  getDataFromSharedPref() async {
    email = await SharedPreferenceHelper().getUserEmail();
    setState(() {});
  }

  getOnTheLoad() async {
    await getDataFromSharedPref();
    bookingStream = await DatabaseMethods().getUserAppointments(email!);
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();

    super.initState();
  }

  Widget userAppointments() {
    return StreamBuilder(
        stream: bookingStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.separated(
                  itemCount: snapshot.data.docs.length,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return MyAppointmentItem(
                      ds: ds,
                      onSelectedAppointment: () async {
                        _selectAppointment(context, snapshot.data.docs[index]);
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 12,
                    );
                  },
                )
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackgroundColor: false,
        showIcon: true,
        isDrawer: false,
        isAction: false,
        title: Text(
          'My Appointments',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        isCenterTitle: true,
      ),
      backgroundColor: TColors.secondary,
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: userAppointments()),
    );
  }
}
