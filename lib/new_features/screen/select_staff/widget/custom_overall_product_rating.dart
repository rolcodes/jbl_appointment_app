import 'package:appointment_app/new_features/screen/select_staff/widget/custom_rating_bar_indicator.dart';
import 'package:appointment_app/new_features/screen/select_staff/widget/custom_rating_progress_indicator.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';


class TOverallProductRating extends StatelessWidget {
  const TOverallProductRating({
    super.key, required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Column(
                children: [
                  Text('$rating',
                      style: Theme.of(context).textTheme.displayLarge!.apply(color: TColors.accent)),
                  TRatingBarIndicator(rating: rating),
                ],
              )),
          const Expanded(
            flex: 7,
            child: Column(
              children: [
                TRatingProgressIndicator(text: '5', value: 1.0),
                TRatingProgressIndicator(text: '4', value: 0.8),
                TRatingProgressIndicator(text: '3', value: 0.6),
                TRatingProgressIndicator(text: '2', value: 0.4),
                TRatingProgressIndicator(text: '1', value: 0.2),
              ],
            ),
          )
        ],
      ),
    );
  }
}