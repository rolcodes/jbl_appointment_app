import 'package:appointment_app/common/widgets/products/product_cards/vertical_product_card.dart';
import 'package:appointment_app/features/shop/screens/home/widgets/category_widget/massage_category.dart';
import 'package:appointment_app/features/shop/screens/home/widgets/category_widget/slimming_category.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlimmingTab extends StatelessWidget {
  const SlimmingTab({super.key});

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
              onTap: () => Get.to(() => const SlimmingCategory()),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 160,
                clipBehavior: Clip.hardEdge,
                // -> use this if border radius doesn't work
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Mesolipo-With-Rf-Cavitation-Jevelme-Beauty-Lounge.webp'),
                      fit: BoxFit.cover,
                      alignment: Alignment(0, -0.8)),
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),

          Text(
            textAlign: TextAlign.center,
            "Sculpt Your Body, Reveal Radiance!",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.accent),
          ),
          const SizedBox(height: 20),

          Text(
            textAlign: TextAlign.center,
            "Sculpt your dream body with Mesolipo with RF Cavitation! Target stubborn fat and tighten skin for a toned, contoured look.",
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
                onPressed: () => Get.to(() => const SlimmingCategory()),
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
                'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Double-Chin-Removal-Service-Jevelme-Beauty-Lounge.webp',
                title: 'Double Chin',
                subtitle: 'Reduce puffiness for a defined look.',
                price: '₱1500',
                alignment: Alignment(0, -0.5),
              ),
              VerticalProductCard(
                image:
                'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Barbie-Arms-Services-Jevelme-Beauty-Lounge.webp',
                title: 'Barbie Arms',
                price: '₱1699',
                alignment: Alignment.center,
                subtitle: 'Tone and tighten for sculpted arms.',
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
                'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Sexy-Belly-Jevelme-Beauty-Lounge.webp',
                title: 'Sexy Belly',
                subtitle:
                'Smoothen and flatten for a sleek core.',
                price: '₱2299',
                alignment: Alignment(0, -1),
              ),
              VerticalProductCard(
                image:
                'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Inner-Thigh-Jevelme-Beauty-Lounge.webp',
                title: 'Inner Thigh',
                price: '₱1799',
                alignment: Alignment.center,
                subtitle:
                'Reduce friction and achieve smoother skin.',
              ),
            ],
          ),
          const SizedBox(height: 20),

          /// -- Row 3
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VerticalProductCard(
                image:
                'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Outer-Thigh-Jevelme-Beauty-Lounge.webp',
                title: 'Outer Thigh',
                subtitle: 'Improve tone and reduce the appearance of cellulite.',
                price: '₱1599',
                alignment: Alignment.center,
              ),
              VerticalProductCard(
                image:
                'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Upper-Back-Rf-Jevelme-Beauty-Lounge.webp',
                title: 'Upper Back',
                price: '₱1500',
                alignment: Alignment(0, 0.5),
                subtitle: 'Treat blemishes and improve texture.',
              ),
            ],
          ),
          const SizedBox(height: 20),

          /// -- Row 4
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VerticalProductCard(
                image:
                'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Rf-Face-Treatment-Jevelme-Beauty-Lounge.webp',
                title: 'RF Face',
                subtitle: "Sculpt and tighten for youthful radiance.",
                price: '₱349',
                alignment: Alignment.center,
              ),
              VerticalProductCard(
                image:
                'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Rf-Arms-Jevelme-Beauty-Lounge.webp',
                title: 'RF Arms',
                price: '₱499',
                alignment: Alignment.center,
                subtitle: 'Define arms with firmness and contour.',
              ),
            ],
          ),
          const SizedBox(height: 20),

          /// -- Row 5
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VerticalProductCard(
                image:
                'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Rf-Tummy-Jevelme-Beauty-Lounge.webp',
                title: 'RF Tummy',
                subtitle: "Flatten and tone to create a sleek silhouette.",
                price: '₱599',
                alignment: Alignment.center,
              ),
              VerticalProductCard(
                image:
                'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Rf-Thigh-Services-Jevelme-Beauty-Lounge.webp',
                title: 'RF Thigh',
                price: '₱699',
                alignment: Alignment(0, -1),
                subtitle: 'Smooth and shape thighs with precision.',
              ),
            ],
          ),
          const SizedBox(height: 20),

          /// -- Row 6
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VerticalProductCard(
                image:
                'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Rf-Back-Services-Jevelme-Beauty-Lounge.webp',
                title: 'RF Back',
                subtitle: "Refine back contours for a confident posture.",
                price: '₱449',
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
