import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../models/category_model.dart';

class ServiceGridItem extends StatelessWidget {
  const ServiceGridItem({
    super.key,
    required this.service,
    required this.onSelectedCategory,
  });

  final Category service;
  final void Function() onSelectedCategory;

  @override
  Widget build(BuildContext context) {
    /// -- Widget for Categories => guest_service_category.dart
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onSelectedCategory,
        splashColor: Colors.black,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: TColors.lightGrey),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  service.image,
                  width: 300,
                  height: 140,
                  fit: BoxFit.cover,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
