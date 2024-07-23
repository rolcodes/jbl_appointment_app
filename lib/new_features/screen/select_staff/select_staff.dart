import 'package:appointment_app/new_features/models/data/staff_data.dart';
import 'package:appointment_app/new_features/screen/select_staff/widget/staff_item.dart';
import 'package:appointment_app/services/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/appbar/custom_appbar/custom_appbar.dart';
import '../../../utils/constants/colors.dart';
import '../../models/branch_model.dart';
import '../../models/calendar_model.dart';
import '../../models/service_product.dart';
import '../../models/staff_model.dart';
import '../checkout_screen/checkout_screen.dart';

class SelectStaffScreen extends StatelessWidget {
  const SelectStaffScreen({
    super.key,
    required this.services,
    required this.staff,
  });

  final List<ServiceProduct> services;
  final List<StaffModel> staff;

  /// -- Method to navigate to Checkout Screen, passing data from Select Staff Screen
  void onSelectStaff(
      BuildContext context, ServiceProduct service, StaffModel staff) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => CheckoutScreen(
          service: service,
          staff: staff,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.secondary,
      appBar: CustomAppBar(        isEdit: false,

        showBackgroundColor: false,
        showIcon: true,
        isDrawer: false,
        isCenterTitle: true,
        isNotification: false,
        iconColor: TColors.primary,
        title: Text(
          'Select Staff',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: ListView.separated(
        itemCount: staff.length,
        itemBuilder: (ctx, index) {
          return StaffItem(
            /// staff details
            staff: staff[index],

            /// checkout details
            service: services[index],
            onSelectedService: (service) {
              onSelectStaff(
                context,
                service,
                staff[index],
              );
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 5);
        },
      ),
    );
  }
}
