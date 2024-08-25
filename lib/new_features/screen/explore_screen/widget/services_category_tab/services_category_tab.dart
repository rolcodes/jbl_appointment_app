import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/textfield/custom_search_button.dart';
import '../../../../../utils/device/device_screen_ratio.dart';
import '../../../../models/category_model.dart';
import '../../../../models/data/dummy_data.dart';
import '../../../guest_tab_bar/widget/guest_service_category/widget/service_grid_item.dart';
import '../../../new_home_screen/widget/service_category_cards/widget/services.dart';

class ServicesCategoryTab extends StatelessWidget {
  const ServicesCategoryTab({super.key});

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
    final isMobileSmallWidth = CustomScreen.isMobileSmallWidth(context);
    final isMobileMediumHeight = CustomScreen.isMobileMediumHeight();
    final isMobileLargeHeight = CustomScreen.isMobileLargeHeight();
    final isMobileExtraLargeHeight = CustomScreen.isMobileExtraLargeHeight();
    final isMobileMediumWidth = CustomScreen.isMobileMediumWidth(context);

    return SingleChildScrollView(
      child: SizedBox(
        /// TO DO
        height: isMobileMediumHeight
            ? 1180
            : isMobileLargeHeight
                ? 1250
                : isMobileExtraLargeHeight
                    ? 1300
                    : null,
        child: Column(
          children: [
            const CustomSearchButton(),
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
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
            ),
          ],
        ),
      ),
    );
  }
}
