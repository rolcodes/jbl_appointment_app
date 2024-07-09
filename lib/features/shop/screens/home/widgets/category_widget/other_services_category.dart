//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
//
// import '../../../../../../utils/constants/colors.dart';
// import '../../../../../../utils/constants/sizes.dart';
// import '../../../../../../views/booking_view/booking_details.dart';
//
// class OtherServicesCategory extends StatelessWidget {
//   const OtherServicesCategory({super.key});
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
//                           'https://scontent.fmnl4-6.fna.fbcdn.net/v/t39.30808-6/436206763_794662026096978_447481900053069456_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFOoNR0GSo2uSL2vOqj8itwW2G2P871Ll1bYbY_zvUuXVpshHPsT9ecrTl0w4NrcKkl4yTChTKatu6LWMcGdwww&_nc_ohc=RgdkyUCd0vAQ7kNvgGruPLf&_nc_zt=23&_nc_ht=scontent.fmnl4-6.fna&oh=00_AYAl98hF7EaFOx5aYmGri-xe_a4NvMwwFilextLNa2LDaQ&oe=6647862D'),
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
//
//             /// -- Content
//             Container(
//               color: TColors.white,
//               padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   /// -- Category Name
//                   Text('Other Beauty Services',
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
//                   Text(
//                       'Transform your skin with our exclusive Gluta Push and Drip services! Experience the ultimate in skin care luxury with our Perfect White Skin Push, Sexy White Drip, Melasma Drip, and more.',
//                       style: Theme.of(context)
//                           .textTheme
//                           .labelLarge!
//                           .apply(fontSizeDelta: -1,color: TColors.darkGrey)),
//                   const SizedBox(height: 10),
//
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//
//                       /// Title
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 5),
//                         child: Text(
//                           'Warts Removal',
//                           style: Theme.of(context)
//                               .textTheme
//                               .headlineSmall!
//                               .apply(color: Colors.orange),
//                         ),
//                       ),
//
//                       /// Item 1
//                       ListTile(
//                         dense: true,
//                         contentPadding: EdgeInsets.zero,
//                         title: Text('Face Warts Removal',
//                             style: Theme.of(context).textTheme.titleMedium),
//                         subtitle: const Text(
//                           'Lorem ipsum dolor sit amet',
//                           style: TextStyle(
//                             color: TColors.darkGrey,
//                           ),),
//                         trailing: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               '₱999',
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
//                                       service: 'Face Warts Removal',
//                                       price: '999',
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
//                         title: Text('Neck Warts Removal',
//                             style: Theme.of(context).textTheme.titleMedium),
//                         subtitle: const Text(
//                           'Lorem ipsum dolor sit amet',
//                           style: TextStyle(
//                             color: TColors.darkGrey,
//                           ),),
//                         trailing: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               '₱1099',
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
//                                       service: 'Cleansing Push',
//                                       price: '1099',
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
//                         title: Text('Chess Warts Removal',
//                             style: Theme.of(context).textTheme.titleMedium),
//                         subtitle: const Text(
//                           'Lorem ipsum dolor sit amet',
//                           style: TextStyle(
//                             color: TColors.darkGrey,
//                           ),),
//                         trailing: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               '₱1399',
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
//                                       service: 'Chess Warts Removal',
//                                       price: '1399',
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
//                         title: Text('Back Warts Removal',
//                             style: Theme.of(context).textTheme.titleMedium),
//                         subtitle: const Text(
//                           'Lorem ipsum dolor sit amet',
//                           style: TextStyle(
//                             color: TColors.darkGrey,
//                           ),),
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
//                                         () =>  BookingPage(
//                                       service: 'Acne Facial w/ LED Light',
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
//                       /// Title
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 5),
//                         child: Text(
//                           'Add Ons',
//                           style: Theme.of(context)
//                               .textTheme
//                               .headlineSmall!
//                               .apply(color: Colors.orange),
//                         ),
//                       ),
//
//                       /// Item 5
//                       ListTile(
//                         dense: true,
//                         contentPadding: EdgeInsets.zero,
//                         title: Text('Ear Candle',
//                             style: Theme.of(context).textTheme.titleMedium),
//                         subtitle: const Text(
//                           'Ignite serenity, purify within, and awaken the senses.',
//                           style: TextStyle(
//                             color: TColors.darkGrey,
//                           ),),
//                         trailing: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               '₱149',
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
//                                       service: 'Ear Candle',
//                                       price: '149',
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
//                         title: Text('Hot Stone',
//                             style: Theme.of(context).textTheme.titleMedium),
//                         subtitle: const Text(
//                           'Melt away tension, bask in deep warmth, and renewed.',
//                           style: TextStyle(
//                             color: TColors.darkGrey,
//                           ),),
//                         trailing: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               '₱249',
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
//                                       service: 'Hot Stone',
//                                       price: '249',
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
//                         title: Text('Ventosa',
//                             style: Theme.of(context).textTheme.titleMedium),
//                         subtitle: const Text(
//                           'Boost circulation, increase energy flow, and feel refreshed.',
//                           style: TextStyle(
//                             color: TColors.darkGrey,
//                           ),),
//                         trailing: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               '₱149',
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
//                                       service: 'Ventosa',
//                                       price: '149',
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
//                       /// Item 8
//                       ListTile(
//                         dense: true,
//                         contentPadding: EdgeInsets.zero,
//                         title: Text('Hot Compress',
//                             style: Theme.of(context).textTheme.titleMedium),
//                         subtitle: const Text(
//                           'Soothe aching muscles, enveloped in comforting heat.',
//                           style: TextStyle(
//                             color: TColors.darkGrey,
//                           ),),
//                         trailing: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               '₱199',
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
//                                       service: 'Hot Compress',
//                                       price: '199',
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
//                       const SizedBox(height: 100),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
