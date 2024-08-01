import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminCompletedAppointmentDetail extends StatelessWidget {
  const AdminCompletedAppointmentDetail({super.key, required this.ds});

  final DocumentSnapshot<Object?> ds;

  @override
  Widget build(BuildContext context) {
    return const Placeholder(color: Colors.orange,);
  }
}
