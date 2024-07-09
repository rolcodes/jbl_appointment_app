import 'package:appointment_app/common/widgets/products/product_cards/vertical_product_card.dart';
import 'package:appointment_app/features/shop/screens/home/widgets/category_widget/massage_category.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MassageTab extends StatelessWidget {
  const MassageTab({super.key});

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
              onTap: () => Get.to(() => const MassageCategory()),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 160,
                clipBehavior: Clip.hardEdge,
                // -> use this if border radius doesn't work
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Massage-Services-Near-Me-Jevelme-Beauty-Lounge.webp'),
                      fit: BoxFit.cover,
                      alignment: Alignment(0, 0.28)),
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),

          Text(
            textAlign: TextAlign.center,
            "Melt Away Stress, Find Total Rejuvenation",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.accent),
          ),
          const SizedBox(height: 20),

          Text(
            textAlign: TextAlign.center,
            "Relax and unwind with Jevelme’s best Imus massage services. Our exceptional massage therapists relieve stress and tension, leaving clients refreshed.",
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
                onPressed: () => Get.to(() => const MassageCategory()),
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
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Swedish-Massage-Jevelme-Beauty-Lounge.webp',
                title: 'Swedish Massage',
                subtitle: 'Melt away tension with long, soothing strokes',
                price: '₱299',
                alignment: Alignment(0, -1.5),
              ),
              VerticalProductCard(
                image:
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Regular-Massage-Jevelme-Beauty-Lounge.webp',
                title: 'Cleansing Push',
                price: '₱349',
                alignment: Alignment.center,
                subtitle: 'Refresh your body and mind with classic techniques.',
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
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Beauty-Lounge-Near-Me-Jevelme-Beauty-Lounge.webp',
                title: 'JBL Signature Massage',
                subtitle:
                    'Experience deep relaxation with our signature therapy.',
                price: '₱399',
                alignment: Alignment.center,
              ),
              VerticalProductCard(
                image:
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Deep-Tissue-Massage-Jevelme-Beauty-Lounge.webp',
                title: 'Deep Tissue',
                price: '₱449',
                alignment: Alignment.center,
                subtitle:
                    'target deep muscle layers to release chronic tension.',
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
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Dry-Massage-Near-Me-Jevelme-Beauty-Lounge.webp',
                title: 'Dry Massage',
                subtitle: 'boost circulation and improves flexibility.',
                price: '₱499',
                alignment: Alignment.center,
              ),
              VerticalProductCard(
                image:
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Foot-Reflex-Massage-Jevelme-Beauty-Lounge.webp',
                title: 'Foot Reflex',
                price: '₱249',
                alignment: Alignment(0, 0.5),
                subtitle: 'Relieve foot pain and promote overall well-being.',
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
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Back-Massage-Services-Near-Me-Jevelme-Beauty-Lounge.webp',
                title: 'Back Massage',
                subtitle: "Focus on relieving tension and knots in your back",
                price: '₱199',
                alignment: Alignment.center,
              ),
              VerticalProductCard(
                image:
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Head-Massage-Near-Me-Jevelme-Beauty-Lounge.webp',
                title: 'Head Massage',
                price: '₱149',
                alignment: Alignment.center,
                subtitle: 'Soothe headaches and improve scalp circulation.',
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
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Reflex-Massage-Jevelme-Beauty-Lounge.webp',
                title: 'Hand Reflex Massage',
                subtitle: "Reduce stress and improve hand dexterity.",
                price: '₱149',
                alignment: Alignment.center,
              ),
              VerticalProductCard(
                image:
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Package-Massage-Services-Near-Me-Jevelme-Beauty-Lounge.webp',
                title: 'JBL MASSAGE W/ HOT STONE',
                price: '₱749',
                alignment: Alignment.center,
                subtitle: 'Relax & unwind with heated stones.',
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
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Jbl-Massage-With-Hot-Compress-Jevelme-Beauty-Lounge.webp',
                title: 'JBL MASSAGE W/ HOT COMPRESS',
                subtitle: "Soothes tension & promotes circulation.",
                price: '₱549',
                alignment: Alignment.center,
              ),
              VerticalProductCard(
                image:
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Jbl-With-Ventosa-Jevelme-Beauty-Lounge.webp',
                title: 'JBL W/ VENTOSA',
                price: '₱499',
                alignment: Alignment(0, -1.2),
                subtitle: 'Improves blood flow & reduces pain.',
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
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Jbl-Massage-Take-All-With-Body-Scrub-Jevelme-Beauty-Lounge.webp',
                title: 'JBL MASSAGE TAKE ALL W/ BODY SCRUB',
                subtitle: "Buff away dead skin for a revitalized glow.",
                price: '₱799',
                alignment: Alignment.center,
              ),
              VerticalProductCard(
                image:
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Ear-Candling-Jevelme-Beauty-Lounge.webp',
                title: 'Ear Candle',
                subtitle:
                    "Stress Relief & Relaxation with Ear Candle Treatment",
                price: '₱149',
                alignment: Alignment(0, 0.3),
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
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Hot-Stone-Massage-Jevelme-Beauty-Lounge.webp',
                title: 'Hot Stone',
                subtitle: "Deep Muscle Penetration with JBL Hot Stone Massage",
                price: '₱249',
                alignment: Alignment.center,
              ),
              VerticalProductCard(
                image:
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Ventosa-Massage-Near-Me-Jevelme-Beauty-Lounge.webp',
                title: 'Ventosa',
                price: '₱149',
                alignment: Alignment.center,
                subtitle: 'Enhanced Detoxification with Our Ventosa Massage Services',
              ),
            ],
          ),
          const SizedBox(height: 20),

          /// -- Row 7
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VerticalProductCard(
                image:
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Hot-Compress-Massage-Jevelme-Beauty-Lounge.webp',
                title: 'Hot Compress',
                subtitle: "Balancing Energy Flow with Hot Compress Massage Services",
                price: '₱199',
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
