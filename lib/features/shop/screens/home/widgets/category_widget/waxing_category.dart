// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
//
// import '../../../../../../utils/constants/colors.dart';
// import '../../../../../../utils/constants/sizes.dart';
// import '../../../../../../views/booking_view/booking_details.dart';
//
// class WaxingCategory extends StatelessWidget {
//   const WaxingCategory({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   height: 250,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.vertical(
//                       bottom: Radius.elliptical(
//                           MediaQuery.of(context).size.width, 50),
//                     ),
//                     image: const DecorationImage(
//                       fit: BoxFit.cover,
//                       alignment: AlignmentDirectional.center,
//                       image: NetworkImage(
//                           'https://scontent.fmnl4-1.fna.fbcdn.net/v/t39.30808-6/440361532_795158412714006_802398828528312565_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFjyU7cLHtyNWh51IQQz0E24JIHIyWeQkzgkgcjJZ5CTGHlywTM4F1owD5hGicZSe2vZhNjpZEPVtv1XPzoenMa&_nc_ohc=3Yl1FL_vCF8Q7kNvgFuVyJe&_nc_zt=23&_nc_ht=scontent.fmnl4-1.fna&oh=00_AYBXVlTSot5Cq7ZW1BwrEzon8FAsL5dUUZ4uwWhwxWCDIg&oe=66489373'),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: 60,
//                   left: 365,
//                   child: Container(
//                     height: 45,
//                     width: 45,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(100)),
//                     child: Stack(children: [
//                       IconButton(
//                         onPressed: () {},
//                         icon: const Icon(
//                           Iconsax.heart5,
//                           color: Colors.orangeAccent,
//                         ),
//                       ),
//                       Positioned(
//                         right: 1,
//                         top: 4,
//                         child: Container(
//                           width: 17,
//                           height: 17,
//                           decoration: BoxDecoration(
//                             color: Colors.yellowAccent,
//                             borderRadius: BorderRadius.circular(100),
//                           ),
//                           child: Center(
//                             child: Text(
//                               '2',
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .labelSmall!
//                                   .apply(color: Colors.orange),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ]),
//                   ),
//                 ),
//                 Positioned(
//                   top: 60,
//                   right: 365,
//                   child: Container(
//                     height: 45,
//                     width: 45,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(100)),
//                     child: IconButton(
//                       onPressed: () => Get.back(),
//                       icon: const Icon(
//                         Icons.arrow_back,
//                         color: Colors.orangeAccent,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//
//             /// -- Content
//             Container(
//               color: TColors.white,
//               padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   /// -- Category Name
//                   Text('Waxing Services',
//                       style: Theme.of(context)
//                           .textTheme
//                           .headlineMedium!
//                           .apply(color: Colors.orange)),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       /// Tags and Location
//                       Row(
//                         children: [
//                           const Icon(Icons.location_on_outlined, size: 20),
//                           const SizedBox(width: 8),
//                           Text(
//                             'Leonas Bldg. 2nd floor 162 Bucandala –\nAlapan Road, Bucandala IV Imus, Cavite',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .labelLarge!
//                                 .apply(fontSizeDelta: -2),
//                             maxLines: 3,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ],
//                       ),
//                       Container(
//                         height: 60,
//                         width: 115,
//                         decoration: const BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage(
//                               'assets/logos/jbl-logo-removebg-preview.png',
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 5),
//
//                   /// Description
//                   Text(
//                       'Say goodbye to unwanted fuzz and embrace the luxury of our tailored waxing sessions. Our specialists cater to your unique preferences with precision and care. ',
//                       style: Theme.of(context)
//                           .textTheme
//                           .labelLarge!
//                           .apply(fontSizeDelta: -1, color: TColors.darkGrey)),
//                   const SizedBox(height: 10),
//
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 5),
//                     child: Text(
//                       'Waxing Hair Removal',
//                       style: Theme.of(context)
//                           .textTheme
//                           .headlineSmall!
//                           .apply(color: Colors.orange),
//                     ),
//                   ),
//                   Column(
//                     children: [
//                       /// Item 1
//                       ListTile(
//                         dense: true,
//                         contentPadding: EdgeInsets.zero,
//                         title: Text('Upper Lip',
//                             style: Theme.of(context).textTheme.titleMedium),
//                         subtitle: const Text(
//                           'Silky smooth perfection awaits!',
//                           style: TextStyle(
//                             color: TColors.darkGrey,
//                           ),
//                         ),
//                         trailing: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               '₱399',
//                               style: Theme.of(context).textTheme.labelLarge,
//                             ),
//                             const SizedBox(width: 15),
//                             Container(
//                               decoration: const BoxDecoration(
//                                 color: Colors.orangeAccent,
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(TSizes.cardRadiusMd),
//                                   bottomRight: Radius.circular(
//                                       TSizes.productImageRadius),
//                                 ),
//                               ),
//                               child: SizedBox(
//                                 width: 82,
//                                 height: 35,
//                                 child: TextButton(
//                                   onPressed: () => Get.to(
//                                     () =>  BookingPage(
//                                       service: 'Upper Lip',
//                                       price: '399',
//                                     ),
//                                   ),
//                                   child: Text(
//                                     'Book Now',
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .labelSmall!
//                                         .apply(color: TColors.white),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       /// item 2
//                       ListTile(
//                         dense: true,
//                         contentPadding: EdgeInsets.zero,
//                         title: Text('Underarms',
//                             style: Theme.of(context).textTheme.titleMedium),
//                         subtitle: const Text(
//                           'Unveil confidence with flawless underarms.',
//                           style: TextStyle(
//                             color: TColors.darkGrey,
//                           ),
//                         ),
//                         trailing: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               '₱299',
//                               style: Theme.of(context).textTheme.labelLarge,
//                             ),
//                             const SizedBox(width: 15),
//                             Container(
//                               decoration: const BoxDecoration(
//                                 color: Colors.orangeAccent,
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(TSizes.cardRadiusMd),
//                                   bottomRight: Radius.circular(
//                                       TSizes.productImageRadius),
//                                 ),
//                               ),
//                               child: SizedBox(
//                                 width: 82,
//                                 height: 35,
//                                 child: TextButton(
//                                   onPressed: () => Get.to(
//                                     () =>  BookingPage(
//                                       service: 'Underarms',
//                                       price: '299',
//                                     ),
//                                   ),
//                                   child: Text(
//                                     'Book Now',
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .labelSmall!
//                                         .apply(color: TColors.white),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       /// Item 3
//                       ListTile(
//                         dense: true,
//                         contentPadding: EdgeInsets.zero,
//                         title: Text('Half Arms',
//                             style: Theme.of(context).textTheme.titleMedium),
//                         subtitle: const Text(
//                           'Unveil soft, hair-free arms effortlessly.',
//                           style: TextStyle(
//                             color: TColors.darkGrey,
//                           ),
//                         ),
//                         trailing: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               '₱349',
//                               style: Theme.of(context).textTheme.labelLarge,
//                             ),
//                             const SizedBox(width: 15),
//                             Container(
//                               decoration: const BoxDecoration(
//                                 color: Colors.orangeAccent,
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(TSizes.cardRadiusMd),
//                                   bottomRight: Radius.circular(
//                                       TSizes.productImageRadius),
//                                 ),
//                               ),
//                               child: SizedBox(
//                                 width: 82,
//                                 height: 35,
//                                 child: TextButton(
//                                   onPressed: () => Get.to(
//                                     () =>  BookingPage(
//                                       service: 'Half Arms',
//                                       price: '349',
//                                     ),
//                                   ),
//                                   child: Text(
//                                     'Book Now',
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .labelSmall!
//                                         .apply(color: TColors.white),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       /// Item 4
//                       ListTile(
//                         dense: true,
//                         contentPadding: EdgeInsets.zero,
//                         title: Text('Full Arms',
//                             style: Theme.of(context).textTheme.titleMedium),
//                         subtitle: const Text(
//                           'Unveil soft, hair-free arms effortlessly.',
//                           style: TextStyle(
//                             color: TColors.darkGrey,
//                           ),
//                         ),
//                         trailing: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               '₱599',
//                               style: Theme.of(context).textTheme.labelLarge,
//                             ),
//                             const SizedBox(width: 15),
//                             Container(
//                               decoration: const BoxDecoration(
//                                 color: Colors.orangeAccent,
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(TSizes.cardRadiusMd),
//                                   bottomRight: Radius.circular(
//                                       TSizes.productImageRadius),
//                                 ),
//                               ),
//                               child: SizedBox(
//                                 width: 82,
//                                 height: 35,
//                                 child: TextButton(
//                                   onPressed: () => Get.to(
//                                     () =>  BookingPage(
//                                       service: 'Full Arms',
//                                       price: '599',
//                                     ),
//                                   ),
//                                   child: Text(
//                                     'Book Now',
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .labelSmall!
//                                         .apply(color: TColors.white),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       /// Item 5
//                       ListTile(
//                         dense: true,
//                         contentPadding: EdgeInsets.zero,
//                         title: Text('Half Legs',
//                             style: Theme.of(context).textTheme.titleMedium),
//                         subtitle: const Text(
//                           'Chic, streamlined, irresistible glow.',
//                           style: TextStyle(
//                             color: TColors.darkGrey,
//                           ),
//                         ),
//                         trailing: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               '₱499',
//                               style: Theme.of(context).textTheme.labelLarge,
//                             ),
//                             const SizedBox(width: 15),
//                             Container(
//                               decoration: const BoxDecoration(
//                                 color: Colors.orangeAccent,
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(TSizes.cardRadiusMd),
//                                   bottomRight: Radius.circular(
//                                       TSizes.productImageRadius),
//                                 ),
//                               ),
//                               child: SizedBox(
//                                 width: 82,
//                                 height: 35,
//                                 child: TextButton(
//                                   onPressed: () => Get.to(
//                                     () =>  BookingPage(
//                                       service: 'Half Legs',
//                                       price: '499',
//                                     ),
//                                   ),
//                                   child: Text(
//                                     'Book Now',
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .labelSmall!
//                                         .apply(color: TColors.white),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       /// Item 6
//                       ListTile(
//                         dense: true,
//                         contentPadding: EdgeInsets.zero,
//                         title: Text('Full Legs',
//                             style: Theme.of(context).textTheme.titleMedium),
//                         subtitle: const Text(
//                           'Enjoying silky, hair-free legs for weeks',
//                           style: TextStyle(
//                             color: TColors.darkGrey,
//                           ),
//                         ),
//                         trailing: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               '₱799',
//                               style: Theme.of(context).textTheme.labelLarge,
//                             ),
//                             const SizedBox(width: 15),
//                             Container(
//                               decoration: const BoxDecoration(
//                                 color: Colors.orangeAccent,
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(TSizes.cardRadiusMd),
//                                   bottomRight: Radius.circular(
//                                       TSizes.productImageRadius),
//                                 ),
//                               ),
//                               child: SizedBox(
//                                 width: 82,
//                                 height: 35,
//                                 child: TextButton(
//                                   onPressed: () => Get.to(
//                                     () =>  BookingPage(
//                                       service: 'Full Legs',
//                                       price: '799',
//                                     ),
//                                   ),
//                                   child: Text(
//                                     'Book Now',
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .labelSmall!
//                                         .apply(color: TColors.white),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       /// Item 7
//                       ListTile(
//                         dense: true,
//                         contentPadding: EdgeInsets.zero,
//                         title: Text('Brazillian',
//                             style: Theme.of(context).textTheme.titleMedium),
//                         subtitle: const Text(
//                           'Enjoying silky, hair-free legs for weeks',
//                           style: TextStyle(
//                             color: TColors.darkGrey,
//                           ),
//                         ),
//                         trailing: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               '₱899',
//                               style: Theme.of(context).textTheme.labelLarge,
//                             ),
//                             const SizedBox(width: 15),
//                             Container(
//                               decoration: const BoxDecoration(
//                                 color: Colors.orangeAccent,
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(TSizes.cardRadiusMd),
//                                   bottomRight: Radius.circular(
//                                       TSizes.productImageRadius),
//                                 ),
//                               ),
//                               child: SizedBox(
//                                 width: 82,
//                                 height: 35,
//                                 child: TextButton(
//                                   onPressed: () => Get.to(
//                                         () =>  BookingPage(
//                                       service: 'Brazilian',
//                                       price: '899',
//                                     ),
//                                   ),
//                                   child: Text(
//                                     'Book Now',
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .labelSmall!
//                                         .apply(color: TColors.white),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
