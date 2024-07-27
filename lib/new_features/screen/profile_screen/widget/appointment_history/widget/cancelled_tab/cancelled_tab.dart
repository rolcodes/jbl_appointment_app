import 'package:appointment_app/new_features/screen/profile_screen/widget/appointment_history/widget/cancelled_tab/widget/cancelled_detail.dart';
import 'package:appointment_app/new_features/screen/profile_screen/widget/appointment_history/widget/cancelled_tab/widget/cancelled_item.dart';
import 'package:appointment_app/services/database.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CancelledTab extends StatefulWidget {
  const CancelledTab({super.key});

  @override
  State<CancelledTab> createState() => _CancelledTabState();
}

class _CancelledTabState extends State<CancelledTab> {
  Stream? cancelledAppointmentStream;

  /// -- Function to navigate to Cancelled Detail Screen
  Future<void> _selectCancelledAppointment(
      BuildContext context, DocumentSnapshot<Object?> ds) async {
    /// Navigate to specific cancelled appointment
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => CancelledAppointmentDetail(
              ds: ds,
            )));
  }

  getOnTheLoad() async {
    cancelledAppointmentStream =
        await DatabaseMethods().getCancelledAppointments();
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
        stream: cancelledAppointmentStream,
        builder: (context, AsyncSnapshot snapshot) {
          /// if we have data, get all cancelled user appointments
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];

                    return CancelledItem(
                      ds: ds,
                      onSelectedCancelledAppointment: () async {
                        _selectCancelledAppointment(context, snapshot.data.docs[index]);
                      },
                    );
                  })
              : Container();
        });
  }
}
