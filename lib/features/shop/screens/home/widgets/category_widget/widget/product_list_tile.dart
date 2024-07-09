import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../common/widgets/products/product_cards/product_card_detail.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../booking/booking_details.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.price});

  final String image, title, subtitle, price;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap:  () => Get.to(() => ProductCardDetailScreen(
        title: title,
        price: price,
        image: image,
        subtitle: subtitle,
      )),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(
          image,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
      dense: true,
      contentPadding: EdgeInsets.zero,
      title: Text(title,
          style: Theme.of(context).textTheme.titleMedium!.apply(color: TColors.accent)),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          color: TColors.darkGrey,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            price,
            style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.accent),
          ),
          const SizedBox(width: 10),
          Container(
            decoration: const BoxDecoration(
              color: TColors.primary,
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
        ],
      ),
    );
  }
}
