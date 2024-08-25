import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jbl/new_features/screen/admin_panel/search/widget/admin_appointment_detail.dart';
import 'package:jbl/new_features/screen/admin_panel/search/widget/admin_appointment_item.dart';
import 'package:jbl/new_features/screen/explore_screen/widget/branch_tab/branch_item.dart';
import 'package:jbl/new_features/screen/guest_tab_bar/widget/guest_branch/widget/guest_branch_details.dart';
import 'package:jbl/utils/device/device_screen_ratio.dart';
import 'package:jbl/utils/device/device_utility.dart';

import '../../../../../common/widgets/textfield/custom_search_button.dart';
import '../../../../common/widgets/textfield/admin_custom_search_button.dart';
import '../../../../services/database.dart';
import '../../../../utils/constants/colors.dart';
import '../widget/appbar/admin_custom_app_bar.dart';

class AdminSearchScreen extends StatefulWidget {
  const AdminSearchScreen({super.key});

  @override
  State<AdminSearchScreen> createState() => _AdminSearchScreenState();
}

class _AdminSearchScreenState extends State<AdminSearchScreen> {
  Stream? requestStream;

  /// -- Function to navigate to Admin Requests Appointments Detail Screen
  Future<void> _selectedAllRequestAppointment(
      BuildContext context, DocumentSnapshot<Object?> ds) async {
    /// -- Navigate to specific Request Appointment
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => AdminAppointmentDetail(ds: ds),
      ),
    );
  }

  getOnTheLoad() async {
    requestStream = await DatabaseMethods().getAllAppointments();
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isMobileSmallHeight = CustomScreen.isMobileSmallHeight();
    final isMobileMediumHeight = CustomScreen.isMobileMediumHeight();
    final isMobileExtraLarge = CustomScreen.isMobileExtraLargeHeight();
    final isMobileLargeHeight = CustomScreen.isMobileLargeHeight();

    return Scaffold(
      backgroundColor: TColors.secondary.withOpacity(0.5),
      appBar: AdminCustomAppBar(
        isCenterTitle: true,
        showBackgroundColor: false,
        showIcon: false,
        isDrawer: true,
        isNotification: true,
        isEdit: false,
        backgroundColor: TColors.white,
        title: Image.asset(
          'assets/logos/jbl-logo.jpg',
          fit: BoxFit.contain,
          width: 145,
        ),
      ),
      body: SizedBox(
        width: TDeviceUtils.getScreenWidth(context),
        height: isMobileSmallHeight
            ? 650
            : isMobileMediumHeight
                ? 700
                : isMobileLargeHeight
                    ? 750
                    : isMobileExtraLarge
                        ? 800
                        : null,
        child: Column(
          children: [
            /// -- Search Button
            Container(
                clipBehavior: Clip.none,
                padding: const EdgeInsets.only(bottom: 25),
                decoration: BoxDecoration(
                  color: TColors.white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  boxShadow: Platform.isAndroid
                      ? [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 2,
                            spreadRadius: 0.5,
                            offset: const Offset(0, 1),
                          )
                        ]
                      : [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 10,
                            spreadRadius: 0.5,
                            offset: const Offset(0, 2),
                          )
                        ],
                ),
                width: double.infinity,
                child: const AdminCustomSearchButton()),
            Expanded(
              child: StreamBuilder(
                stream: requestStream,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: TColors.primary,
                    ));
                  } else if (snapshot.data == null ||
                      snapshot.data.docs.length == 0) {
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
                      ? Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: ListView.separated(
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (BuildContext context, int index) {
                              DocumentSnapshot ds = snapshot.data.docs[index];
                              return AdminAppointmentItem(
                                ds: ds,
                                onSelectedAllRequestAppointment: () async {
                                  _selectedAllRequestAppointment(
                                      context, snapshot.data.docs[index]);
                                },
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 10,
                              );
                            },
                          ),
                        )
                      : Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
