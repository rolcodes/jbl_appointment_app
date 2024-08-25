import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../models/category_model.dart';

class ServiceCategoryCardListsItem extends StatelessWidget {
  const ServiceCategoryCardListsItem({
    super.key,
    required this.service,
    required this.onSelectedCategory,
  });

  final Category service;
  final void Function() onSelectedCategory;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      color: TColors.lightGrey,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onSelectedCategory,
        splashColor: TColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent),
          width: 250,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  service.image,
                  width: 250,
                  height: 150,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext
                  context,
                      Widget child,
                      ImageChunkEvent?
                      loadingProgress) {
                    if (loadingProgress ==
                        null) return child;
                    return SizedBox(
                      width: 300,
                      height: 140,
                      child: Center(
                        child:
                        CircularProgressIndicator(
                          color: TColors
                              .primary,
                          value: loadingProgress
                              .expectedTotalBytes !=
                              null
                              ? loadingProgress
                              .cumulativeBytesLoaded /
                              loadingProgress
                                  .expectedTotalBytes!
                              : null,
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context,
                      exception,
                      stackTrace) {
                    return Image.asset(
                      'assets/images/content/no-image-found.jpg',
                      fit: BoxFit.cover,
                      width: 300,
                      height: 140,
                    );
                  },
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    service.title,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
