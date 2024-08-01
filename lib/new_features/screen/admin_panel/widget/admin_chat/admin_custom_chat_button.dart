import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

class AdminCustomChatButton extends StatelessWidget {
  const AdminCustomChatButton({
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