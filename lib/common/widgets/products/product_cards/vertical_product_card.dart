import 'package:appointment_app/common/widgets/products/product_cards/product_card_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../features/shop/screens/booking/booking_details.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../styles/shadows.dart';

class VerticalProductCard extends StatelessWidget {
  const VerticalProductCard(
      {super.key,
      required this.image,
      required this.title,
      required this.price,
      required this.alignment,
      required this.subtitle});

  final String image, title, subtitle, price;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(16),
      child: GestureDetector(
        onTap: () => Get.to(() => ProductCardDetailScreen(
              title: title,
              price: price,
              image: image,
              subtitle: subtitle,
            )),
        child: Stack(
          children: [
            Container(
              height: 258,
              decoration: BoxDecoration(
                  boxShadow: [TShadowStyle.verticalProductShadow],
                  borderRadius:
                      BorderRadius.circular(TSizes.productImageRadius),
                  color: TColors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Container(
                        height: 180,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: TColors.light,
                            borderRadius: BorderRadius.circular(16)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              image,
                              width: 170,
                              height: 170,
                              fit: BoxFit.cover,
                              alignment: alignment!,
                            ))),
                  const SizedBox(height: 5),

                  /// Title
                  SizedBox(
                    width: 180,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .apply(fontSizeDelta: -1, color: TColors.accent),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),

                  /// Subtitle
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                    child: Text(
                      subtitle,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(fontSizeDelta: -12, color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),

                  /// Price Row
                  Padding(
                    padding: EdgeInsets.only(left: 12, bottom: 6),
                    child: Text(
                      price,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .apply(color: TColors.accent, fontSizeDelta: 2),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 218,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(219, 157, 0, 50),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(TSizes.cardRadiusMd),
                    bottomRight: Radius.circular(TSizes.productImageRadius),
                  ),
                ),
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: IconButton(
                    onPressed: () => Get.to(
                      () => BookingPage(
                        service: title,
                        price: price,
                        imageNetwork: image,
                        subtitle: subtitle,
                      ),
                    ),
                    icon: const Icon(
                      Icons.bookmark_add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
