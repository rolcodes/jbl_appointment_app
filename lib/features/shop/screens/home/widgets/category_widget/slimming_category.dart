import 'package:appointment_app/features/shop/screens/home/widgets/category_widget/widget/product_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utils/constants/colors.dart';

class SlimmingCategory extends StatelessWidget {
  const SlimmingCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.secondary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 50),
                    ),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      alignment: AlignmentDirectional.center,
                      image: NetworkImage(
                          'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Mesolipo-With-Rf-Cavitation-Jevelme-Beauty-Lounge.webp'),
                    ),
                  ),
                ),
                /// Back button
                Positioned(
                  top: 60,
                  left: 20,
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: TColors.primary),
                      child: IconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(
                            Icons.arrow_circle_left_rounded,
                            color: Colors.white,
                            size: 30,
                          )),
                    ),
                  ),
                ),
              ],
            ),

            /// -- Content
            Container(
              color: TColors.secondary,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),

                  /// Subtitle & Logo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sculpt Your Body, \nReveal Radiance!",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: TColors.accent),
                      ),

                      Image.asset('assets/logos/jbl-logo-removebg-preview.png', width: 120,),
                    ],
                  ),
                  const SizedBox(height: 15),

                  /// Description
                  Text(
                    "Sculpt your dream body with Mesolipo with RF Cavitation! Target stubborn fat and tighten skin for a toned, contoured look.",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(heightDelta: 0.4), textAlign: TextAlign.center,),
                  const SizedBox(height: 10),

                  /// Title
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'Mesolipo With RF Cavitation',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: TColors.primary),
                    ),
                  ),
                  const SizedBox(height: 10),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Item 1
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Double-Chin-Removal-Service-Jevelme-Beauty-Lounge.webp',
                        title: 'Double Chin',
                        subtitle: 'Reduce puffiness for a defined look.',
                        price: '₱1500',
                      ),
                      const SizedBox(height: 10),

                      /// Item 2
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Barbie-Arms-Services-Jevelme-Beauty-Lounge.webp',
                        title: 'Barbie Arms',
                        price: '₱1699',
                        subtitle: 'Tone and tighten for sculpted arms.',
                      ),
                      const SizedBox(height: 10),

                      /// Item 3
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Sexy-Belly-Jevelme-Beauty-Lounge.webp',
                        title: 'Sexy Belly',
                        subtitle:
                        'Smoothen and flatten for a sleek core.',
                        price: '₱2299',
                      ),
                      const SizedBox(height: 10),

                      /// Item 4
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Inner-Thigh-Jevelme-Beauty-Lounge.webp',
                        title: 'Inner Thigh',
                        price: '₱1799',
                        subtitle:
                        'Reduce friction and achieve smoother skin.',
                      ),
                      const SizedBox(height: 10),

                      /// Item 5
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Outer-Thigh-Jevelme-Beauty-Lounge.webp',
                        title: 'Outer Thigh',
                        subtitle: 'Improve tone and reduce the appearance of cellulite.',
                        price: '₱1599',
                      ),
                      const SizedBox(height: 10),

                      /// Item 6
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Upper-Back-Rf-Jevelme-Beauty-Lounge.webp',
                        title: 'Upper Back',
                        price: '₱1500',
                        subtitle: 'Treat blemishes and improve texture.',
                      ),
                      const SizedBox(height: 10),

                      /// Title
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'Lipo Cavitation Radio Frequency',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .apply(color: TColors.primary),
                        ),
                      ),
                      const SizedBox(height: 10),

                      /// Item 7
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Rf-Face-Treatment-Jevelme-Beauty-Lounge.webp',
                        title: 'RF Face',
                        subtitle: "Sculpt and tighten for youthful radiance.",
                        price: '₱349',
                      ),
                      const SizedBox(height: 10),

                      /// Item 7
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Rf-Arms-Jevelme-Beauty-Lounge.webp',
                        title: 'RF Arms',
                        price: '₱499',
                        subtitle: 'Define arms with firmness and contour.',
                      ),
                      const SizedBox(height: 10),

                      /// Item 8
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Rf-Tummy-Jevelme-Beauty-Lounge.webp',
                        title: 'RF Tummy',
                        subtitle: "Flatten and tone to create a sleek silhouette.",
                        price: '₱599',
                      ),

                      /// Item 9
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Rf-Thigh-Services-Jevelme-Beauty-Lounge.webp',
                        title: 'RF Thigh',
                        price: '₱699',
                        subtitle: 'Smooth and shape thighs with precision.',
                      ),
                      const SizedBox(height: 10),

                      /// Item 10
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Rf-Back-Services-Jevelme-Beauty-Lounge.webp',
                        title: 'RF Back',
                        subtitle: "Refine back contours for a confident posture.",
                        price: '₱449',
                      ),

                      const SizedBox(height: 60),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
