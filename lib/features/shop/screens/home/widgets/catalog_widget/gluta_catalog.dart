// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:badges/badges.dart' as badges;
//
// import '../../../../../../common/styles/shadows.dart';
// import '../../../../../../common/widgets/texts/product_price_text.dart';
// import '../../../../../../common/widgets/texts/product_title_text.dart';
// import '../../../../../../utils/constants/colors.dart';
// import '../../../../../../utils/constants/image_strings.dart';
// import '../../../../../../utils/constants/sizes.dart';
// import '../../../../../../views/booking_view/booking_details.dart';
// import '../../../notifications/notifications.dart';
//
// class GlutaCatalog extends StatefulWidget {
//   const GlutaCatalog({super.key});
//
//   @override
//   State<GlutaCatalog> createState() => _GlutaCatalogState();
// }
//
// class _GlutaCatalogState extends State<GlutaCatalog> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: TColors.light,
//       appBar: AppBar(
//         title: Text('Gluta Drips', style: Theme.of(context).textTheme.headlineMedium!.apply(color: const Color.fromRGBO(219, 157, 0, 1))),
//         centerTitle: true,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 10),
//             child: badges.Badge(
//               position: badges.BadgePosition.topEnd(top: -10, end: -12),
//               showBadge: true,
//               ignorePointer: false,
//               onTap: () => Get.to(() => const NotificationScreen()),
//               badgeContent: Text(
//                 '3',
//                 style: Theme.of(context)
//                     .textTheme
//                     .labelSmall!
//                     .apply(color: TColors.white),
//               ),
//               badgeAnimation: const badges.BadgeAnimation.scale(
//                 animationDuration: Duration(seconds: 1),
//                 colorChangeAnimationDuration: Duration(seconds: 1),
//                 loopAnimation: false,
//                 curve: Curves.fastOutSlowIn,
//                 colorChangeAnimationCurve: Curves.easeInCubic,
//               ),
//               badgeStyle: const badges.BadgeStyle(badgeColor: TColors.primary),
//               child: const Icon(
//                 Iconsax.notification,
//                 size: 24,
//                 color: TColors.primary,
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//
//         child: Container(
//           margin: const EdgeInsets.symmetric(horizontal: 25),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /// -- Cover Photo
//               Material(
//                 elevation: 3,
//                 borderRadius: BorderRadius.circular(16),
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 160,
//                   clipBehavior: Clip.hardEdge,
//                   // -> use this if border radius doesn't work
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(16),
//                     image: const DecorationImage(
//                         image: NetworkImage(
//                             'https://scontent.fmnl4-2.fna.fbcdn.net/v/t39.30808-6/439864363_791549869741527_2699704274359287208_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGPalf-Owrpfzc6Mv_uKzP4og63gIt_HamiDreAi38dqWpYIkhoOyIougIVDWjHPdxgJF-VECjiDH8p-zYH8gtQ&_nc_ohc=YMeK6-6gXU4Q7kNvgFpJR9s&_nc_zt=23&_nc_ht=scontent.fmnl4-2.fna&oh=00_AYD6NHmKPzJyefj7c_r5Ydr_QOsY1Go6o1V7lPiT1svwCQ&oe=6647641A'),
//                         fit: BoxFit.cover,
//                         alignment: Alignment(1, 0.27)),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//               /// -- Title
//               Text('Popular Deals', style: Theme.of(context).textTheme.headlineSmall),
//               const SizedBox(height: 10),
//
//               /// -- Products
//
//
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     /// -- Item 1
//                     Container(
//                       decoration: BoxDecoration(
//                           color: Colors.white, borderRadius: BorderRadius.circular(20)),
//                       height: 125,
//                       width: 375,
//                       child: Row(
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                                 color: TColors.lightGrey,
//                                 borderRadius: BorderRadius.circular(10)),
//                             padding: const EdgeInsets.all(5),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(10),
//                               child: Image.asset(
//                                   'assets/images/products/productImage1.jpg',
//                                   fit: BoxFit.cover,
//                                   height: 115,
//                                   width: 115),
//                             ),
//                           ),
//                           SizedBox(
//                             width: MediaQuery.of(context).size.width / 1.72,
//                             child: Padding(
//                               padding: const EdgeInsets.only(top: 12, left: 15),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const TProductTitleText(
//                                       title: 'Relaxing Facial'),
//                                   const SizedBox(height: 5),
//
//                                   Expanded(
//                                       child: Text(
//                                         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
//                                         style: Theme.of(context).textTheme.labelSmall!.apply(color: Colors.grey, fontSizeDelta: -3),
//                                         maxLines: 3,
//                                         overflow: TextOverflow.ellipsis,
//                                       )),
//
//
//                                   /// Price Row
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       /// Price
//                                       const TProductPriceText(price: '299'),
//                                       const SizedBox(width: 40),
//
//                                       /// Book Now Button & Favorite Button
//                                       Container(
//                                         decoration: const BoxDecoration(
//                                           color: Color.fromRGBO(219, 157, 0, 50),
//                                           borderRadius: BorderRadius.only(
//                                             topLeft:
//                                             Radius.circular(TSizes.cardRadiusMd),
//                                             bottomRight: Radius.circular(
//                                                 TSizes.productImageRadius),
//                                           ),
//                                         ),
//                                         child: SizedBox(
//                                           width: TSizes.iconLg * 2.6,
//                                           height: TSizes.iconLg * 1,
//                                           child: TextButton(
//                                             onPressed: () => Get.to(
//                                                   () => BookingPage(
//                                                 service: 'Relaxing Facial',
//                                                 price: '299',
//                                               ),
//                                             ),
//                                             child: Text(
//                                               'Book Now',
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .labelSmall!
//                                                   .apply(color: TColors.white),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(width: 20),
//
//                     /// Item 2
//                     Container(
//                       decoration: BoxDecoration(
//                           color: Colors.white, borderRadius: BorderRadius.circular(20)),
//                       height: 125,
//                       width: 375,
//                       child: Row(
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                                 color: TColors.lightGrey,
//                                 borderRadius: BorderRadius.circular(10)),
//                             padding: const EdgeInsets.all(5),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(10),
//                               child: Image.asset(
//                                   'assets/images/products/productImage1.jpg',
//                                   fit: BoxFit.cover,
//                                   height: 115,
//                                   width: 115),
//                             ),
//                           ),
//                           SizedBox(
//                             width: MediaQuery.of(context).size.width / 1.72,
//                             child: Padding(
//                               padding: const EdgeInsets.only(top: 12, left: 15),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const TProductTitleText(
//                                       title: 'Relaxing Facial'),
//                                   const SizedBox(height: 5),
//
//                                   Expanded(
//                                       child: Text(
//                                         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
//                                         style: Theme.of(context).textTheme.labelSmall!.apply(color: Colors.grey, fontSizeDelta: -3),
//                                         maxLines: 3,
//                                         overflow: TextOverflow.ellipsis,
//                                       )),
//
//
//                                   /// Price Row
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       /// Price
//                                       const TProductPriceText(price: '299'),
//                                       const SizedBox(width: 40),
//
//                                       /// Book Now Button & Favorite Button
//                                       Container(
//                                         decoration: const BoxDecoration(
//                                           color: Color.fromRGBO(219, 157, 0, 50),
//                                           borderRadius: BorderRadius.only(
//                                             topLeft:
//                                             Radius.circular(TSizes.cardRadiusMd),
//                                             bottomRight: Radius.circular(
//                                                 TSizes.productImageRadius),
//                                           ),
//                                         ),
//                                         child: SizedBox(
//                                           width: TSizes.iconLg * 2.6,
//                                           height: TSizes.iconLg * 1,
//                                           child: TextButton(
//                                             onPressed: () => Get.to(
//                                                   () =>  BookingPage(
//                                                 service: 'Relaxing Facial',
//                                                 price: '299',
//                                               ),
//                                             ),
//                                             child: Text(
//                                               'Book Now',
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .labelSmall!
//                                                   .apply(color: TColors.white),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(width: 20),
//
//                     /// Item 2
//                     Container(
//                       decoration: BoxDecoration(
//                           color: Colors.white, borderRadius: BorderRadius.circular(20)),
//                       height: 125,
//                       width: 375,
//                       child: Row(
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                                 color: TColors.lightGrey,
//                                 borderRadius: BorderRadius.circular(10)),
//                             padding: const EdgeInsets.all(5),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(10),
//                               child: Image.asset(
//                                   'assets/images/products/productImage1.jpg',
//                                   fit: BoxFit.cover,
//                                   height: 115,
//                                   width: 115),
//                             ),
//                           ),
//                           SizedBox(
//                             width: MediaQuery.of(context).size.width / 1.72,
//                             child: Padding(
//                               padding: const EdgeInsets.only(top: 12, left: 15),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const TProductTitleText(
//                                       title: 'Relaxing Facial'),
//                                   const SizedBox(height: 5),
//
//                                   Expanded(
//                                       child: Text(
//                                         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
//                                         style: Theme.of(context).textTheme.labelSmall!.apply(color: Colors.grey, fontSizeDelta: -3),
//                                         maxLines: 3,
//                                         overflow: TextOverflow.ellipsis,
//                                       )),
//
//
//                                   /// Price Row
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       /// Price
//                                       const TProductPriceText(price: '299'),
//                                       const SizedBox(width: 40),
//
//                                       /// Book Now Button & Favorite Button
//                                       Container(
//                                         decoration: const BoxDecoration(
//                                           color: Color.fromRGBO(219, 157, 0, 50),
//                                           borderRadius: BorderRadius.only(
//                                             topLeft:
//                                             Radius.circular(TSizes.cardRadiusMd),
//                                             bottomRight: Radius.circular(
//                                                 TSizes.productImageRadius),
//                                           ),
//                                         ),
//                                         child: SizedBox(
//                                           width: TSizes.iconLg * 2.6,
//                                           height: TSizes.iconLg * 1,
//                                           child: TextButton(
//                                             onPressed: () => Get.to(
//                                                   () => BookingPage(
//                                                 service: 'Relaxing Facial',
//                                                 price: '299',
//                                               ),
//                                             ),
//                                             child: Text(
//                                               'Book Now',
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .labelSmall!
//                                                   .apply(color: TColors.white),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(width: 20),
//
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//               /// Row 1
//               Row(
//                 children: [
//                   /// Product 1
//                   Flexible(
//                     fit: FlexFit.tight,
//                     child: Container(
//                       decoration: BoxDecoration(
//                           boxShadow: [TShadowStyle.verticalProductShadow],
//                           borderRadius: BorderRadius.circular(
//                               TSizes.productImageRadius),
//                           color: TColors.white),
//                       child: Column(
//                         children: [
//                           Container(
//                               height: 180,
//                               padding: const EdgeInsets.all(5),
//                               decoration: BoxDecoration(
//                                   color: TColors.light,
//                                   borderRadius: BorderRadius.circular(10)),
//                               child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(10),
//                                   child:
//                                   Image.asset(TImages.productImage1))),
//                           const SizedBox(height: TSizes.spaceBtwItems / 2),
//                           const TProductTitleText(
//                               title: 'Relaxing Facial w/ Mask',
//                               smallSize: true),
//                           const SizedBox(height: TSizes.spaceBtwItems / 2),
//
//                           /// Price Row
//                           Row(
//                             mainAxisAlignment:
//                             MainAxisAlignment.spaceBetween,
//                             children: [
//                               /// Price
//                               const Padding(
//                                 padding: EdgeInsets.only(left: 10),
//                                 child: TProductPriceText(price: '299'),
//                               ),
//
//                               /// Book Now Button & Favorite Button
//                               Container(
//                                 decoration: const BoxDecoration(
//                                   color: Color.fromRGBO(219, 157, 0, 50),
//                                   borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(
//                                         TSizes.cardRadiusMd),
//                                     bottomRight: Radius.circular(
//                                         TSizes.productImageRadius),
//                                   ),
//                                 ),
//                                 child: SizedBox(
//                                   width: TSizes.iconLg * 2.6,
//                                   height: TSizes.iconLg * 1,
//                                   child: TextButton(
//                                     onPressed: () => Get.to(
//                                           () =>  BookingPage(
//                                           service:
//                                           'Relaxing Facial w/ Mask',
//                                           price: '299'),
//                                     ),
//                                     child: Text(
//                                       'Book Now',
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .labelSmall!
//                                           .apply(color: TColors.white),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 20),
//
//                   /// Product 2
//                   Flexible(
//                     fit: FlexFit.tight,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         boxShadow: [TShadowStyle.verticalProductShadow],
//                         borderRadius: BorderRadius.circular(
//                             TSizes.productImageRadius),
//                         color: TColors.white,
//                       ),
//                       child: Column(
//                         children: [
//                           Container(
//                               height: 180,
//                               padding: const EdgeInsets.all(5),
//                               decoration: BoxDecoration(
//                                   color: TColors.light,
//                                   borderRadius: BorderRadius.circular(10)),
//                               child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(10),
//                                   child:
//                                   Image.asset(TImages.productImage2))),
//                           const SizedBox(height: TSizes.spaceBtwItems / 2),
//                           const TProductTitleText(
//                               title: 'Regular Massage', smallSize: true),
//                           const SizedBox(height: TSizes.spaceBtwItems / 2),
//
//                           /// Price Row
//                           Row(
//                             mainAxisAlignment:
//                             MainAxisAlignment.spaceBetween,
//                             children: [
//                               /// Price
//                               const Padding(
//                                 padding: EdgeInsets.only(left: 10),
//                                 child: TProductPriceText(price: '349'),
//                               ),
//
//                               /// Book Now Button & Favorite Button
//                               Container(
//                                 decoration: const BoxDecoration(
//                                   color: Color.fromRGBO(219, 157, 0, 50),
//                                   borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(
//                                         TSizes.cardRadiusMd),
//                                     bottomRight: Radius.circular(
//                                         TSizes.productImageRadius),
//                                   ),
//                                 ),
//                                 child: SizedBox(
//                                   width: TSizes.iconLg * 2.6,
//                                   height: TSizes.iconLg * 1,
//                                   child: TextButton(
//                                     onPressed: () => Get.to(() =>
//                                      BookingPage(
//                                         service: 'Regular Massage',
//                                         price: '349')),
//                                     child: Text(
//                                       'Book Now',
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .labelSmall!
//                                           .apply(color: TColors.white),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//
//               /// Row 2
//               Row(
//                 children: [
//                   /// Product 3
//                   Flexible(
//                     fit: FlexFit.tight,
//                     child: Container(
//                       decoration: BoxDecoration(
//                           boxShadow: [TShadowStyle.verticalProductShadow],
//                           borderRadius: BorderRadius.circular(
//                               TSizes.productImageRadius),
//                           color: TColors.white),
//                       child: Column(
//                         children: [
//                           Container(
//                               height: 180,
//                               padding: const EdgeInsets.all(5),
//                               decoration: BoxDecoration(
//                                   color: TColors.light,
//                                   borderRadius: BorderRadius.circular(10)),
//                               child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(10),
//                                   child:
//                                   Image.asset(TImages.productImage3))),
//                           const SizedBox(height: TSizes.spaceBtwItems / 2),
//                           const TProductTitleText(
//                               title: 'Mesolipo', smallSize: true),
//                           const SizedBox(height: TSizes.spaceBtwItems / 2),
//
//                           /// Price Row
//                           Row(
//                             mainAxisAlignment:
//                             MainAxisAlignment.spaceBetween,
//                             children: [
//                               /// Price
//                               const Padding(
//                                 padding: EdgeInsets.only(left: 10),
//                                 child: TProductPriceText(price: '599'),
//                               ),
//
//                               /// Book Now Button & Favorite Button
//                               Container(
//                                 decoration: const BoxDecoration(
//                                   color: Color.fromRGBO(219, 157, 0, 50),
//                                   borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(
//                                         TSizes.cardRadiusMd),
//                                     bottomRight: Radius.circular(
//                                         TSizes.productImageRadius),
//                                   ),
//                                 ),
//                                 child: SizedBox(
//                                   width: TSizes.iconLg * 2.6,
//                                   height: TSizes.iconLg * 1,
//                                   child: TextButton(
//                                     onPressed: () => Get.to(() =>
//                                      BookingPage(
//                                         service: 'Mesolipo (Tummy)',
//                                         price: '599')),
//                                     child: Text(
//                                       'Book Now',
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .labelSmall!
//                                           .apply(color: TColors.white),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 20),
//
//                   /// Product 4
//                   Flexible(
//                     fit: FlexFit.tight,
//                     child: Container(
//                       decoration: BoxDecoration(
//                           boxShadow: [TShadowStyle.verticalProductShadow],
//                           borderRadius: BorderRadius.circular(
//                               TSizes.productImageRadius),
//                           color: TColors.white),
//                       child: Column(
//                         children: [
//                           Container(
//                               height: 180,
//                               padding: const EdgeInsets.all(5),
//                               decoration: BoxDecoration(
//                                   color: TColors.light,
//                                   borderRadius: BorderRadius.circular(10)),
//                               child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(10),
//                                   child:
//                                   Image.asset(TImages.productImage4))),
//                           const SizedBox(height: TSizes.spaceBtwItems / 2),
//                           const TProductTitleText(
//                               title: 'Eyelash Extensions', smallSize: true),
//                           const SizedBox(height: TSizes.spaceBtwItems / 2),
//
//                           /// Price Row
//                           Row(
//                             mainAxisAlignment:
//                             MainAxisAlignment.spaceBetween,
//                             children: [
//                               /// Price
//                               const Padding(
//                                 padding: EdgeInsets.only(left: 10),
//                                 child: TProductPriceText(price: '249'),
//                               ),
//
//                               /// Book Now Button & Favorite Button
//                               Container(
//                                 decoration: const BoxDecoration(
//                                   color: Color.fromRGBO(219, 157, 0, 50),
//                                   borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(
//                                         TSizes.cardRadiusMd),
//                                     bottomRight: Radius.circular(
//                                         TSizes.productImageRadius),
//                                   ),
//                                 ),
//                                 child: SizedBox(
//                                   width: TSizes.iconLg * 2.6,
//                                   height: TSizes.iconLg * 1,
//                                   child: TextButton(
//                                     onPressed: () => Get.to(() =>
//                                      BookingPage(
//                                         service: 'Eyelash Extensions',
//                                         price: '249')),
//                                     child: Text(
//                                       'Book Now',
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .labelSmall!
//                                           .apply(color: TColors.white),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
