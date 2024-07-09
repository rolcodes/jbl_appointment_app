import 'package:flutter/material.dart';

import '../../../model/product_model.dart';

class CategoryTags extends StatelessWidget {
  const CategoryTags({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: product.tags
            .map(
              (tag) => product.tags.indexOf(tag) ==
              product.tags.length - 1
              ? Text(tag,
              style: Theme.of(context).textTheme.labelLarge)
              : Text('$tag, ',
              style: Theme.of(context).textTheme.labelLarge),
        )
            .toList());
  }
}
