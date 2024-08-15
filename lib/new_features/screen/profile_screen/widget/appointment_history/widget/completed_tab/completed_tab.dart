
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../../../services/database.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../cancelled_tab/cancelled_detail.dart';
import 'completed_item.dart';

class CompletedTab extends StatefulWidget {
  const CompletedTab({super.key});

  @override
  State<CompletedTab> createState() => _CompletedTabState();
}

class _CompletedTabState extends State<CompletedTab> {
  Stream? completedAppointmentStream;

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
    completedAppointmentStream =
    await DatabaseMethods().getSpecificCompletedAppointments();
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
        stream: completedAppointmentStream,
        builder: (context, AsyncSnapshot snapshot) {
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
                      'No Completed Appointment',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Text(
                      'Book an appointment now and avail our exclusive offers!',
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

          /// if we have data, get all cancelled user appointments
          return snapshot.hasData
              ? ListView.builder(
              itemCount: snapshot.data.docs.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: false,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.docs[index];

                return CompletedItem(
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
