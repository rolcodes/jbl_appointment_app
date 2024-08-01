import 'package:appointment_app/new_features/screen/admin_panel/home/widget/admin_custom_drawer.dart';
import 'package:appointment_app/new_features/screen/admin_panel/home/widget/table_calendar/custom_table_calendar.dart';
import 'package:appointment_app/new_features/screen/admin_panel/home/widget/upcoming_appointment/admin_upcoming_appointment_detail.dart';
import 'package:appointment_app/new_features/screen/admin_panel/home/widget/upcoming_appointment/admin_upcoming_appointment_item.dart';
import 'package:appointment_app/new_features/screen/admin_panel/home/widget/upcoming_appointment/no_upcoming_appointment.dart';
import 'package:appointment_app/services/database.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widget/appbar/admin_custom_app_bar.dart';

class AdminPanelHome extends StatefulWidget {
  const AdminPanelHome({super.key});

  @override
  State<AdminPanelHome> createState() => _AdminPanelHomeState();
}

class _AdminPanelHomeState extends State<AdminPanelHome> {
  /// -- Function to navigate to Admin Requests Appointments Detail Screen
  Future<void> _selectedUpcomingAppointment(
      BuildContext context, DocumentSnapshot<Object?> ds) async {
    /// -- Navigate to specific Request Appointment
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => AdminUpcomingAppointmentDetail(ds: ds),
      ),
    );
  }

  Stream? upcomingAppointmentStream;

  late DateTime _focusedDay;
  late DateTime _firstDay;
  late DateTime _lastDay;

  getOnTheLoad() async {
    upcomingAppointmentStream =
        await DatabaseMethods().getAdminApprovedAppointments();
    setState(() {});
  }

  @override
  void initState() {
    _focusedDay = DateTime.now();
    _firstDay = DateTime.now().subtract(const Duration(days: 100));
    _lastDay = DateTime.now().add(const Duration(days: 1000));
    getOnTheLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.secondary,
      appBar: AdminCustomAppBar(
        isCenterTitle: true,
        showBackgroundColor: false,
        showIcon: true,
        isDrawer: true,
        isNotification: true,
        isEdit: false,
        backgroundColor: TColors.light,
        title: Text(
          'Jevelme Beauty Lounge',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      drawer: const AdminCustomDrawer(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 4),
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                decoration: BoxDecoration(
                    color: TColors.light,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        offset: const Offset(0, 2),
                        blurRadius: 20,
                        spreadRadius: 1,
                      )
                    ]),

                /// -- Calendar
                child: CustomTableCalendar(
                    focusedDay: _focusedDay,
                    firstDay: _firstDay,
                    lastDay: _lastDay),
              ),
              const SizedBox(height: 10),
              StreamBuilder(
                  stream: upcomingAppointmentStream,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null ||
                        snapshot.data.docs.length == 0) {
                      /// If no data in snapshots display nothing
                      return const NoUpcomingAppointment();
                    }

                    return snapshot.hasData
                        ? Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              child: ListView.builder(
                                itemCount: 1,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  DocumentSnapshot ds =
                                      snapshot.data.docs[index];
                                  return AdminUpcomingAppointmentItem(
                                    ds: ds,
                                    onSelectedAUpcomingAppointment: () {
                                      _selectedUpcomingAppointment(
                                          context, snapshot.data.docs[index]);
                                    },
                                  );
                                },
                              ),
                            ),
                          )
                        : Container();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

