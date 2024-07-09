import 'package:appointment_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, required this.buttonText});

  final Function()? onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: TColors.primary,
            side: const BorderSide(color: Color.fromRGBO(219, 157, 0, 75))),
        onPressed: onTap,
        child: Text(buttonText),
      ),
    );
  }
}
