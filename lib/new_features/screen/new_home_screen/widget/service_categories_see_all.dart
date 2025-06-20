import 'package:flutter/material.dart';
import 'package:jbl/new_features/screen/new_home_screen/widget/service_category_cards/widget/services.dart';

import '../../../../common/widgets/appbar/custom_appbar/custom_appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../models/category_model.dart';
import '../../../models/data/dummy_data.dart';
import '../../guest_tab_bar/widget/guest_service_category/widget/service_grid_item.dart';

class ServiceCategoriesSeeAll extends StatelessWidget {
  const ServiceCategoriesSeeAll({super.key});

  /// -- Method to get to the Services Screen whenever a user tap a services
  void _selectCategory(BuildContext context, Category category) {
    final filterServices = dummyServices
        .where((service) => service.category.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => ServiceScreen(
          title: category.title,
          services: filterServices,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.secondary,
      appBar: CustomAppBar(
        backgroundColor: TColors.light,
        isEdit: false,
        isCenterTitle: true,
        iconColor: TColors.primary,
        showBackgroundColor: false,
        showIcon: true,
        isDrawer: false,
        isNotification: false,
        title: Text(
          'Service Categories',
          style: Theme.of(context).textTheme.titleMedium!.apply(fontSizeDelta: 2, color: TColors.primary),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 2.4,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: availableCategories.length,
        itemBuilder: (context, index) {
          return ServiceGridItem(
            service: availableCategories[index],
            onSelectedCategory: () {
              _selectCategory(context, availableCategories[index]);
            },
          );
        },
      ),
    );
    ;
  }
}
