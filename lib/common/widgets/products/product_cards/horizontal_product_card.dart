import 'package:appointment_app/common/widgets/products/product_cards/product_card_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../features/shop/screens/booking/booking_details.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../custom shapes/containers/TRoundedContainer.dart';

class HorizontalProductCard extends StatelessWidget {
  const HorizontalProductCard(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.price,
      this.alignment});

  final String image, title, subtitle, price;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      borderRadius: BorderRadius.circular(15),
      child: Stack(children: [
        GestureDetector(
          onTap: () => Get.to(() => ProductCardDetailScreen(
            title: title,
            price: price,
            image: image,
            subtitle: subtitle,
          )),
          child: TRoundedContainer(
            width: MediaQuery.of(context).size.width,
            height: 120,
            radius: 15,
            padding: const EdgeInsets.only(right: 10, left: 5, top: 5, bottom: 5),
            child:

                /// Image
                Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (alignment != null)
                  Flexible(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        image,
                        height: 110,
                        width: 110,
                        fit: BoxFit.cover,
                        alignment: alignment!,
                      ),
                    ),
                  ),
                Flexible(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, top: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Title
                        Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .apply(color: TColors.accent, fontSizeDelta: 2),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),

                        /// Subtitle
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            width: 210,
                            child: Text(
                              subtitle,
                              style: Theme.of(context).textTheme.labelMedium,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),

                        /// Price
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              price,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .apply(
                                      color: TColors.accent),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        /// Discount
        Positioned(
          top: 5,
          left: 5,
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: TColors.primary.withOpacity(0.8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)
                )),
            child: Text(
              '10% off',
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .apply(color: Colors.white,fontSizeDelta: -2),
            ),
          ),
        ),

        /// Book Now Button
        Positioned(
          top: 80,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(219, 157, 0, 50),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(TSizes.cardRadiusMd),
                bottomRight: Radius.circular(15),
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
      ]),
    );
  }
}
