import 'package:appointment_app/common/widgets/appbar/custom_appbar/custom_appbar.dart';
import 'package:appointment_app/services/database.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class AdminPanelHome extends StatefulWidget {
  const AdminPanelHome({super.key});

  @override
  State<AdminPanelHome> createState() => _AdminPanelHomeState();
}

class _AdminPanelHomeState extends State<AdminPanelHome> {
  // /// Variable Declaration
  // DateTime? currentDate;
  //
  // TextEditingController pickedDate = TextEditingController();
  //
  // /// Calendar Controller
  // final calendarController = CleanCalendarController(
  //   minDate: DateTime.now(),
  //   maxDate: DateTime.now().add(
  //     const Duration(days: 365),
  //   ),
  //   weekdayStart: DateTime.sunday,
  //   rangeMode: false,
  //   initialDateSelected: DateTime.now(),
  // );

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
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              TableCalendar(
                focusedDay: _focusedDay,
                firstDay: _firstDay,
                lastDay: _lastDay,
                weekendDays: [6],
                headerStyle: HeaderStyle(
                    decoration: BoxDecoration(
                      color: TColors.primary.withOpacity(0.1),
                    ),
                    headerMargin: const EdgeInsets.only(bottom: 20),
                    headerPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    titleTextStyle: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: TColors.primary),
                    formatButtonVisible: false,
                    leftChevronVisible: false,
                    rightChevronVisible: false),
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                      color: TColors.primary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(100)),
                  todayTextStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: TColors.primary),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: StreamBuilder(
                    stream: upcomingAppointmentStream,
                    builder: (context, AsyncSnapshot snapshot) {
                      return snapshot.hasData
                          ? ListView.builder(
                              itemCount: snapshot.data.docs.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                DocumentSnapshot ds = snapshot.data.docs[index];
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Upcoming Appointment',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .apply(
                                                color: Colors.white,
                                                shadows: [
                                              Shadow(
                                                  color: Colors.black.withOpacity(0.2),
                                                  offset: Offset(0, 1),
                                                  blurRadius: 10)
                                            ]),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              ds["image"],
                                              fit: BoxFit.cover,
                                              width: 70,
                                              height: 70,
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            width: 280,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 200,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            ds['service'],
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headlineSmall!
                                                                .apply(
                                                                    color: Colors
                                                                        .white),
                                                          ),
                                                          Text(
                                                            ds['price'],
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .titleLarge!
                                                                .apply(
                                                                    color: Colors
                                                                        .white),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Text(
                                                      "Booking ID: ${ds['bookingId']}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyLarge!
                                                          .apply(
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      ds['date'],
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleLarge!
                                                          .apply(
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                    Text(
                                                      ds['time'],
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleLarge!
                                                          .apply(
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )
                          : Container();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
