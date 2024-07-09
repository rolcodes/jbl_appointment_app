import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.textController,
    required this.hint,
    required this.obscureText,
    this.validator,
    this.inputFormatters,
    required this.textCapitalization,
  });

  final TextEditingController textController;
  final String hint;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextCapitalization textCapitalization;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 70,
      child: TextFormField(
        obscureText: obscureText,
        controller: textController,
        validator: validator,
        textCapitalization: textCapitalization!,
        decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: TColors.light.withOpacity(0.5),
            focusColor: TColors.light.withOpacity(0.5),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide.none),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide.none),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide.none),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide.none),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.red)),
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.bodySmall),
      ),
    );
  }
}

/// -- Show Dialog Box
// showDialog(
//   context: context,
//   builder: (ctx) =>
//       CupertinoAlertDialog(
//         content: Text(
//             'Please fill out the following fields to proceed.',
//             style: Theme.of(context)
//                 .textTheme
//                 .labelLarge!
//                 .apply(
//                 color: Colors.black)),
//         actions: [
//           TextButton(
//             child: Text("OK",
//                 style: Theme.of(context)
//                     .textTheme
//                     .bodyMedium),
//             onPressed: () {
//               Get.back();
//             },
//           ),
//         ],
//       ),
// );
