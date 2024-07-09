import 'package:appointment_app/features/shop/screens/catalog/widgets/facial_tab/widget/rounded_image_string.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../controllers/home_controller.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Column(
      children: [
        /// -- Sliders
        CarouselSlider(
          options: CarouselOptions(
            clipBehavior: Clip.antiAlias,
            enlargeCenterPage: true,
              height: 190,
              aspectRatio: 1/1,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              autoPlayCurve: Curves.fastOutSlowIn,
              viewportFraction: 0.5,
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index)),
          items: banners
              .map((url) => RoundedImageString(
                    imageUrl: url,
                  ))
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        /// -- Indicators
        // Center(
        //   child: Obx(
        //     () => Row(
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        //         for (int i = 0; i < banners.length; i++)
        //           TCircularContainer(
        //             width: 15,
        //             height: 4,
        //             margin: const EdgeInsets.only(right: 10),
        //             backgroundColor: controller.carouselCurrentIndex.value == i
        //                 ? const Color.fromRGBO(219, 157, 0, 100)
        //                 : TColors.grey,
        //           ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
