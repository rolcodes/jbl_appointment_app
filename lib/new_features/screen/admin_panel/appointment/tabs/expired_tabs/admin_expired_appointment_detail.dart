import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminExpiredAppointmentDetail extends StatelessWidget {
  const AdminExpiredAppointmentDetail({super.key, required this.ds});

  final DocumentSnapshot<Object?> ds;

  @override
  Widget build(BuildContext context) {
    return const Placeholder(color: Colors.orange,);
  }
}
