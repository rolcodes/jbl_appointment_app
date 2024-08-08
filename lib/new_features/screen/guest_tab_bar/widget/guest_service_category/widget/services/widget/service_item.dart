import 'package:flutter/material.dart';

import '../../../../../../../../utils/constants/colors.dart';
import '../../../../../../../../utils/device/device_utility.dart';
import '../../../../../../../models/service_product.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({
    super.key,
    required this.service,
    required this.onSelectedService,
  });

  /// Passing this value
  final ServiceProduct service;

  /// -- Function which gets the service on which gets which I tap as an input,
  /// which will be stored a property called onSelectMeal
  final void Function(ServiceProduct service) onSelectedService;

  @override
  Widget build(BuildContext context) {
    final isMobileSmall = TDeviceUtils.getScreenWidth(context) <= 393;

    /// -- Widget for Services in each Category => guest_service.dart
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () {
          onSelectedService(service);
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: TColors.lightGrey),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  service.imageUrl,
                  width: 300,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Center(
                  child: SizedBox(
                    width: isMobileSmall ? 120 : 160,
                    child: Text(
                      service.title,
                      style: isMobileSmall
                          ? Theme.of(context).textTheme.titleLarge!.apply(fontSizeDelta: -3)
                          : Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
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
