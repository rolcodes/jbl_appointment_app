import 'package:appointment_app/common/widgets/products/product_cards/vertical_product_card.dart';
import 'package:appointment_app/features/shop/screens/home/widgets/category_widget/gluta_category.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../home/widgets/category_widget/eye_category.dart';


class EyeTab extends StatelessWidget {
  const EyeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),

          Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(16),
            child: GestureDetector(
              onTap: () => Get.to(() => const EyeCategory()),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 160,
                clipBehavior: Clip.hardEdge,
                // -> use this if border radius doesn't work
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Eyelash-Extension-Near-Me-Jevelme-Beauty-Lounge.webp'),
                      fit: BoxFit.cover,
                      alignment: Alignment(0, 0.28)),
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),

          Text(
            textAlign: TextAlign.center,
            "Self-Care Starts with Lashes!",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.accent),
          ),
          const SizedBox(height: 20),

          Text(
            textAlign: TextAlign.center,
            "Achieve gorgeous, curled lashes without mascara! JBL provides eyelash perming, eyelash extension, and eyelash extension removal services. Fast, safe, and long-lasting results.",
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.accent, heightDelta: 0.4),
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .apply(color: TColors.accent),
              ),
              TextButton(
                onPressed: () => Get.to(() => const EyeCategory()),
                child: Text('View All',
                    style: Theme.of(context).textTheme.labelMedium),
              ),
            ],
          ),
          const SizedBox(height: 15),

          /// -- Row 1
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VerticalProductCard(
                image:
                'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Eyelash-Perming-Near-Me-Jevelme-Beauty-Lounge.webp',
                title: 'Eyelash Perming',
                subtitle:
                'Transform with our mesmerizing eyelash perming.',
                price: '₱399',
                alignment: Alignment(0, -0.8),
              ),
              VerticalProductCard(
                image:
                'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Eyelash-Extension-Jevelme-Beauty-Lounge.webp',
                title: 'Eyelash extension',
                price: '₱499',
                alignment: Alignment.center,
                subtitle:
                'embrace luxurious, fluttery extensions.',
              ),
            ],
          ),
          const SizedBox(height: 20),

          /// -- Row 2
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VerticalProductCard(
                image:
                'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Eyelash-Extension-Removal-Jevelme-Beauty-Lounge.webp',
                title: 'Eyelash Removal',
                subtitle:
                'Refresh with a gentle eyelash removal treatment.',
                price: '₱249',
                alignment: Alignment.center,
              ),

            ],
          ),


          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
