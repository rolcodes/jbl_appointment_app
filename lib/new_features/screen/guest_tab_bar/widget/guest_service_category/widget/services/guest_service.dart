import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jbl/new_features/screen/guest_tab_bar/widget/guest_service_category/widget/services/widget/service_detail/guest_service_detail.dart';
import 'package:jbl/new_features/screen/guest_tab_bar/widget/guest_service_category/widget/services/widget/service_item.dart';

import '../../../../../../../common/widgets/buttons/custom_guest_book_now_button.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../models/service_product.dart';
import '../../../../../landing_screen/landing_screen.dart';

class GuestServiceScreen extends StatefulWidget {
  const GuestServiceScreen(
      {super.key, required this.title, required this.services});

  final String title;
  final List<ServiceProduct> services;

  @override
  State<GuestServiceScreen> createState() => _GuestServiceScreenState();
}

class _GuestServiceScreenState extends State<GuestServiceScreen> {
  /// -- Function to get the selected service as an input
  void selectService(BuildContext context, ServiceProduct service) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => GuestServiceDetailScreen(
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
      padding: EdgeInsets.all(24),
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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: TColors.primary),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const SizedBox(
            height: 50,
            width: 50,
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: TColors.primary,
              size: 20,
            ),
          ),
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(TColors.primary),
              ),
            )
          : content,
      backgroundColor: TColors.secondary,

      /// -- Book an Appointment
      bottomNavigationBar: CustomGuestBookNowButton(text: 'Book an Appointment',)
    );
  }
}
