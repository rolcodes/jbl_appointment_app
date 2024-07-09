import 'package:appointment_app/common/widgets/products/product_cards/widget/rating_indicator.dart';
import 'package:appointment_app/new_features/models/service_product.dart';
import 'package:appointment_app/new_features/screen/select_staff/widget/staff_details.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../models/staff_model.dart';

class StaffItem extends StatelessWidget {
  const StaffItem({
    super.key,
    required this.staff,
    required this.service,
    required this.onSelectedService,
  });

  final ServiceProduct service;
  final StaffModel staff;

  final void Function(ServiceProduct service) onSelectedService;

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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: TColors.primary.withOpacity(0.1),

        /// Function
        onTap: () {
          onSelectedService(service);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              ClipOval(
                child: Image.network(
                  staff.image,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
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
    );
  }
}
