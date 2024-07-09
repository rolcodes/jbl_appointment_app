import 'package:appointment_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.textController,
    required this.textColor,
    this.borderColor = TColors.grey, required this.icon,
  });

  final String hint;
  final TextEditingController? textController;
  final Color textColor;
  final Color borderColor;
  final Icon icon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
          prefixIcon: widget.icon,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.borderColor,
              )),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor,
            ),
          ),
          hintText: widget.hint,
          hintStyle: TextStyle(
            color: widget.textColor,
          )),
    );
  }
}
