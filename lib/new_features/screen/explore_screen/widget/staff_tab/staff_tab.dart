import 'package:flutter/material.dart';
import 'package:jbl/new_features/screen/explore_screen/widget/staff_tab/staff_tab_item.dart';
import 'package:jbl/new_features/screen/select_staff/widget/staff_item.dart';

import '../../../../../common/widgets/textfield/custom_search_button.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../models/service_product.dart';
import '../../../../models/staff_model.dart';

class StaffTab extends StatelessWidget {
  const StaffTab({
    super.key,
    required this.services,
    required this.staff,
  });

  final List<ServiceProduct> services;
  final List<StaffModel> staff;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomSearchButton(),
        Expanded(
          child: Container(margin: EdgeInsets.all(20),
            child: ListView.separated(
              itemCount: staff.length,
              itemBuilder: (ctx, index) {
                return StaffTabItem(
                  /// staff details
                  staff: staff[index],

                  /// checkout details
                  service: services[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 15);
              },
            ),
          ),
        ),
      ],
    );
  }
}
