import 'package:appointment_app/new_features/models/feedback_model.dart';
import 'package:appointment_app/new_features/models/user_booking_model.dart';
import 'package:appointment_app/utils/popups/loaders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../../services/database.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../new_navigation_menu.dart';

class CustomChoiceChip extends StatefulWidget {
  const CustomChoiceChip({super.key, required this.ds, required this.dsID});

  final String dsID;
  final DocumentSnapshot<Object?> ds;

  @override
  State<CustomChoiceChip> createState() => _CustomChoiceChipState();
}

class _CustomChoiceChipState extends State<CustomChoiceChip> {
  String? _selectedFeedback;

  // String timestamp = DateFormat('M - d - yyyy').format(DateTime.now());

  final String _currentDate = DateFormat("MM-dd-yyyy").format(DateTime.now());


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
                  /// Get data from firebase thru specific user by passing data each screens
                  final userCancelledBooking = UserBookingModel(
                      name: widget.ds['name'],
                      accountId: widget.ds['accountId'],
                      email: widget.ds['email'],
                      telephone: widget.ds['telephone'],
                      service: widget.ds['service'],
                      image: widget.ds['image'],
                      duration: widget.ds['duration'],
                      price: widget.ds['price'],
                      date: widget.ds['date'],
                      time: widget.ds['time'],
                      staffImage: widget.ds['staffImage'],
                      staffName: widget.ds['staffName'],
                      staffRating: widget.ds['staffRating'],
                      branchImage: widget.ds['branchImage'],
                      branchTitle: widget.ds['branchTitle'],
                      branchLocation: widget.ds['branchLocation'],
                      branchContact: widget.ds['branchContact'],
                      bookingId: widget.ds['bookingId'],
                      timestamp: _currentDate);
                  final json = userCancelledBooking.toJson();

                  /// -- Add Cancelled Appointments in a new collection "cancelled appointments history"
                  await DatabaseMethods()
                      .addCancelledAppointment(json, widget.ds['bookingId']);

                  /// -- Add Cancel Reason in document field using update function
                  await DatabaseMethods().updateUserCancelledAppointments(
                      widget.ds['bookingId'], _selectedFeedback!);

                  /// DELETE function: Delete Document ID of Booking in database
                  await DatabaseMethods().deleteBooking(widget.dsID);
                  print('Appointment was deleted from database');
                  TLoaders.successSnackBar(
                      title: 'Cancelled',
                      message: 'Booking successfully cancelled.');
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
