import 'package:appointment_app/features/shop/screens/home/widgets/category_widget/eye_category.dart';
import 'package:appointment_app/features/shop/screens/home/widgets/category_widget/slimming_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import 'category_widget/facial_category.dart';
import 'category_widget/gluta_category.dart';
import 'category_widget/massage_category.dart';

class HomeCategoriesBox extends StatelessWidget {
  const HomeCategoriesBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /// -- Facial
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.5),
              child: Column(
                children: [
                  /// Image
                  GestureDetector(
                    onTap: () => Get.to(() => const FacialCategory()),
                    child: Container(
                      width: 56,
                      height: 56,
                      padding: const EdgeInsets.all(TSizes.sm),
                      decoration: BoxDecoration(
                        color: TColors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset(
                          'assets/icons/categories/face-pack-person-svgrepo-com.png'),
                    ),
                  ),

                  /// Text
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  SizedBox(
                    width: 55,
                    child: Text(
                      'Facial Services',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            /// -- Gluta
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                children: [
                  /// Image
                  GestureDetector(
                    onTap: () => Get.to(() => const GlutaCategory()),
                    child: Container(
                      width: 56,
                      height: 56,
                      padding: const EdgeInsets.all(TSizes.sm),
                      decoration: BoxDecoration(
                        color: TColors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset(
                          'assets/icons/categories/infusion-svgrepo-com.png'),
                    ),
                  ),

                  /// Text
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  SizedBox(
                    width: 55,
                    child: Text(
                      'Gluta Drips',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),



            /// -- Massage
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.5),
              child: Column(
                children: [
                  /// Image
                  GestureDetector(
                    onTap: () => Get.to(() => const MassageCategory()),
                    child: Container(
                      width: 56,
                      height: 56,
                      padding: const EdgeInsets.all(TSizes.sm),
                      decoration: BoxDecoration(
                        color: TColors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset(
                          'assets/icons/categories/massage-spa-svgrepo-com.png'),
                    ),
                  ),

                  /// Text
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  SizedBox(
                    width: 55,
                    child: Text(
                      'Massage Services',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            /// -- Eye Services
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.5),
              child: Column(
                children: [
                  /// Image
                  GestureDetector(
                    onTap: () => Get.to(() => const EyeCategory()),
                    child: Container(
                      width: 56,
                      height: 56,
                      padding: const EdgeInsets.all(TSizes.sm),
                      decoration: BoxDecoration(
                        color: TColors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset(
                          'assets/icons/categories/eyelashedited-Photoroom.png'),
                    ),
                  ),

                  /// Text
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  SizedBox(
                    width: 55,
                    child: Text(
                      'Eye Services',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            /// -- Slimming Services
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.5),
              child: Column(
                children: [
                  /// Image
                  GestureDetector(
                    onTap: () => Get.to(() => const SlimmingCategory()),
                    child: Container(
                      width: 56,
                      height: 56,
                      padding: const EdgeInsets.all(TSizes.sm),
                      decoration: BoxDecoration(
                        color: TColors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset(
                          'assets/icons/categories/body-shape-svgrepo-com.png'),
                    ),
                  ),

                  /// Text
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  SizedBox(
                    width: 55,
                    child: Text(
                      'Slimming Services',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            /// -- Waxing Services
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.5),
              child: Column(
                children: [
                  /// Image
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      width: 56,
                      height: 56,
                      padding: const EdgeInsets.all(TSizes.sm),
                      decoration: BoxDecoration(
                        color: TColors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset(
                          'assets/icons/categories/ointment-svgrepo-com.png'),
                    ),
                  ),

                  /// Text
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  SizedBox(
                    width: 55,
                    child: Text(
                      'Waxing Services',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            /// -- Carbon Laser Treatment
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.5),
              child: Column(
                children: [
                  /// Image
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      width: 56,
                      height: 56,
                      padding: const EdgeInsets.all(TSizes.sm),
                      decoration: BoxDecoration(
                        color: TColors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset(
                          'assets/icons/categories/woman-using-hair-dryer-svgrepo-com.png'),
                    ),
                  ),

                  /// Text
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  SizedBox(
                    width: 55,
                    child: Text(
                      'Carbon Laser Treatment',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            /// -- Laser Hair Removal
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.5),
              child: Column(
                children: [
                  /// Image
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      width: 56,
                      height: 56,
                      padding: const EdgeInsets.all(TSizes.sm),
                      decoration: BoxDecoration(
                        color: TColors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset(
                        'assets/icons/categories/blaster-gun-svgrepo-com.png',
                      ),
                    ),
                  ),

                  /// Text
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  SizedBox(
                    width: 55,
                    child: Text(
                      'Laser Hair Removal',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            /// -- Other Services
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.5),
              child: Column(
                children: [
                  /// Image
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      width: 56,
                      height: 56,
                      padding: const EdgeInsets.all(TSizes.sm),
                      decoration: BoxDecoration(
                        color: TColors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset(
                        'assets/icons/categories/woman-with-beautiful-skin-svgrepo-com.png',
                      ),
                    ),
                  ),

                  /// Text
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  SizedBox(
                    width: 55,
                    child: Text(
                      'Other Services',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
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
