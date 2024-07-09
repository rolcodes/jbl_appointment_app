import 'package:appointment_app/new_features/models/data/dummy_data.dart';
import 'package:appointment_app/new_features/screen/guest_tab_bar/widget/guest_service_category/widget/service_grid_item.dart';
import 'package:appointment_app/new_features/screen/guest_tab_bar/widget/guest_service_category/widget/services/guest_service.dart';
import 'package:flutter/material.dart';
import '../../../../models/category_model.dart';

class GuestServiceCategory extends StatelessWidget {
  const GuestServiceCategory({super.key});

  /// -- Method
  void _selectCategory(BuildContext context, Category category) {
    final filterServices = dummyServices
        .where((service) => service.category.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => GuestServiceScreen(
          title: category.title,
          services: filterServices,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(24),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 2.4,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        /// Alternative: availableCategories.map((service) => ServiceGridItem(service: service)).toList()
        for (final service in availableCategories)
          ServiceGridItem(
            service: service,
            onSelectedCategory: () {
              _selectCategory(context, service);
            },
          )
      ],
    );
  }
}
