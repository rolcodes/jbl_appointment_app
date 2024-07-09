import 'package:appointment_app/common/widgets/products/product_cards/vertical_product_card.dart';
import 'package:appointment_app/features/shop/screens/home/widgets/category_widget/facial_category.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FacialTab extends StatelessWidget {
  const FacialTab({super.key});

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
              onTap: () => Get.to(() => const FacialCategory()),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 160,
                clipBehavior: Clip.hardEdge,
                // -> use this if border radius doesn't work
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Dimond-Peel-with-whitening-services-Jevelme-Beauty-Lounge.webp'),
                      fit: BoxFit.cover,
                      alignment: Alignment.center),
                ),
              ),
            ),
          ),

          SizedBox(height: 30),

          Text(
            textAlign: TextAlign.center,
            "More Than Skin-Care, It's Self-Care",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.accent),
          ),
          SizedBox(height: 20),

          Text(
            textAlign: TextAlign.center,
            "Indulge in radiant skin with our personalized skin care facial treatment, meticulously tailored to rejuvenate, nourish, and enhance your natural beauty.",
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
                onPressed: () => Get.to(() => const FacialCategory()),
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
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Relaxing-Facial-Treatment-Jevelme-Beauty-Lounge.webp',
                title: 'Relaxing Facial',
                subtitle:
                    'De-stress and unwind with a soothing facial treatment.',
                price: '₱299',
                alignment: Alignment(0, 0.5),
              ),
              VerticalProductCard(
                image:
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Basic-Facial-With-Whitening-Facial-Near-Me-Jevelme-Beauty-Lounge.webp',
                title: 'Basic Facial w/ Whitening',
                price: '₱599',
                alignment: Alignment.center,
                subtitle:
                    'Brighten your complexion with a cleansing and whitening facial.',
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
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Dimond-Peel-with-whitening-services-Jevelme-Beauty-Lounge.webp',
                title: 'Diamond Peel w/ Whitening Facial',
                subtitle:
                    'Exfoliate and brighten with a diamond peel and whitening treatment.',
                price: '₱799',
                alignment: Alignment.center,
              ),
              VerticalProductCard(
                image:
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Facial-Care-Services-Jevelme-Beauty-Lounge.webp',
                title: 'Acne Facial w/ Led Light',
                price: '₱599',
                alignment: Alignment.center,
                subtitle:
                    'Brighten your complexion with a cleansing and whitening facial.',
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
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Facial-Near-Me-Jevelme-Beauty-Lounge.webp',
                title: 'Hydra Facial',
                subtitle:
                    'Achieve radiant skin with hydra facial deep cleanse & hydration.',
                price: '₱999',
                alignment: Alignment.center,
              ),
              VerticalProductCard(
                image:
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Facial-Care-Center-Services-Jevelme-Beauty-Lounge.webp',
                title: 'European Facial (w/ RF)',
                price: '₱899',
                alignment: Alignment.center,
                subtitle:
                    'Brighten your complexion with a cleansing and whitening facial.',
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
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Facial-Care-Center-Imus-Services-Jevelme-Beauty-Lounge.webp',
                title: 'V-Shape Facial (w/ RF)',
                subtitle:
                    "Renew skin's vitality, firmness with European facial and RF technology.",
                price: '₱899',
                alignment: Alignment.center,
              ),
              VerticalProductCard(
                image:
                    'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Facila-Near-Me-Jevelme-Beauty-Lounge.webp',
                title: 'Dermaplaning Facial',
                price: '₱799',
                alignment: Alignment.center,
                subtitle:
                    'Smooth, refine skin texture with gentle dermaplaning facial treatments.',
              ),
            ],
          ),

          SizedBox(height: 40),
        ],
      ),
    );
  }
}
