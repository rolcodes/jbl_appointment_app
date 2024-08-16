import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../features/shop/controllers/home_controller.dart';
import '../../../../utils/device/device_utility.dart';

class NewPromoSlider extends StatelessWidget {
  const NewPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final isMobileSmall = TDeviceUtils.getScreenWidth(context) <= 393;

    return Column(
      children: [
        Stack(
          children: [
            /// -- Sliders
            CarouselSlider(
              options: CarouselOptions(
                  clipBehavior: Clip.antiAlias,
                  height: isMobileSmall ? 222 : 235,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 4),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  viewportFraction: 1,
                  onPageChanged: (index, _) =>
                      controller.updatePageIndicator(index)),
              items: banners
                  .map((url) => TRoundedImage(
                        borderRadius: 20,
                        isNetworkImage: false,
                        imageUrl: url,
                        fit: BoxFit.cover,
                        widthImage: 500,
                      ))
                  .toList(),
            ),

            /// -- Indicators
            Positioned(
              top: isMobileSmall ? 188 : 210,
              child: Obx(
                () => SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int i = 0; i < banners.length; i++)
                          TCircularContainer(
                            width: 15,
                            height: 4,
                            margin: const EdgeInsets.only(right: 10),
                            backgroundColor:
                                controller.carouselCurrentIndex.value == i
                                    ? const Color.fromRGBO(219, 157, 0, 100)
                                    : TColors.white,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
