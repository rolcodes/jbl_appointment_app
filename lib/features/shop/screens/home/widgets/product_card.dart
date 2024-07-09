import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../model/product_model.dart';
import 'category_tags.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          /// Image Container
          Stack(
            children: [
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.14,
                  height: 171,
                  clipBehavior: Clip.hardEdge,
                  // -> use this if border radius doesn't work
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        image: NetworkImage(product.imageUrl),
                        fit: BoxFit.cover),
                  ),
                ),
              ),

              /// Discount tag
              Positioned(
                top: 14,
                left: 14,
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    width: 60,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '${product.discount}% off',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .apply(color: Colors.orange, fontSizeDelta: -2),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),

          /// -- Name, tags, location
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Name lists from data models
              Text(product.name,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .apply(fontSizeDelta: -2)),
              // Text(
              //   '${product.tags}',
              //   style: Theme.of(context).textTheme.labelSmall,
              // ),
              /// tags
              CategoryTags(product: product),

              /// -- Location
              Row(
                children: [
                  const Icon(Icons.location_on_outlined, size: 15),
                  const SizedBox(width: 4),
                  Text(
                    product.location,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
              const SizedBox(height: TSizes.defaultSpace / 2),
            ],
          )
        ],
      ),
    );
  }
}
