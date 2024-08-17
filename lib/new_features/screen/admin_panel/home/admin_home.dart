import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jbl/new_features/screen/admin_panel/home/widget/admin_custom_drawer.dart';
import 'package:jbl/new_features/screen/admin_panel/home/widget/table_calendar/custom_table_calendar.dart';
import 'package:jbl/new_features/screen/admin_panel/home/widget/upcoming_appointment/admin_upcoming_appointment_detail.dart';
import 'package:jbl/new_features/screen/admin_panel/home/widget/upcoming_appointment/admin_upcoming_appointment_item.dart';
import 'package:jbl/new_features/screen/admin_panel/home/widget/upcoming_appointment/no_upcoming_appointment.dart';

import '../../../../services/database.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/device/device_screen_ratio.dart';
import '../../../../utils/device/device_utility.dart';
import '../../new_home_screen/widget/chat/custom_chat_button.dart';
import '../widget/admin_chat/admin_custom_chat_button.dart';
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

  // late bool _isLoading;

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
    // _isLoading = true;
    // Future.delayed(const Duration(milliseconds: 500), () {
    //   setState(() {
    //     _isLoading = false;
    //   });
    // });
    _focusedDay = DateTime.now();
    _firstDay = DateTime.now().subtract(const Duration(days: 100));
    _lastDay = DateTime.now().add(const Duration(days: 1000));
    getOnTheLoad();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isMobileSmall = CustomScreen.isMobileSmallWidth(context);
    final isMobileMedium = CustomScreen.isMobileMediumWidth(context);

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
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: isMobileSmall
              ? TDeviceUtils.getScreenHeight() / 1.2
              : isMobileMedium
                  ? TDeviceUtils.getScreenHeight() / 1.21
                      : TDeviceUtils.getScreenHeight() / 1.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// -- Calendar
              Container(
                margin: EdgeInsets.only(top: 4),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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

                /// -- Calendar widget
                child: CustomTableCalendar(
                    focusedDay: _focusedDay,
                    firstDay: _firstDay,
                    lastDay: _lastDay),
              ),
              const SizedBox(height: 10),

              /// -- Upcoming appointment
              StreamBuilder(
                stream: upcomingAppointmentStream,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.data == null ||
                      snapshot.data.docs.length == 0) {
                    /// If no data in snapshots display nothing
                    return const NoUpcomingAppointment();
                  }

                  return snapshot.hasData
                      ? Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            child: ListView.builder(
                              itemCount: 1,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                DocumentSnapshot ds = snapshot.data.docs[index];
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
                },
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Icon(Icons.message_outlined,
                        size: 18, color: Colors.grey.shade700),
                    SizedBox(width: 6),
                    Text(
                      'Notifications',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .apply(color: Colors.grey.shade700),
                    ),
                  ],
                ),
              ),

              /// -- Notifications
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: TColors.light,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.withOpacity(0.4))),
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.bookmark_add_outlined),
                        SizedBox(width: 6),
                        Text(
                          'A user booked an appointment!',
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        style: Theme.of(context).textTheme.labelMedium),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: const AdminCustomChatButton(),
    );
  }
}
