// import 'package:appointment_app/features/shop/model/models.dart';
// import 'package:appointment_app/features/shop/screens/home/widgets/category_tags.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../utils/constants/colors.dart';
// import '../../../../../utils/constants/sizes.dart';
// import '../../../../../views/booking_view/booking_details.dart';
//
// class CategoryInformation extends StatelessWidget {
//   final Product product;
//
//   const CategoryInformation({super.key, required this.product});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: TColors.white,
//       padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           /// -- Category Name
//           Text(product.name,
//               style: Theme.of(context)
//                   .textTheme
//                   .headlineMedium!
//                   .apply(color: Colors.orange)),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   /// -- Product Items
//                   CategoryTags(product: product),
//                   const SizedBox(height: 5),
//
//                   /// Tags and Location
//                   Row(
//                     children: [
//                       const Icon(Icons.location_on_outlined, size: 15),
//                       const SizedBox(width: 4),
//                       Text(
//                         product.location,
//                         style: Theme.of(context).textTheme.labelLarge,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Container(
//                 height: 60,
//                 width: 115,
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(
//                       'assets/logos/jbl-logo-removebg-preview.png',
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 5),
//           Text(
//               'Transform your skin with our exclusive Gluta Push and Drip services! Experience the ultimate in skin care luxury with our Perfect White Skin Push, Sexy White Drip, Melasma Drip, and more.',
//               style: Theme.of(context)
//                   .textTheme
//                   .labelLarge!
//                   .apply(fontSizeDelta: -1)),
//           const SizedBox(height: 10),
//
//           ListView.builder(
//             padding: EdgeInsets.zero,
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: product.tags.length,
//             itemBuilder: (context, index) {
//               return _buildMenuItems(product, context, index);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// Widget _buildMenuItems(Product product, BuildContext context, int index) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Padding(
//         padding: const EdgeInsets.symmetric(vertical: 5),
//         child: Text(
//           product.tags[index],
//           style: Theme.of(context)
//               .textTheme
//               .headlineSmall!
//               .apply(color: Colors.orange),
//         ),
//       ),
//       Column(
//         children: product.productItems
//             .where((productItem) => productItem.category == product.tags[index])
//             .map(
//               (productItem) => Column(
//                 children: [
//                   Container(
//                     child: ListTile(
//                       dense: true,
//                       contentPadding: EdgeInsets.zero,
//                       title: Text(productItem.name,
//                           style: Theme.of(context).textTheme.titleMedium),
//                       subtitle: Text(productItem.description),
//                       trailing: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             '₱${productItem.price}',
//                             style: Theme.of(context).textTheme.labelLarge,
//                           ),
//                           const SizedBox(width: 15),
//                           Container(
//                             decoration: const BoxDecoration(
//                               color: Colors.orangeAccent,
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(TSizes.cardRadiusMd),
//                                 bottomRight:
//                                     Radius.circular(TSizes.productImageRadius),
//                               ),
//                             ),
//                             child: SizedBox(
//                               width: 82,
//                               height: 35,
//                               child: TextButton(
//                                 onPressed: () => Get.to(
//                                   () => BookingPage(
//                                     service: 'Relaxing Facial w/ Mask',
//                                     price: '299',
//                                   ),
//                                 ),
//                                 child: Text(
//                                   'Book Now',
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .labelSmall!
//                                       .apply(color: TColors.white),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//
//                 ],
//               ),
//             )
//             .toList(),
//       ),
//     ],
//   );
// }
