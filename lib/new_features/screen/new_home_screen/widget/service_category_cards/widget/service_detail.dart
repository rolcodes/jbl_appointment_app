import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jbl/utils/device/device_utility.dart';

import '../../../../../../common/widgets/appbar/custom_appbar/custom_appbar.dart';
import '../../../../../../services/shared_pref.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/device/device_screen_ratio.dart';
import '../../../../../models/service_product.dart';
import '../../../../select_date/select_date.dart';

class ServiceDetailScreen extends StatelessWidget {
  const ServiceDetailScreen({
    super.key,
    required this.service,
  });

  final ServiceProduct service;

  saveServiceData() async {
    /// Save data temporarily in local database; title, image, duration, price
    await SharedPreferenceHelper().saveService(service.title);
    await SharedPreferenceHelper().saveServiceImage(service.imageUrl);
    await SharedPreferenceHelper().saveServiceDuration(service.duration);
    await SharedPreferenceHelper().saveServicePrice(service.price);

    Get.to(() => const SelectDateScreen());
  }

  @override
  Widget build(BuildContext context) {
    /// My Strategy on making conditions in Media Queries
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
              height: isMobileSmallHeight ? 810 : isMobileMediumHeight
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
                      loadingBuilder: (BuildContext
                      context,
                          Widget child,
                          ImageChunkEvent?
                          loadingProgress) {
                        if (loadingProgress ==
                            null) return child;
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 300,
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
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                        );
                      },
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
                            height: isMobileMediumHeight
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
              isNotification: true,
            ),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          saveServiceData();
        },
        child: Container(
          height: Platform.isAndroid ? 50 : 70,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.orange.shade800, TColors.primary])),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Book an Appointment',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .apply(color: Colors.white),
                ),
                SizedBox(height: Platform.isAndroid ? 0 : 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
