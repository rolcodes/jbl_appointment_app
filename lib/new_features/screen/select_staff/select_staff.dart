
import 'package:flutter/material.dart';
import 'package:jbl/new_features/screen/select_staff/widget/staff_item.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../common/widgets/appbar/custom_appbar/custom_appbar.dart';
import '../../../services/shared_pref.dart';
import '../../../utils/constants/colors.dart';

import '../../models/service_product.dart';
import '../../models/staff_model.dart';
import '../../models/time_model.dart';
import '../checkout_screen/checkout_screen.dart';

class SelectStaffScreen extends StatefulWidget {
  const SelectStaffScreen({
    super.key,
    required this.services,
    required this.staff, required this.selectedTime,
  });

  final String selectedTime;
  final List<ServiceProduct> services;
  final List<StaffModel> staff;

  @override
  State<SelectStaffScreen> createState() => _SelectStaffScreenState();
}

class _SelectStaffScreenState extends State<SelectStaffScreen> {
  String? time;
  /// -- Method to navigate to Checkout Screen, passing data from Select Staff Screen
  void onSelectStaff(
      BuildContext context, ServiceProduct service, StaffModel staff) {
    /// To avoid null value, get the selected time again by saving it again here
    /// select staff then transfer to checkout screen
    SharedPreferenceHelper().saveServiceTime(widget.selectedTime);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => CheckoutScreen(
          service: service,
          staff: staff,
        ),
      ),
    );
  }

  /// Get data in local database
  getDataFromSharedPref() async {

    time = await SharedPreferenceHelper().getServiceTime();
  }

  getOnTheLoad() async {
    await getDataFromSharedPref();
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.secondary,
      appBar: AppBar(
        backgroundColor: TColors.light,
        title: Text('Select Staff',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .apply(color: TColors.primary, fontSizeDelta: 2)),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const SizedBox(
            height: 50,
            width: 50,
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: TColors.primary,
              size: 20,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView.separated(
          itemCount: widget.staff.length,
          itemBuilder: (ctx, index) {
            return StaffItem(
              /// staff details
              staff: widget.staff[index],

              /// checkout details
              service: widget.services[index],
              onSelectedService: (service) {
                onSelectStaff(
                  context,
                  service,
                  widget.staff[index],
                );
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 15);
          },
        ),
      ),
    );
  }
}
