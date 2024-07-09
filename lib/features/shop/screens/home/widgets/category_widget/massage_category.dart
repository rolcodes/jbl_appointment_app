import 'package:appointment_app/features/shop/screens/home/widgets/category_widget/widget/product_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utils/constants/colors.dart';

class MassageCategory extends StatelessWidget {
  const MassageCategory({super.key});

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
                          'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Massage-Services-Near-Me-Jevelme-Beauty-Lounge.webp'),
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
                        "Melt Away Stress, \nFind Total Rejuvenation",
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
                    "Relax and unwind with Jevelme’s best Imus massage services. Our exceptional massage therapists relieve stress and tension, leaving clients refreshed.",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(heightDelta: 0.4), textAlign: TextAlign.center,),
                  const SizedBox(height: 10),

                  /// Title
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'Massage Service',
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
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Swedish-Massage-Jevelme-Beauty-Lounge.webp',
                        title: 'Swedish Massage',
                        subtitle: 'Melt away tension with long, soothing strokes',
                        price: '₱299',
                      ),
                      const SizedBox(height: 10),

                      /// Item 2
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Regular-Massage-Jevelme-Beauty-Lounge.webp',
                        title: 'Cleansing Push',
                        price: '₱349',
                        subtitle: 'Refresh your body and mind with classic techniques.',
                      ),
                      const SizedBox(height: 10),

                      /// Item 3
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Beauty-Lounge-Near-Me-Jevelme-Beauty-Lounge.webp',
                        title: 'JBL Signature Massage',
                        subtitle:
                        'Experience deep relaxation with our signature therapy.',
                        price: '₱399',
                      ),
                      const SizedBox(height: 10),



                      /// Item 4
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Deep-Tissue-Massage-Jevelme-Beauty-Lounge.webp',
                        title: 'Deep Tissue',
                        price: '₱449',
                        subtitle:
                        'target deep muscle layers to release chronic tension.',
                      ),
                      const SizedBox(height: 10),

                      /// Item 5
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Dry-Massage-Near-Me-Jevelme-Beauty-Lounge.webp',
                        title: 'Dry Massage',
                        subtitle: 'boost circulation and improves flexibility.',
                        price: '₱499',
                      ),
                      const SizedBox(height: 10),

                      /// Item 6
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Foot-Reflex-Massage-Jevelme-Beauty-Lounge.webp',
                        title: 'Foot Reflex',
                        price: '₱249',
                        subtitle: 'Relieve foot pain and promote overall well-being.',
                      ),
                      const SizedBox(height: 10),

                      /// Item 7
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Back-Massage-Services-Near-Me-Jevelme-Beauty-Lounge.webp',
                        title: 'Back Massage',
                        subtitle: "Focus on relieving tension and knots in your back",
                        price: '₱199',
                      ),
                      const SizedBox(height: 10),

                      /// Item 8
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Head-Massage-Near-Me-Jevelme-Beauty-Lounge.webp',
                        title: 'Head Massage',
                        price: '₱149',
                        subtitle: 'Soothe headaches and improve scalp circulation.',
                      ),

                      /// Item 9
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Reflex-Massage-Jevelme-Beauty-Lounge.webp',
                        title: 'Hand Reflex Massage',
                        subtitle: "Reduce stress and improve hand dexterity.",
                        price: '₱149',
                      ),
                      const SizedBox(height: 10),

                      /// Title
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'Package Massage',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .apply(color: TColors.primary),
                        ),
                      ),
                      const SizedBox(height: 10),

                      /// Item 10
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Package-Massage-Services-Near-Me-Jevelme-Beauty-Lounge.webp',
                        title: 'JBL MASSAGE W/ HOT STONE',
                        price: '₱749',
                        subtitle: 'Relax & unwind with heated stones.',
                      ),

                      /// Item 11
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Jbl-Massage-With-Hot-Compress-Jevelme-Beauty-Lounge.webp',
                        title: 'JBL MASSAGE W/ HOT COMPRESS',
                        subtitle: "Soothes tension & promotes circulation.",
                        price: '₱549',
                      ),

                      /// Item 12
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Jbl-With-Ventosa-Jevelme-Beauty-Lounge.webp',
                        title: 'JBL W/ VENTOSA',
                        price: '₱499',
                        subtitle: 'Improves blood flow & reduces pain.',
                      ),

                      /// Item 13
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Jbl-Massage-Take-All-With-Body-Scrub-Jevelme-Beauty-Lounge.webp',
                        title: 'JBL MASSAGE TAKE ALL W/ BODY SCRUB',
                        subtitle: "Buff away dead skin for a revitalized glow.",
                        price: '₱799',
                      ),
                      const SizedBox(height: 10),

                      /// Title
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'Add-Ons',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .apply(color: TColors.primary),
                        ),
                      ),
                      const SizedBox(height: 10),

                      /// Item 14
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Ear-Candling-Jevelme-Beauty-Lounge.webp',
                        title: 'Ear Candle',
                        subtitle:
                        "Stress Relief & Relaxation with Ear Candle Treatment",
                        price: '₱149',
                      ),

                      /// Item 15
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Hot-Stone-Massage-Jevelme-Beauty-Lounge.webp',
                        title: 'Hot Stone',
                        subtitle: "Deep Muscle Penetration with JBL Hot Stone Massage",
                        price: '₱249',
                      ),

                      /// Item 16
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Ventosa-Massage-Near-Me-Jevelme-Beauty-Lounge.webp',
                        title: 'Ventosa',
                        price: '₱149',
                        subtitle: 'Enhanced Detoxification with Our Ventosa Massage Services',
                      ),

                      /// Item 17
                      const ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Hot-Compress-Massage-Jevelme-Beauty-Lounge.webp',
                        title: 'Hot Compress',
                        subtitle: "Balancing Energy Flow with Hot Compress Massage Services",
                        price: '₱199',
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
