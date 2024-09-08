import 'package:flutter/material.dart';

import '../../../../../../../../utils/constants/colors.dart';
import '../../../../../../../../utils/device/device_screen_ratio.dart';
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
    final isMobileSmallHeight = CustomScreen.isMobileSmallHeight();

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
                  height: isMobileSmallHeight ? 120 : 140,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext
                  context,
                      Widget child,
                      ImageChunkEvent?
                      loadingProgress) {
                    if (loadingProgress ==
                        null) return child;
                    return SizedBox(
                      width: 300,
                      height: 140,
                      child: Center(
                        child:
                        CircularProgressIndicator(
                          color: TColors
                              .primary,
                          value: loadingProgress
                              .expectedTotalBytes !=
                              null
                              ? loadingProgress
                              .cumulativeBytesLoaded /
                              loadingProgress
                                  .expectedTotalBytes!
                              : null,
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context,
                      exception,
                      stackTrace) {
                    return Image.asset(
                      'assets/images/content/no-image-found.jpg',
                      fit: BoxFit.cover,
                      width: 300,
                      height: 140,
                    );
                  },
                ),
              ),
              Expanded(
                child: Center(
                  child: SizedBox(
                    width: isMobileSmallHeight ? 120 : 160,
                    child: Text(
                      service.title,
                      style: isMobileSmallHeight
                          ? Theme.of(context).textTheme.titleLarge!.apply(fontSizeDelta: -4)
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
