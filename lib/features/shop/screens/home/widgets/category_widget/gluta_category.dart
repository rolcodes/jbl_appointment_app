import 'package:appointment_app/features/shop/screens/home/widgets/category_widget/widget/product_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utils/constants/colors.dart';

class GlutaCategory extends StatelessWidget {
  const GlutaCategory({super.key});

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
                          'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Gluta-Iv-Push-Vs-Drip-Jevelme-Beauty-Lounge.webp'),
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
                  /// -- Category Name
                  // Center(
                  //   child: Text('Facial Care',
                  //       style: Theme.of(context)
                  //           .textTheme
                  //           .headlineMedium!
                  //           .apply(color: TColors.primary),textAlign: TextAlign.center,),
                  // ),
                  const SizedBox(height: 10),

                  /// Subtitle & Logo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "More Than Glowing Skin, \nIt's Inner Radiance",
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
                    "Unveil luminous skin from within with our gluta drip and push treatments, designed to revitalize and enhance your natural radiance.",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(heightDelta: 0.4), textAlign: TextAlign.center,),
                  const SizedBox(height: 10),

                  /// Title
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'Gluta IV Push & Drip',
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
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Perfect-Skin-Jevelme-Beauty-Lounge.webp',
                        title: 'Perfect White Skin Push',
                        subtitle:
                        'Illuminate with our whitening infusion therapy.',
                        price: '₱499',
                      ),
                      const SizedBox(height: 10),

                      /// Item 2
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Cleansing-Push-Services-Jevelme-Beauty-Lounge.webp',
                        title: 'Cleansing Push',
                        price: '₱599',
                        subtitle:
                        'Refresh and revitalize with our deep cleansing infusion.',
                      ),
                      const SizedBox(height: 10),

                      /// Item 3
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Celebrity-Pinkish-Push-near-me-Jevelme-Beauty-Lounge.webp',
                        title: 'Celebrity Pinkish Push',
                        subtitle:
                        'Achieve a radiant, pinkish glow effortlessly.',
                        price: '₱699',
                      ),
                      const SizedBox(height: 10),

                      /// Title
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'Gluta Drip Session',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .apply(color: TColors.primary),
                        ),
                      ),
                      const SizedBox(height: 10),

                      /// Item 4
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Sexy-White-Drip-Services-Near-Me-Jevelme-Beauty-Lounge.webp',
                        title: 'JBL Signature White Drip',
                        price: '₱1499',
                        subtitle:
                        'Brighten skin tone for a radiant look.',
                      ),
                      const SizedBox(height: 10),

                      /// Item 5
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Cindella-Drip-Jevelme-Beauty-Lounge.webp',
                        title: 'Cinderella Drip',
                        subtitle:
                        'Achieve a youthful glow and even complexion.',
                        price: '₱1799',
                      ),
                      const SizedBox(height: 10),

                      /// Item 6
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Cinderella-Drip-Jevelme-Beauty-Lounge.webp',
                        title: 'European Facial (w/ RF)',
                        price: '₱1899',
                        subtitle:
                        'Get radiant and glass-like skin.',
                      ),
                      const SizedBox(height: 10),

                      /// Item 7
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/JBL-Signature-White-Drip-Jevelme-Beauty-Lounge.webp',
                        title: 'Sexy White Drip',
                        subtitle:
                        "Brighten skin for a healthy, sexy look.",
                        price: '₱1299',
                      ),
                      const SizedBox(height: 10),

                      /// Item 8
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Melasma-Drip-Jevelme-Beauty-Lounge.webp',
                        title: 'Melasma Drip',
                        price: '₱1199',
                        subtitle:
                        'Reduce hyperpigmentation for clearer skin.',
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
