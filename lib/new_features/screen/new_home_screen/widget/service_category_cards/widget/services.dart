import 'package:appointment_app/common/widgets/appbar/custom_appbar/custom_appbar.dart';
import 'package:appointment_app/new_features/screen/guest_tab_bar/widget/guest_service_category/widget/services/widget/service_item.dart';
import 'package:appointment_app/new_features/screen/new_home_screen/widget/service_category_cards/widget/service_detail.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../../../../models/service_product.dart';

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

  late bool _isLoading;

  /// Initialize loading time
  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
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
      appBar: CustomAppBar(        isEdit: false,

        showBackgroundColor: false,
        showIcon: true,
        isDrawer: false,
        isCenterTitle: true,
        isNotification: false,
        iconColor: TColors.primary,
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.headlineSmall!.apply(
            color: TColors.primary,
            shadows: [
              BoxShadow(
                color: Colors.grey.withOpacity(.50),
                spreadRadius: 5,
                offset: const Offset(0, 1),
                blurRadius: 5,
                blurStyle: BlurStyle.normal
              ),
            ],
          ),
        ),
      ),

      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(TColors.primary),
              ),
            )
          : content,
      backgroundColor: TColors.secondary,

      /// -- Book an Appointment
      // bottomNavigationBar: GestureDetector(
      //   onTap: () => Get.to(() => const SelectDateScreen()),
      //   child: Container(
      //     height: 70,
      //     decoration: BoxDecoration(
      //         gradient: LinearGradient(
      //             colors: [Colors.orange.shade800, TColors.primary])),
      //     child: Center(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Text(
      //             'Book an Appointment',
      //             style: Theme.of(context)
      //                 .textTheme
      //                 .titleSmall!
      //                 .apply(color: Colors.white),
      //           ),
      //           SizedBox(height: 10),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
