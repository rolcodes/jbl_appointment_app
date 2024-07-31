import 'package:appointment_app/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../utils/constants/colors.dart';
import 'admin_approved_appointment_detail.dart';
import 'admin_approved_appointment_item.dart';

class AdminApprovedTab extends StatefulWidget {
  const AdminApprovedTab({super.key});

  @override
  State<AdminApprovedTab> createState() => _AdminApprovedTabState();
}

class _AdminApprovedTabState extends State<AdminApprovedTab> {
  Stream? approvedStream;

  /// -- Function to navigate to Admin Requests Appointments Detail Screen
  Future<void> _selectedAllApprovedAppointment(
      BuildContext context, DocumentSnapshot<Object?> ds) async {
    /// -- Navigate to specific Request Appointment
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => AdminApprovedAppointmentDetail(ds: ds),
      ),
    );
  }

  getOnTheLoad() async {
    approvedStream = await DatabaseMethods().getAdminApprovedAppointments();
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
    return StreamBuilder(stream: approvedStream, builder: (context, AsyncSnapshot snapshot){
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
                  'No Approved Appointment Yet',
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
          return AdminApprovedAppointmentItem(
            ds: ds,
            onSelectedAllApprovedtAppointment: () async {
              _selectedAllApprovedAppointment(
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
