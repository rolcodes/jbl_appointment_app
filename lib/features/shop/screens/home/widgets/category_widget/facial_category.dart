import 'package:appointment_app/features/shop/screens/home/widgets/category_widget/widget/product_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utils/constants/colors.dart';

class FacialCategory extends StatelessWidget {
  const FacialCategory({super.key});

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
                          'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Dimond-Peel-with-whitening-services-Jevelme-Beauty-Lounge.webp'),
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
                        "More Than Skin-Care, \nIt's Self-Care",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: TColors.accent),
                      ),

                      Image.asset('assets/logos/jbl-logo-removebg-preview.png', width: 120,),
                    ],
                  ),
                  SizedBox(height: 15),

                  /// Description
                  Text(
                      'Indulge in radiant skin with our personalized skin care facial treatment, meticulously tailored to rejuvenate, nourish, and enhance your natural beauty.',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(heightDelta: 0.4), textAlign: TextAlign.center,),
                  const SizedBox(height: 10),

                  /// Title
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'Facial Care',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: TColors.primary),
                    ),
                  ),
                  const SizedBox(height: 10),

                  const Column(
                    children: [
                      /// Item 1
                      ProductListTile(
                        image:
                            'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Relaxing-Facial-Treatment-Jevelme-Beauty-Lounge.webp',
                        title: 'Relaxing Facial',
                        subtitle:
                            'De-stress and unwind with a soothing facial treatment.',
                        price: '₱299',
                      ),
                      const SizedBox(height: 10),

                      /// Item 2
                      ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Basic-Facial-With-Whitening-Facial-Near-Me-Jevelme-Beauty-Lounge.webp',
                        title: 'Basic Facial w/ Whitening',
                        subtitle:
                        'Brighten your complexion with a cleansing and whitening facial.',
                        price: '₱599',
                      ),
                      const SizedBox(height: 10),

                      /// Item 3
                      ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Dimond-Peel-with-whitening-services-Jevelme-Beauty-Lounge.webp',
                        title: 'Diamond Peel w/ Whitening Facial',
                        subtitle:
                        'Exfoliate and brighten with a diamond peel and whitening treatment.',
                        price: '₱799',
                      ),
                      const SizedBox(height: 10),

                      /// Item 4
                      ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Facial-Care-Services-Jevelme-Beauty-Lounge.webp',
                        title: 'Acne Facial w/ Led Light',
                        subtitle:
                        'Brighten your complexion with a cleansing and whitening facial.',
                        price: '₱599',
                      ),
                      const SizedBox(height: 10),

                      /// Item 5
                      ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Facial-Near-Me-Jevelme-Beauty-Lounge.webp',
                        title: 'Hydra Facial',
                        subtitle:
                        'Achieve radiant skin with hydra facial deep cleanse & hydration.',
                        price: '₱999',
                      ),
                      const SizedBox(height: 10),

                      /// Item 6
                      ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Facial-Care-Center-Services-Jevelme-Beauty-Lounge.webp',
                        title: 'European Facial (w/ RF)',
                        subtitle:
                        'Brighten your complexion with a cleansing and whitening facial.',
                        price: '₱899',
                      ),
                      const SizedBox(height: 10),

                      /// Item 7
                      ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Facial-Care-Center-Imus-Services-Jevelme-Beauty-Lounge.webp',
                        title: 'V-Shape Facial (w/ RF)',
                        subtitle:
                        "Renew skin's vitality, firmness with European facial and RF technology.",
                        price: '₱899',
                      ),
                      const SizedBox(height: 10),

                      /// Item 8
                      ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Facila-Near-Me-Jevelme-Beauty-Lounge.webp',
                        title: 'Dermaplaning Facial',
                        subtitle:
                        'Smooth, refine skin texture with gentle dermaplaning facial treatments.',
                        price: '₱799',
                      ),

                      SizedBox(height: 60),
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
