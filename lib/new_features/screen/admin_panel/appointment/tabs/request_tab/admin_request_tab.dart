import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../../services/database.dart';
import '../../../../../../utils/constants/colors.dart';
import 'admin_request_appointment_detail.dart';
import 'admin_request_appointment_item.dart';

class AdminRequestTab extends StatefulWidget {
  const AdminRequestTab({super.key});

  @override
  State<AdminRequestTab> createState() => _AdminRequestTabState();
}

class _AdminRequestTabState extends State<AdminRequestTab> {
  Stream? requestStream;

  /// -- Function to navigate to Admin Requests Appointments Detail Screen
  Future<void> _selectedAllRequestAppointment(
      BuildContext context, DocumentSnapshot<Object?> ds) async {
    /// -- Navigate to specific Request Appointment
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => AdminRequestAppointmentDetail(ds: ds),
      ),
    );
  }

  getOnTheLoad() async {
    requestStream = await DatabaseMethods().getAdminRequestAppointments();
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: requestStream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.data == null || snapshot.data.docs.length == 0) {
            /// If no data in snapshots display no appointments
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'No Requests Yet',
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
                    return AdminRequestAppointmentItem(
                      ds: ds,
                      onSelectedAllRequestAppointment: () async {
                        _selectedAllRequestAppointment(
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
