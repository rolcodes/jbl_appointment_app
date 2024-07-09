import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../models/category_model.dart';


class ServiceCategoryCardListsItem extends StatelessWidget {
  const ServiceCategoryCardListsItem({
    super.key,
    required this.service, required this.onSelectedCategory,
  });

  final Category service;
  final void Function() onSelectedCategory;

  @override
  Widget build(BuildContext context) {
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
          height: 400,
          width: 200,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  service.image,
                  width: 200,
                  height: 170,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
