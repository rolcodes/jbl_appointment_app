import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jbl/new_features/screen/new_home_screen/widget/service_category_cards/widget/services.dart';
import 'package:jbl/utils/device/device_utility.dart';

import '../../../../common/widgets/appbar/custom_appbar/custom_appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../utils/device/device_screen_ratio.dart';
import '../../models/category_model.dart';
import '../../models/data/dummy_data.dart';
import '../guest_tab_bar/widget/guest_service_category/widget/service_grid_item.dart';
import '../new_home_screen/widget/chat/custom_chat_button.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

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

    return Scaffold(
      backgroundColor: TColors.secondary.withOpacity(0.5),
      appBar: CustomAppBar(
        backgroundColor: TColors.white,
        isEdit: false,
        isCenterTitle: true,
        iconColor: TColors.primary,
        showBackgroundColor: false,
        showIcon: false,
        isDrawer: false,
        isNotification: true,
        title: Image.asset(
          'assets/logos/jbl-logo.jpg',
          fit: BoxFit.contain,
          width: 145,
        ),
      ),
      body: SingleChildScrollView(
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
              Container(
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 0),
                child: TextFormField(
                  onTapOutside: (event) {
                    print('onTapOutside');
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  onTap: () {},
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      isDense: true,
                      prefixIcon: Icon(Iconsax.search_normal),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      )),
                ),
              ),
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
      ),
      floatingActionButton: const CustomChatButton(),
    );
  }
}
