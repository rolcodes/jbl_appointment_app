import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../../../common/widgets/appbar/custom_appbar/custom_appbar.dart';
import '../../../../../../../../../utils/constants/colors.dart';
import '../../../../../../../../../utils/device/device_screen_ratio.dart';
import '../../../../../../../../models/service_product.dart';

class GuestServiceDetailScreen extends StatelessWidget {
  const GuestServiceDetailScreen({
    super.key,
    required this.service,
  });

  final ServiceProduct service;

  @override
  Widget build(BuildContext context) {
    final isMobileSmallHeight = CustomScreen.isMobileSmallHeight();
    final isMobileMediumHeight = CustomScreen.isMobileMediumHeight();
    final isMobileLargeHeight = CustomScreen.isMobileLargeHeight();
    final isMobileExtraLargeHeight = CustomScreen.isMobileExtraLargeHeight();

    return Scaffold(
      backgroundColor: TColors.secondary,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: isMobileSmallHeight
                  ? 810
                  : isMobileMediumHeight
                      ? 820
                      : isMobileLargeHeight
                          ? 820
                          : isMobileExtraLargeHeight
                              ? 830
                              : null,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// -- Image
                  Expanded(
                    flex: 4,
                    child: Image.network(
                      service.imageUrl,
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),

                  /// -- Title
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 20),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                          ),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                service.title,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              SizedBox(
                                  height: isMobileMediumHeight
                                      ? 10
                                      : isMobileLargeHeight
                                          ? 20
                                          : isMobileExtraLargeHeight
                                              ? 25
                                              : null),

                              /// -- Description
                              Text(service.description),
                              const SizedBox(height: 25),

                              /// -- Price
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                decoration: BoxDecoration(
                                    color: TColors.primary,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  "${service.price}.00",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .apply(color: Colors.white),
                                ),
                              ),
                              const SizedBox(height: 25),

                              /// -- Duration
                              Text("Duration: ${service.duration}",
                                  style: Theme.of(context).textTheme.bodyLarge),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        /// -- Rating
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: TColors.primary,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  'Average Rating',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const SizedBox(height: 10),
                                RatingBarIndicator(
                                  rating: 4.6,
                                  itemSize: 20,
                                  unratedColor: TColors.white,
                                  itemBuilder: (_, __) => const Icon(
                                      Iconsax.star1,
                                      color: TColors.primary),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                            height: isMobileSmallHeight ? 15 : isMobileMediumHeight
                                ? 18
                                : isMobileLargeHeight
                                    ? 20
                                    : isMobileExtraLargeHeight
                                        ? 25
                                        : null),

                        /// -- Service Inclusions:
                        Center(
                          child: Column(
                            children: [
                              Text(
                                'Service Inclusions:',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .apply(color: TColors.primary),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'No Information Available',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'How Often Should It be Done?',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .apply(color: TColors.primary),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Repeat service every 2-3 weeks',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// -- App Bar
            const CustomAppBar(
              isEdit: false,
              iconColor: Colors.white,
              showBackgroundColor: true,
              showIcon: true,
              isDrawer: false,
              isNotification: false,
            ),
          ],
        ),
      ),
    );
  }
}
