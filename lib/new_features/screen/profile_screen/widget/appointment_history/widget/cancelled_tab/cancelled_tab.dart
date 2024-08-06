
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../../../services/database.dart';
import '../../../../../../../utils/constants/colors.dart';
import 'cancelled_detail.dart';
import 'cancelled_item.dart';

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
        await DatabaseMethods().getSpecificCancelledAppointments();
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
                      'No Cancelled Appointment',
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

          /// if we have data, get all cancelled user appointments
          return snapshot.hasData
              ? Container(
            padding: EdgeInsets.only(top: 20),
                child: ListView.separated(
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
                    }, separatorBuilder: (BuildContext context, int index) { return const SizedBox(height: 20,); },),
              )
              : Container();
        });
  }
}
