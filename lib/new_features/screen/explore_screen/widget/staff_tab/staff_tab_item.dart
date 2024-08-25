import 'package:flutter/material.dart';
import 'package:jbl/new_features/screen/select_staff/widget/staff_details.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../models/service_product.dart';
import '../../../../models/staff_model.dart';
import '../../../select_staff/widget/custom_rating_bar_indicator.dart';

class StaffTabItem extends StatelessWidget {
  const StaffTabItem({
    super.key,
    required this.staff,
    required this.service,
  });

  final ServiceProduct service;
  final StaffModel staff;

  /// -- Method to navigate to select staff details
  void onSelectDetails(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => StaffDetails(
          staff: staff,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(20),
      color: TColors.light,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          splashColor: TColors.primary.withOpacity(0.8),

          /// Function
          onTap: () {
            /// Method
            onSelectDetails(context);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              children: [
                ClipOval(
                  child: Image.network(
                    staff.image,
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext
                    context,
                        Widget child,
                        ImageChunkEvent?
                        loadingProgress) {
                      if (loadingProgress ==
                          null) return child;
                      return SizedBox(
                        width: 90,
                        height: 90,
                        child: Center(
                          child:
                          CircularProgressIndicator(
                            color: TColors
                                .primary,
                            value: loadingProgress
                                .expectedTotalBytes !=
                                null
                                ? loadingProgress
                                .cumulativeBytesLoaded /
                                loadingProgress
                                    .expectedTotalBytes!
                                : null,
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context,
                        exception,
                        stackTrace) {
                      return Image.asset(
                        'assets/images/content/no-image-found.jpg',
                        fit: BoxFit.cover,
                        width: 90,
                        height: 90,
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(staff.staffName,
                            style: Theme.of(context).textTheme.titleMedium),
                        TRatingBarIndicator(rating: staff.rating),
                        TextButton(
                          style: TextButton.styleFrom(
                            overlayColor: TColors.primary,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            minimumSize: Size(50, 30),
                          ),
                          onPressed: () {
                            /// Method
                            onSelectDetails(context);
                          },
                          child: Text(
                            'View Details',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .apply(color: TColors.primary),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
