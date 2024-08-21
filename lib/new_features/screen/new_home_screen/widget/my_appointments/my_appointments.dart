import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../common/widgets/appbar/custom_appbar/custom_appbar.dart';
import '../../../../../services/database.dart';
import '../../../../../services/shared_pref.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/device/device_screen_ratio.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/popups/loaders.dart';
import '../../../../new_navigation_menu.dart';
import 'my_appointment_item.dart';
import 'my_appointment_detail/my_appointments_detail.dart';

class MyAppointmentsScreen extends StatefulWidget {
  const MyAppointmentsScreen({super.key});

  @override
  State<MyAppointmentsScreen> createState() => _MyAppointmentsScreenState();
}

class _MyAppointmentsScreenState extends State<MyAppointmentsScreen> {
  Stream? bookingStream;

  final now_date = DateFormat('MMM d').format(DateTime.now());

  /// Function to navigate to Appointment Detail Screen
  Future<void> _selectAppointment(
      BuildContext context, DocumentSnapshot<Object?> ds) async {
    /// Navigate to specific appointment
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => AppointmentsDetail(
              ds: ds,
            )));

    /// Automatically delete appointment if date was exceeded
    if (ds['date'] == now_date) {
      await Future.delayed(const Duration(days: 1));

      /// DELETE function: Delete Document ID of Booking in database
      await DatabaseMethods().deleteBooking(ds.id);
      TLoaders.successSnackBar(
          title: 'Expired', message: 'Sorry. Booking was already expired.');
      await Future.delayed(const Duration(seconds: 1));

      Get.offAll(() => const NewNavigationMenu());
    }
  }

  getOnTheLoad() async {
    bookingStream = await DatabaseMethods().getSpecificUserAppointments();
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();

    super.initState();
  }

  Widget userAppointments() {
    final isMobileSmallWidth = CustomScreen.isMobileSmallWidth(context);
    final isMobileMediumHeight = CustomScreen.isMobileMediumHeight();
    final isMobileLargeHeight = CustomScreen.isMobileLargeHeight();
    final isMobileExtraLargeHeight = CustomScreen.isMobileExtraLargeHeight();

    return StreamBuilder(
        stream: bookingStream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null || snapshot.data.docs.length == 0) {
            /// If no data in snapshots display no appointments
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: isMobileExtraLargeHeight
                  ? 650
                  : isMobileLargeHeight
                      ? 550
                      : isMobileMediumHeight
                          ? 450
                          : 0,
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
                      'No Appointment Yet',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Text(
                      'Book An Appointment Now! Enjoy Our Exclusive Deals!',
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
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return MyAppointmentItem(
                      ds: ds,
                      onSelectedAppointment: () async {
                        _selectAppointment(context, snapshot.data.docs[index]);
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 24,
                    );
                  },
                )
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: TColors.light,
        showBackgroundColor: false,
        iconColor: TColors.primary,
        showIcon: true,
        isDrawer: false,
        isNotification: false,
        isEdit: false,
        title: Text(
          'My Appointments',
          style: Theme.of(context).textTheme.titleMedium!.apply(fontSizeDelta: 2,color: TColors.primary),
        ),
        isCenterTitle: true,
      ),
      backgroundColor: TColors.secondary,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: userAppointments(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
