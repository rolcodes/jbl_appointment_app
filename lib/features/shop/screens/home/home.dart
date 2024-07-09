import 'package:appointment_app/features/shop/screens/home/widgets/home_categories_box.dart';
import 'package:appointment_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:appointment_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:appointment_app/features/shop/screens/home/widgets/view_all.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/custom shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/products/product_cards/vertical_product_card.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.secondary,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// Appbar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwItems),

                  /// Searchbar
                  // TSearchContainer(text: 'Search'),
                  // SizedBox(height: TSizes.spaceBtwItems),

                  /// Categories
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        /// Heading
                        // TSectionHeading(
                        //   title: 'Popular Services',
                        //   showActionButton: false,
                        //   textColor: Colors.white,
                        // ),
                        // SizedBox(height: TSizes.spaceBtwItems),

                        /// Categories
                        //THomeCategories(),
                        HomeCategoriesBox(),
                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// Body
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// Headline
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: TColors.softGrey,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Aesthetic Clinic \nin Imus, Cavite",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .apply(fontSizeDelta: 1, letterSpacingDelta: 2, color: TColors.accent),
                          textAlign: TextAlign.start,
                        ),
                        Image.asset(
                          'assets/logos/jbl-logo-removebg-preview.png',
                          width: 150,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),


                  /// Promo Slider
                  const TPromoSlider(banners: [
                    TImages.promoBanner1,
                    TImages.promoBanner2,
                    TImages.promoBanner3,
                    TImages.promoBanner4,
                    TImages.promoBanner5,
                    TImages.promoBanner6,
                    TImages.promoBanner7,
                    TImages.promoBanner8,
                    TImages.promoBanner9,
                  ]),
                  const SizedBox(height: 5),



                  /// Heading
                  TSectionHeading(
                    title: 'Best Deals',
                    textColor: TColors.accent,
                    onPressed: () => Get.to(() => const ViewAll()),
                  ),
                  const SizedBox(height: 8),

                  /// -- Row 1
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
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Eyelash-Perming-Near-Me-Jevelme-Beauty-Lounge.webp',
                        title: 'Eyelash Perming',
                        subtitle:
                        'Transform with our mesmerizing eyelash perming.',
                        price: '₱399',
                        alignment: Alignment(0, -0.8),
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
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Perfect-Skin-Jevelme-Beauty-Lounge.webp',
                        title: 'Perfect White Skin Push',
                        subtitle:
                        'Illuminate with our whitening infusion therapy.',
                        price: '₱499',
                        alignment: Alignment(0, 0.5),
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
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Head-Massage-Near-Me-Jevelme-Beauty-Lounge.webp',
                        title: 'Head Massage',
                        price: '₱149',
                        alignment: Alignment.center,
                        subtitle: 'Soothe headaches and improve scalp circulation.',
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
                ],
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
