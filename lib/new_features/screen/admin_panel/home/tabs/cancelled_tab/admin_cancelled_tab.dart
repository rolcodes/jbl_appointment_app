import 'package:appointment_app/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../../../utils/constants/colors.dart';
import 'admin_cancelled_appointment_detail.dart';
import 'admin_cancelled_appointment_item.dart';

class AdminCancelledTab extends StatefulWidget {
  const AdminCancelledTab({super.key});

  @override
  State<AdminCancelledTab> createState() => _AdminCancelledTabState();
}

class _AdminCancelledTabState extends State<AdminCancelledTab> {
  Stream? cancelledStream;

  /// -- Function to navigate to Admin Requests Appointments Detail Screen
  Future<void> _selectedAllCancelledAppointment(
      BuildContext context, DocumentSnapshot<Object?> ds) async {
    /// -- Navigate to specific Request Appointment
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => AdminCancelledAppointmentDetail(ds: ds),
      ),
    );
  }

  getOnTheLoad() async {
    cancelledStream = await DatabaseMethods().getAdminCancelledAppointments();
    setState(() {

    });
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: cancelledStream, builder: (context, AsyncSnapshot snapshot){
      if (snapshot.data == null || snapshot.data.docs.length == 0) {
        /// If no data in snapshots display no appointments
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/on_boarding_images/No data-amico.png',
                height: 250,
                width: 250,
                fit: BoxFit.contain,
              ),
              Center(
                child: Text(
                  'No Cancelled Appointments',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  'Waiting for user to book an appointment...',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.darkGrey),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      }

      return snapshot.hasData
          ? ListView.separated(
        itemCount: snapshot.data.docs.length,
        itemBuilder: (BuildContext context, int index) {
          DocumentSnapshot ds = snapshot.data.docs[index];
          return AdminCancelledAppointmentItem(
            ds: ds,
            onSelectedAllCancelledAppointment: () async {
              _selectedAllCancelledAppointment(
                  context, snapshot.data.docs[index]);
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 8,
          );
        },
      )
          : Container();
    });
  }
}
