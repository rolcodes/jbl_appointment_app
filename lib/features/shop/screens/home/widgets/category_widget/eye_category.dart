import 'package:appointment_app/features/shop/screens/home/widgets/category_widget/widget/product_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utils/constants/colors.dart';

class EyeCategory extends StatelessWidget {
  const EyeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.secondary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 50),
                    ),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      alignment: AlignmentDirectional.center,
                      image: NetworkImage(
                          'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Eyelash-Extension-Near-Me-Jevelme-Beauty-Lounge.webp'),
                    ),
                  ),
                ),
                /// Back button
                Positioned(
                  top: 60,
                  left: 20,
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: TColors.primary),
                      child: IconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(
                            Icons.arrow_circle_left_rounded,
                            color: Colors.white,
                            size: 30,
                          )),
                    ),
                  ),
                ),
              ],
            ),

            /// -- Content
            Container(
              color: TColors.secondary,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Category Name
                  const SizedBox(height: 10),

                  /// Subtitle & Logo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Self-Care Starts \nwith Lashes!",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: TColors.accent),
                      ),

                      Image.asset('assets/logos/jbl-logo-removebg-preview.png', width: 120,),
                    ],
                  ),
                  const SizedBox(height: 15),

                  /// Description
                  Text(
                    "Achieve gorgeous, curled lashes without mascara! JBL provides eyelash perming, eyelash extension, and eyelash extension removal services. Fast, safe, and long-lasting results.",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(heightDelta: 0.4), textAlign: TextAlign.center,),
                  const SizedBox(height: 10),

                  /// Title
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'Eye Services',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: TColors.primary),
                    ),
                  ),
                  const SizedBox(height: 10),

                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Item 1
                      ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Eyelash-Perming-Near-Me-Jevelme-Beauty-Lounge.webp',
                        title: 'Eyelash Perming',
                        subtitle:
                        'Transform with our mesmerizing eyelash perming.',
                        price: '₱399',
                      ),
                      SizedBox(height: 10),

                      /// Item 2
                      ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Eyelash-Extension-Jevelme-Beauty-Lounge.webp',
                        title: 'Eyelash extension',
                        price: '₱499', subtitle:
                        'embrace luxurious, fluttery extensions.',
                      ),
                      SizedBox(height: 10),

                      /// Item 3
                      ProductListTile(
                        image:
                        'https://jblnew.keywcomm.com/wp-content/uploads/2024/05/Eyelash-Extension-Removal-Jevelme-Beauty-Lounge.webp',
                        title: 'Eyelash Removal',
                        subtitle:
                        'Refresh with a gentle eyelash removal treatment.',
                        price: '₱249',
                      ),


                      SizedBox(height: 60),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
