import 'package:appointment_app/new_features/models/service_product.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class GuestServiceDetailScreen extends StatelessWidget {
  const GuestServiceDetailScreen({
    super.key,
    required this.service,
  });

  final ServiceProduct service;

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

                  /// -- Title
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          service.title,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(height: 25),

                        /// -- Description
                        Text(service.description),
                        SizedBox(height: 25),

                        /// -- Price
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
                              SizedBox(width: 6),
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
                        SizedBox(height: 25),

                        /// -- Duration
                        Text(service.duration,
                            style: Theme.of(context).textTheme.bodyLarge),
                        SizedBox(height: 25),

                        /// -- Rating
                        Container(
                          padding: EdgeInsets.all(15),
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
                                SizedBox(height: 10),
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
                        SizedBox(height: 25),

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
                              SizedBox(height: 10),
                              Text(
                                'No Information Available',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              SizedBox(height: 30),
                              Text(
                                'How Often Should It be Done?',
                                style: Theme.of(context).textTheme.titleLarge!
                                    .apply(color: TColors.primary),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Repeat service every 2-3 weeks',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 65,
            left: 10,
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: TColors.primary,
                    size: 25,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
