import 'package:appointment_app/common/widgets/products/product_cards/widget/rating_indicator.dart';
import 'package:appointment_app/common/widgets/products/product_cards/widget/rating_progress_indicator.dart';
import 'package:appointment_app/common/widgets/products/product_cards/widget/user_review_card.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../features/shop/screens/booking/booking_details.dart';

class ProductCardDetailScreen extends StatefulWidget {
  const ProductCardDetailScreen(
      {super.key,
      required this.title,
      required this.price,
      required this.image,
      required this.subtitle});

  final String title;
  final String price;
  final String image;
  final String subtitle;

  @override
  State<ProductCardDetailScreen> createState() =>
      _ProductCardDetailScreenState();
}

class _ProductCardDetailScreenState extends State<ProductCardDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.secondary,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 1.45,
              ),

              /// Image
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 430,
                child: Image.network(
                  widget.image,
                  fit: BoxFit.cover,
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

              /// Favorite Button
              Positioned(
                top: 60,
                right: 20,
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
                        onPressed: () {},
                        icon: const Icon(
                          Iconsax.heart5,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),

              /// Content
              Positioned(
                top: 370,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: TColors.secondary,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: TColors.primary.withOpacity(0.5),
                          offset: const Offset(1, 0),
                          spreadRadius: 2,
                          blurRadius: 20,
                        )
                      ]),
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// -- Title
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /// Title
                              Expanded(
                                flex: 4,
                                child: Text(
                                  widget.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .apply(
                                          fontSizeDelta: 6,
                                          color: TColors.accent,
                                  heightDelta: 0.2),
                                ),
                              ),

                              const SizedBox(width: 20),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Image.asset(
                                'assets/logos/jbl-logo-removebg-preview.png',
                                width: 100,
                              ),
                              SizedBox(width: 5),
                              const TRatingBarIndicator(rating: 4.65),
                              Expanded(
                                child: Text(
                                  textAlign: TextAlign.end,
                                  widget.price,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .apply(
                                      fontSizeDelta: 10,
                                      color: TColors.primary),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),

                      Text(
                        '${widget.subtitle} Get the glow you deserve with Jevelme’s exclusive deals. We got you!',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: TColors.accent, heightDelta: 0.4),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),

                      /// -- Location
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Location',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .apply(color: TColors.accent)),
                          TextButton(
                            onPressed: () => launchUrlString(
                                'https://www.google.com/maps/place/Jevelme+Beauty+Lounge/@14.4056908,120.9226934,16.11z/data=!4m6!3m5!1s0x3397d3330723aecf:0xbf0eb7be76f7d82b!8m2!3d14.4053546!4d120.9249528!16s%2Fg%2F11vjy0qhg3?hl=en-US&entry=ttu'),
                            child: Text('View on Google Maps',
                                style: Theme.of(context).textTheme.labelMedium),
                          ),
                        ],
                      ),
                      Material(
                        elevation: 3,
                        borderRadius: BorderRadius.circular(20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/location/Screenshot 2024-05-30 at 11.39.24 PM.png',
                            height: 140,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: TColors.primary,
                            size: 40,
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 300,
                            child: Text(
                                'Leonas Bldg. 2nd floor 162 Bucandala - Alapan Road, Bucandala IV Imus, Cavite ',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .apply(
                                        color: TColors.accent,
                                        fontSizeDelta: -2),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      /// -- Reviews
                      Text('Reviews',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .apply(color: TColors.accent)),
                      const SizedBox(height: 5),

                      const TOverallProductRating(rating: 4.65),
                      const TRatingBarIndicator(rating: 4.65),

                      const SizedBox(height: 20),

                      const UserReviewCard(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 25, left: 25, right: 25, top: 5),
        child: ElevatedButton(
            onPressed: () => Get.to(
                  () => BookingPage(
                    service: widget.title,
                    price: widget.price,
                    imageNetwork: widget.image,
                    subtitle: widget.subtitle,
                  ),
                ),
            child: const Text('Book Now')),
      ),
    );
  }
}
