import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:jbl/utils/device/device_utility.dart';

import '../../../../services/database.dart';

class CustomSizedboxHeight extends StatefulWidget {
  const CustomSizedboxHeight({
    super.key,
    required this.width,
    required this.child,
  });

  final double width;
  final Widget child;

  @override
  State<CustomSizedboxHeight> createState() => _CustomSizedboxHeightState();
}

class _CustomSizedboxHeightState extends State<CustomSizedboxHeight> {
  Stream? BookingStream;

  getOnTheLoad() async {
    BookingStream = await DatabaseMethods().getSpecificUserAppointments();

    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DatabaseMethods().ifStatusExists(),
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? SizedBox(
                  height: TDeviceUtils.getScreenHeight() * 1.2,
                  width: widget.width,
                  child: widget.child,
                )
              : SizedBox(
                  height: TDeviceUtils.getScreenHeight(),
                  width: widget.width,
                  child: widget.child,
                );
        });
  }
}
