import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:path/path.dart';

import '../../services/database.dart';
import '../constants/colors.dart';

class TLoaders {
  static successSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: false,
      colorText: TColors.accent,
      backgroundColor: TColors.secondary,
      boxShadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 4,
          offset: const Offset(0, 2),
          spreadRadius: 1,
        ),
      ],
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Icons.check, color: TColors.accent),
    );
  }

  static successBookingSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: TColors.accent,
      backgroundColor: TColors.white,
      boxShadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 5,
          offset: const Offset(0, 4),
          spreadRadius: 2,
        ),
      ],
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Icons.check, color: TColors.accent),
    );
  }

  static doneSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: TColors.accent,
      backgroundColor: const Color.fromRGBO(149, 185, 197, 1.0),
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Icons.check, color: TColors.accent),
    );
  }

  static saveSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: TColors.white,
      backgroundColor: TColors.primary,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Icons.check, color: TColors.white),
    );
  }

  static warningSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: TColors.white,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2, color: TColors.white),
    );
  }

  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: TColors.white,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2, color: TColors.white),
    );
  }

  /// -- Approved Status
  static approvedSnackBar({
    required title,
    message = '',
    duration = 3,
    required String bookingId,
    required BuildContext context,
  }) {
    Get.snackbar(
      title,
      message,
      titleText: Text(
        'Approved',
        style: Theme
            .of(context)
            .textTheme
            .bodySmall!
            .apply(
          color: Colors.black,
          fontWeightDelta: 1,
        ),
      ),
      messageText: Text(
        'Appointment was successfully approved!',
        style: Theme
            .of(context)
            .textTheme
            .labelSmall,
      ),
      isDismissible: true,
      shouldIconPulse: false,
      colorText: TColors.black,
      backgroundColor: Colors.blue.shade100,
      borderColor: CupertinoColors.activeBlue,
      borderWidth: 0.5,
      boxShadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 4,
          offset: const Offset(0, 2),
          spreadRadius: 1,
        ),
      ],
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Icons.check, color: TColors.black),
      mainButton: TextButton(
        style: TextButton.styleFrom(
          overlayColor: Colors.grey.withOpacity(0.5),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.zero,
          minimumSize: const Size(100, 40),
        ),
        onPressed: () async {
          /// -- update status back to [Waiting for approval]
          await DatabaseMethods().updateAppointmentStatus(bookingId);
        },
        child: Text(
          'Undo',
          style: Theme
              .of(context)
              .textTheme
              .bodySmall!
              .apply(color: CupertinoColors.activeBlue, fontWeightDelta: 1),
        ),
      ),
    );
  }

  /// -- Approved Status
  static completedSnackBar({
    required title,
    message = '',
    duration = 3,
    required String bookingId,
    required BuildContext context,
  }) {
    Get.snackbar(
      title,
      message,
      titleText: Text(
        'Completed',
        style: Theme
            .of(context)
            .textTheme
            .bodySmall!
            .apply(
          color: Colors.black,
          fontWeightDelta: 1,
        ),
      ),
      messageText: Text(
        'The appointment was successfully completed!',
        style: Theme
            .of(context)
            .textTheme
            .labelSmall,
      ),
      isDismissible: true,
      shouldIconPulse: false,
      colorText: TColors.black,
      backgroundColor: Colors.green.shade100,
      borderColor: Colors.green.shade700,
      borderWidth: 0.5,
      boxShadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 4,
          offset: const Offset(0, 2),
          spreadRadius: 1,
        ),
      ],
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Icons.check, color: TColors.black),
      mainButton: TextButton(
        style: TextButton.styleFrom(
          overlayColor: Colors.grey.withOpacity(0.5),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.zero,
          minimumSize: const Size(100, 40),
        ),
        onPressed: () async {
          /// -- update status back to [Approved]
          await DatabaseMethods().updateAdminApprovedStatus(bookingId);
        },
        child: Text(
          'Undo',
          style: Theme
              .of(context)
              .textTheme
              .bodySmall!
              .apply(color: Colors.green.shade700, fontWeightDelta: 1),
        ),
      ),
    );
  }

  /// -- Cancelled Status with undo then moved to request
  static cancelledRequestSnackBar({
    required title,
    message = '',
    duration = 3,
    required String bookingId,
    required BuildContext context,
  }) {
    Get.snackbar(
      title,
      message,
      titleText: Text(
        'Cancelled',
        style: Theme
            .of(context)
            .textTheme
            .bodySmall!
            .apply(
          color: Colors.black,
          fontWeightDelta: 1,
        ),
      ),
      messageText: Text(
        'Appointment was cancelled successfully!',
        style: Theme
            .of(context)
            .textTheme
            .labelSmall,
      ),
      isDismissible: true,
      shouldIconPulse: false,
      colorText: TColors.black,
      backgroundColor: TColors.secondary,
      boxShadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 4,
          offset: const Offset(0, 2),
          spreadRadius: 1,
        ),
      ],
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Icons.check, color: TColors.black),
      mainButton: TextButton(
        style: TextButton.styleFrom(
          overlayColor: Colors.grey.withOpacity(0.5),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.zero,
          minimumSize: const Size(100, 40),
        ),
        onPressed: () async {
          /// -- undo status back to [Waiting for approval]
          await DatabaseMethods().updateAppointmentStatus(bookingId);
        },
        child: Text(
          'Undo',
          style: Theme
              .of(context)
              .textTheme
              .bodySmall!
              .apply(color: TColors.darkGrey, fontWeightDelta: 1),
        ),
      ),
    );
  }

  /// -- Cancelled Status with undo then moved to approved
  static cancelledApprovedSnackBar({
    required title,
    message = '',
    duration = 3,
    required String bookingId,
    required BuildContext context,
  }) {
    Get.snackbar(
      title,
      message,
      titleText: Text(
        'Cancelled',
        style: Theme
            .of(context)
            .textTheme
            .bodySmall!
            .apply(
          color: Colors.black,
          fontWeightDelta: 1,
        ),
      ),
      messageText: Text(
        'Appointment was cancelled successfully!',
        style: Theme
            .of(context)
            .textTheme
            .labelSmall,
      ),
      isDismissible: true,
      shouldIconPulse: false,
      colorText: TColors.black,
      backgroundColor: TColors.secondary,
      boxShadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 4,
          offset: const Offset(0, 2),
          spreadRadius: 1,
        ),
      ],
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Icons.check, color: TColors.black),
      mainButton: TextButton(
        style: TextButton.styleFrom(
          overlayColor: Colors.grey.withOpacity(0.5),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.zero,
          minimumSize: const Size(100, 40),
        ),
        onPressed: () async {
          /// -- undo status back to [Approval]
          await DatabaseMethods().updateAdminApprovedStatus(bookingId);
        },
        child: Text(
          'Undo',
          style: Theme
              .of(context)
              .textTheme
              .bodySmall!
              .apply(color: TColors.darkGrey, fontWeightDelta: 1),
        ),
      ),
    );
  }

  /// -- Expired Status with undo then moved to approval
  static expiredSnackBar({
    required title,
    message = '',
    duration = 3,
    required String bookingId,
    required BuildContext context,
  }) {
    Get.snackbar(
      title,
      message,
      titleText: Text(
        'Expired',
        style: Theme
            .of(context)
            .textTheme
            .bodySmall!
            .apply(
          color: Colors.black,
          fontWeightDelta: 1,
        ),
      ),
      messageText: Text(
        'The appointment was moved to expired tab.',
        style: Theme
            .of(context)
            .textTheme
            .labelSmall,
      ),
      isDismissible: true,
      shouldIconPulse: false,
      colorText: TColors.black,
      backgroundColor: TColors.secondary,
      boxShadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 4,
          offset: const Offset(0, 2),
          spreadRadius: 1,
        ),
      ],
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Icons.check, color: TColors.black),
      mainButton: TextButton(
        style: TextButton.styleFrom(
          overlayColor: Colors.grey.withOpacity(0.5),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.zero,
          minimumSize: const Size(100, 40),
        ),
        onPressed: () async {
          /// -- undo status back to [Approval]
          await DatabaseMethods().updateAdminExpiredStatus(bookingId);
        },
        child: Text(
          'Undo',
          style: Theme
              .of(context)
              .textTheme
              .bodySmall!
              .apply(color: TColors.darkGrey, fontWeightDelta: 1),
        ),
      ),
    );
  }

  /// -- Undo Snack bar for Completed Tab [Put to Requests]
  static undoCompletedToRequestsSnackBar({
    required title,
    message = '',
    duration = 3,
    required String bookingId,
    required BuildContext context,
  }) {
    Get.snackbar(
      title,
      message,
      titleText: Text(
        'Done',
        style: Theme
            .of(context)
            .textTheme
            .bodySmall!
            .apply(
          color: Colors.black,
          fontWeightDelta: 1,
        ),
      ),
      messageText: Text(
        'Appointment was moved to requests tab',
        style: Theme
            .of(context)
            .textTheme
            .labelSmall,
      ),
      isDismissible: true,
      shouldIconPulse: false,
      colorText: TColors.black,
      backgroundColor: TColors.secondary,
      boxShadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 4,
          offset: const Offset(0, 2),
          spreadRadius: 1,
        ),
      ],
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Icons.check, color: TColors.black),
      mainButton: TextButton(
        style: TextButton.styleFrom(
          overlayColor: Colors.grey.withOpacity(0.5),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.zero,
          minimumSize: const Size(100, 40),
        ),
        onPressed: () async {
          /// -- undo status back to [Completed]
          await DatabaseMethods().updateAdminCompletedStatus(bookingId);
        },
        child: Text(
          'Undo',
          style: Theme
              .of(context)
              .textTheme
              .bodySmall!
              .apply(color: TColors.darkGrey, fontWeightDelta: 1),
        ),
      ),
    );
  }

  /// -- Undo Snack bar for Completed Tab [Put to Requests]
  static undoCancelledToRequestsSnackBar({
    required title,
    message = '',
    duration = 3,
    required String bookingId,
    required BuildContext context,
  }) {
    Get.snackbar(
      title,
      message,
      titleText: Text(
        'Done',
        style: Theme
            .of(context)
            .textTheme
            .bodySmall!
            .apply(
          color: Colors.black,
          fontWeightDelta: 1,
        ),
      ),
      messageText: Text(
        'Appointment was moved to requests tab',
        style: Theme
            .of(context)
            .textTheme
            .labelSmall,
      ),
      isDismissible: true,
      shouldIconPulse: false,
      colorText: TColors.black,
      backgroundColor: TColors.secondary,
      boxShadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 4,
          offset: const Offset(0, 2),
          spreadRadius: 1,
        ),
      ],
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Icons.check, color: TColors.black),
      mainButton: TextButton(
        style: TextButton.styleFrom(
          overlayColor: Colors.grey.withOpacity(0.5),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.zero,
          minimumSize: const Size(100, 40),
        ),
        onPressed: () async {
          /// -- undo status back to [Completed]
          await DatabaseMethods().updateAdminCancelledStatus(bookingId);
        },
        child: Text(
          'Undo',
          style: Theme
              .of(context)
              .textTheme
              .bodySmall!
              .apply(color: TColors.darkGrey, fontWeightDelta: 1),
        ),
      ),
    );
  }
}
