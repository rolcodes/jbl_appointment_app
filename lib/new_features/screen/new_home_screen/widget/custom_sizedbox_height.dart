import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:jbl/utils/device/device_utility.dart';
import 'package:path/path.dart';

import '../../../../services/database.dart';

class CustomSizedboxHeight extends StatefulWidget {
  CustomSizedboxHeight({
    super.key,
    required this.width,
    required this.child,
    this.height,
  });

  late double? height = MediaQuery.of(context as BuildContext).size.height;
  final double width;
  final Widget child;

  @override
  State<CustomSizedboxHeight> createState() => _CustomSizedboxHeightState();
}

class _CustomSizedboxHeightState extends State<CustomSizedboxHeight> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DatabaseMethods().ifStatusNotExists(),
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? SizedBox(
                  width: widget.width,
                  height: TDeviceUtils.getScreenHeight() / 1.07,
                  child: widget.child,
                )
              : Container();
        });
  }
}
