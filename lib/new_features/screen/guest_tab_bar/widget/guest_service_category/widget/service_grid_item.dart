import 'package:flutter/material.dart';
import 'package:jbl/utils/device/device_screen_ratio.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../../../../../models/category_model.dart';

class ServiceGridItem extends StatelessWidget {
  const ServiceGridItem({
    super.key,
    required this.service,
    required this.onSelectedCategory,
  });

  final Category service;
  final void Function() onSelectedCategory;

  @override
  Widget build(BuildContext context) {
    final isMobileExtraSmallHeight = CustomScreen.isMobileExtraSmallHeight();
    final isMobileSmallHeight = CustomScreen.isMobileSmallHeight();

    /// -- Widget for Categories => guest_service_category.dart
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onSelectedCategory,
        splashColor: Colors.black,
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
                  service.image,
                  width: 300,
                  height: isMobileExtraSmallHeight
                      ? 115
                      : isMobileSmallHeight
                          ? 120
                          : 140,
                  fit: BoxFit.cover,
                  // When image is loading from the server it takes some time
                  // So we will show progress indicator while loading
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return SizedBox(
                      width: 300,
                      height: isMobileExtraSmallHeight
                          ? 115
                          : isMobileSmallHeight
                              ? 120
                              : 140,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: TColors.primary,
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      ),
                    );
                  },
                  // When dealing with networks it completes with two states,
                  // complete with a value or completed with an error,
                  // So handling errors is very important otherwise it will crash the app screen.
                  // I showed dummy images from assets when there is an error, you can show some texts or anything you want.
                  errorBuilder: (context, exception, stackTrace) {
                    return Image.asset(
                      'assets/images/content/no-image-found.jpg',
                      fit: BoxFit.cover,
                      width: 300,
                      height: isMobileExtraSmallHeight
                          ? 115
                          : isMobileSmallHeight
                              ? 120
                              : 140,
                    );
                  },
                ),
              ),
              Expanded(
                child: Center(
                  child: SizedBox(
                    width: isMobileSmallHeight ? 140 : 160,
                    child: Text(
                      service.title,
                      style: Theme.of(context).textTheme.titleLarge!.apply(
                            fontSizeDelta: isMobileExtraSmallHeight
                                ? -5
                                : isMobileSmallHeight
                                    ? -4
                                    : 0,
                          ),
                      textAlign: TextAlign.center,
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
