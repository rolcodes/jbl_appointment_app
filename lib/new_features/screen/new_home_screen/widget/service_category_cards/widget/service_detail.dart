import 'package:appointment_app/common/widgets/products/product_cards/widget/rating_indicator.dart';
import 'package:appointment_app/new_features/models/service_product.dart';
import 'package:appointment_app/new_features/screen/select_date/select_date.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../common/widgets/appbar/custom_appbar/custom_appbar.dart';
import '../../../../../../services/shared_pref.dart';

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
    return Scaffold(
      backgroundColor: TColors.secondary,
      body: Stack(
        children: [
          Positioned(
            top: 56,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  /// -- Image
                  Image.network(
                    service.imageUrl,
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 8),

                  /// -- Title
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                        ),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              service.title,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(height: 25),

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
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    'assets/images/users/female-svgrepo-com.png',
                                    width: 20,
                                  ),
                                  Image.asset(
                                    'assets/images/users/male-svgrepo-com.png',
                                    width: 14,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    "${service.price}.00",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .apply(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 25),

                            /// -- Duration
                            Text(service.duration,
                                style: Theme.of(context).textTheme.bodyLarge),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),

                      /// -- Rating
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 25),
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
                      const SizedBox(height: 25),

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
                            const SizedBox(height: 30),
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
      bottomNavigationBar: GestureDetector(
        onTap: () {
          saveServiceData();
        },
        child: Container(
          height: 70,
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
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
