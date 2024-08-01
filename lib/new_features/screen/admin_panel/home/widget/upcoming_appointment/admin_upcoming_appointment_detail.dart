import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminUpcomingAppointmentDetail extends StatelessWidget {
  const AdminUpcomingAppointmentDetail({super.key, required this.ds});

  final DocumentSnapshot<Object?> ds;

  @override
  Widget build(BuildContext context) {
    return const Placeholder(color: Colors.teal,);
  }
}
