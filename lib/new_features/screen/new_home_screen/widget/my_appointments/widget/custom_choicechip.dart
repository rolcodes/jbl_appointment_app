import 'package:appointment_app/new_features/models/feedback_model.dart';
import 'package:appointment_app/utils/popups/loaders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../services/database.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../new_navigation_menu.dart';

class CustomChoiceChip extends StatefulWidget {
  const CustomChoiceChip({super.key, required this.ds});

  final String ds;

  @override
  State<CustomChoiceChip> createState() => _CustomChoiceChipState();
}

class _CustomChoiceChipState extends State<CustomChoiceChip> {
  String? _selectedFeedback;

  /// List of choices
  final List<String> _feedback = [
    'I change my plans',
    'I waited too long',
    'I inputted wrong appointment details',
    'I forgot my appointment',
  ];

  /// Get the value of selected choice using void function
  void _selectFeedback(String feedback) {
    setState(() {
      _selectedFeedback = feedback;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          runSpacing: 4,
          spacing: 20,
          alignment: WrapAlignment.center,
          children: _feedback
              .map(
                (feedback) => ChoiceChip(
                  showCheckmark: true,
                  elevation: 2,
                  side: const BorderSide(color: Colors.grey),
                  label: _selectedFeedback == feedback
                      ? Text(
                          feedback,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: Colors.white),
                        )
                      : Text(feedback),
                  selected: _selectedFeedback == feedback,
                  labelStyle: Theme.of(context).textTheme.labelLarge,
                  backgroundColor: TColors.white,
                  onSelected: (selected) {
                    if (selected) {
                      _selectFeedback(feedback);
                    }
                  },
                  selectedColor: TColors.primary,
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () => Get.back(),
              style: TextButton.styleFrom(overlayColor: TColors.primary),
              child: Text(
                'Cancel',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            TextButton(
              onPressed: () async {
                print(_selectedFeedback);

                if (_selectedFeedback == null) {
                  TLoaders.errorSnackBar(
                      title: 'Error', message: 'Select feedback to proceed!');
                } else {

                  /// DELETE function: Delete Document ID of Booking in database
                  await DatabaseMethods().deleteBooking(widget.ds);
                  print('Appointment was deleted from database');
                  TLoaders.successSnackBar(title: 'Cancelled', message: 'Booking successfully cancelled.');
                  await Future.delayed(const Duration(seconds: 1));

                  Get.offAll(() => const NewNavigationMenu());
                }
              },
              style: TextButton.styleFrom(overlayColor: TColors.primary),
              child: Text(
                'Submit',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
