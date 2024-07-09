import 'package:appointment_app/common/widgets/products/product_cards/vertical_product_card.dart';
import 'package:appointment_app/features/shop/screens/home/widgets/category_widget/gluta_category.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class GlutaTab extends StatelessWidget {
  const GlutaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 40),

          Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(16),
            child: GestureDetector(
              onTap: () => Get.to(() => const GlutaCategory()),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 160,
                clipBehavior: Clip.hardEdge,
                // -> use this if border radius doesn't work
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Gluta-Iv-Push-Vs-Drip-Jevelme-Beauty-Lounge.webp'),
                      fit: BoxFit.cover,
                      alignment: Alignment(0, 0.28)),
                ),
              ),
            ),
          ),

          SizedBox(height: 30),

          Text(
            textAlign: TextAlign.center,
            "More Than Glowing Skin, It's Inner Radiance",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.accent),
          ),
          SizedBox(height: 20),

          Text(
            textAlign: TextAlign.center,
            "Unveil luminous skin from within with our gluta drip and push treatments, designed to revitalize and enhance your natural radiance.",
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.accent, heightDelta: 0.4),
          ),
          SizedBox(height: 20),

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
                onPressed: () => Get.to(() => const GlutaCategory()),
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
                'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Perfect-Skin-Jevelme-Beauty-Lounge.webp',
                title: 'Perfect White Skin Push',
                subtitle:
                'Illuminate with our whitening infusion therapy.',
                price: '₱499',
                alignment: Alignment(0, 0.5),
              ),
              VerticalProductCard(
                image:
                'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Cleansing-Push-Services-Jevelme-Beauty-Lounge.webp',
                title: 'Cleansing Push',
                price: '₱599',
                alignment: Alignment.center,
                subtitle:
                'Refresh and revitalize with our deep cleansing infusion.',
              ),
            ],
          ),
          SizedBox(height: 20),

          /// -- Row 2
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VerticalProductCard(
                image:
                'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Celebrity-Pinkish-Push-near-me-Jevelme-Beauty-Lounge.webp',
                title: 'Celebrity Pinkish Push',
                subtitle:
                'Achieve a radiant, pinkish glow effortlessly.',
                price: '₱699',
                alignment: Alignment.center,
              ),
              VerticalProductCard(
                image:
                'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Sexy-White-Drip-Services-Near-Me-Jevelme-Beauty-Lounge.webp',
                title: 'JBL Signature White Drip',
                price: '₱1499',
                alignment: Alignment.center,
                subtitle:
                'Brighten skin tone for a radiant look.',
              ),
            ],
          ),
          SizedBox(height: 20),

          /// -- Row 3
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VerticalProductCard(
                image:
                'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Cindella-Drip-Jevelme-Beauty-Lounge.webp',
                title: 'Cinderella Drip',
                subtitle:
                'Achieve a youthful glow and even complexion.',
                price: '₱1799',
                alignment: Alignment.center,
              ),
              VerticalProductCard(
                image:
                'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Cinderella-Drip-Jevelme-Beauty-Lounge.webp',
                title: 'European Facial (w/ RF)',
                price: '₱1899',
                alignment: Alignment.center,
                subtitle:
                'Get radiant and glass-like skin.',
              ),
            ],
          ),
          SizedBox(height: 20),

          /// -- Row 4
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VerticalProductCard(
                image:
                'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/JBL-Signature-White-Drip-Jevelme-Beauty-Lounge.webp',
                title: 'Sexy White Drip',
                subtitle:
                "Brighten skin for a healthy, sexy look.",
                price: '₱1299',
                alignment: Alignment.center,
              ),
              VerticalProductCard(
                image:
                'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Melasma-Drip-Jevelme-Beauty-Lounge.webp',
                title: 'Melasma Drip',
                price: '₱1199',
                alignment: Alignment.center,
                subtitle:
                'Reduce hyperpigmentation for clearer skin.',
              ),
            ],
          ),

          SizedBox(height: 40),
        ],
      ),
    );
  }
}
