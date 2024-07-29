import 'package:appointment_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class SampleAppBar extends StatelessWidget {
  const SampleAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.secondary,
      appBar: AppBar(
        title: const Text('Sample'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
