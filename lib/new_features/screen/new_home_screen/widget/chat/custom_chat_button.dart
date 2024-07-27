import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

class CustomChatButton extends StatelessWidget {
  const CustomChatButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: TColors.primary,
      shape: const CircleBorder(
        side: BorderSide(
          color: Colors.transparent,
        ),
      ),
      child: const Icon(Icons.message, color: Colors.white),
    );
  }
}