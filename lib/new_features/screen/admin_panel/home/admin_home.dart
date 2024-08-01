import 'package:appointment_app/common/widgets/appbar/custom_appbar/custom_appbar.dart';
import 'package:appointment_app/new_features/screen/admin_panel/home/widget/table_calendar/custom_table_calendar.dart';
import 'package:appointment_app/new_features/screen/admin_panel/home/widget/upcoming_appointment/admin_upcoming_appointment_detail.dart';
import 'package:appointment_app/new_features/screen/admin_panel/home/widget/upcoming_appointment/admin_upcoming_appointment_item.dart';
import 'package:appointment_app/services/database.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
      appBar: CustomAppBar(
        isCenterTitle: true,
        showBackgroundColor: false,
        showIcon: false,
        isDrawer: false,
        isNotification: true,
        isEdit: false,
        title: Text(
          'Jevelme Beauty Lounge',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.6,
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomTableCalendar(
                  focusedDay: _focusedDay,
                  firstDay: _firstDay,
                  lastDay: _lastDay),
              const SizedBox(height: 10),
              StreamBuilder(
                  stream: upcomingAppointmentStream,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null ||
                        snapshot.data.docs.length == 0) {
                      /// If no data in snapshots display nothing
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.amber,
                                Colors.amber,
                                TColors.primary,
                                TColors.primary,
                              ],
                              stops: [
                                0,
                                0.2,
                                0.8,
                                1
                              ]),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Upcoming Appointment',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .apply(color: Colors.white, shadows: [
                                Shadow(
                                    color: Colors.black.withOpacity(0.2),
                                    offset: const Offset(0, 1),
                                    blurRadius: 10)
                              ]),
                            ),
                            const SizedBox(height: 10),
                            Center(
                              child: SizedBox(
                                width: 300,
                                child: Column(
                                  children: [
                                    Text(
                                      'No upcoming appointment yet',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .apply(
                                              color: Colors.white,
                                              fontWeightDelta: 2),
                                    ),
                                    Text(
                                      'All approved appointments will be displayed here',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .apply(
                                              color: Colors.white,
                                              fontWeightDelta: -1),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }

                    return snapshot.hasData
                        ? Expanded(
                            child: ListView.builder(
                              itemCount: 1,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                DocumentSnapshot ds = snapshot.data.docs[index];
                                return AdminUpcomingAppointmentItem(
                                  ds: ds,
                                  onSelectedAUpcomingAppointment: () {
                                    _selectedUpcomingAppointment(context, snapshot.data.docs[index]);
                                  },
                                );
                              },
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
