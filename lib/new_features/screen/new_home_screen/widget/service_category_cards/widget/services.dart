
import 'package:flutter/material.dart';
import 'package:jbl/new_features/screen/new_home_screen/widget/service_category_cards/widget/service_detail.dart';
import '../../../../../../common/widgets/appbar/custom_appbar/custom_appbar.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../models/service_product.dart';
import '../../../../guest_tab_bar/widget/guest_service_category/widget/services/widget/service_item.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key, required this.title, required this.services});

  final String title;
  final List<ServiceProduct> services;

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  /// -- Function to get the selected service as an input
  void selectService(BuildContext context, ServiceProduct service) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => ServiceDetailScreen(
          service: service,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /// -- Widget for Grid View of Services in each Categories
    Widget content = GridView.builder(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 2 / 2.4,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: widget.services.length,
      itemBuilder: (ctx, index) => ServiceItem(
        service: widget.services[index],
        onSelectedService: (service) {
          selectService(context, service);
        },
      ),
    );

    if (widget.services.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uh oh ... nothing here!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 15),
            Text(
              'Try selecting a different category',
              style: Theme.of(context).textTheme.titleSmall,
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: TColors.light,
        isEdit: false,
        showBackgroundColor: false,
        showIcon: true,
        isDrawer: false,
        isCenterTitle: true,
        isNotification: false,
        iconColor: TColors.primary,
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.titleMedium!.apply(
            fontSizeDelta: 2,
            color: TColors.primary,
          ),
        ),
      ),

      body: content,
      backgroundColor: TColors.secondary,
    );
  }
}
