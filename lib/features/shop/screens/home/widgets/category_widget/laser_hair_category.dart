// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
//
// import '../../../../../../utils/constants/colors.dart';
// import '../../../../../../utils/constants/sizes.dart';
// import '../../../../../../views/booking_view/booking_details.dart';
//
// class LaserHairCategory extends StatelessWidget {
//   const LaserHairCategory({super.key});
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
//                           'https://scontent.fmnl30-2.fna.fbcdn.net/v/t39.30808-6/436240274_794145696148611_2065891981241779476_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=5f2048&_nc_ohc=l2JAdEs9Zy0Q7kNvgGhcocJ&_nc_ht=scontent.fmnl30-2.fna&oh=00_AYA2R2OQSfC1H7VQUqNWij7q6a3nHo7JcNaftlsVWYT95A&oe=66466D61'),
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
//                   Text('Laser Treatment Diode',
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
//                   Text(
//                       'Transform your skincare routine with Jevelme Beauty Lounge’s cutting-edge laser treatment services!',
//                       style: Theme.of(context)
//                           .textTheme
//                           .labelLarge!
//                           .apply(fontSizeDelta: -1, color: TColors.darkGrey)),
//                   const SizedBox(height: 10),
//
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       /// Title
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 5),
//                         child: Text(
//                           'Laser Treatment Diode Hair Removal',
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
//                         title: Text('Diode Face',
//                             style: Theme.of(context).textTheme.titleMedium),
//                         subtitle: const Text(
//                           'Lorem ipsum dolor sit amet',
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
//                                         () =>  BookingPage(
//                                       service: 'Diode Face',
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
//                       /// Item 2
//                       ListTile(
//                         dense: true,
//                         contentPadding: EdgeInsets.zero,
//                         title: Text('Diode Upper Lips & Chin',
//                             style: Theme.of(context).textTheme.titleMedium),
//                         subtitle: const Text(
//                           'Effortless facial flawlessness awaits.',
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
//                                         () =>  BookingPage(
//                                       service: 'Diode Upper Lips & Chin',
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
//                       /// Item 3
//                       ListTile(
//                         dense: true,
//                         contentPadding: EdgeInsets.zero,
//                         title: Text('Diode Half Arms',
//                             style: Theme.of(context).textTheme.titleMedium),
//                         subtitle: const Text(
//                           'Lorem ipsum dolor sit amet',
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
//                                         () =>  BookingPage(
//                                       service: 'Diode Half Arms',
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
//                       /// Item 4
//                       ListTile(
//                         dense: true,
//                         contentPadding: EdgeInsets.zero,
//                         title: Text('Diode Full arms',
//                             style: Theme.of(context).textTheme.titleMedium),
//                         subtitle: const Text(
//                           'Lorem ipsum dolor sit amet',
//                           style: TextStyle(
//                             color: TColors.darkGrey,
//                           ),
//                         ),
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
//                                       service: 'JDiode Full arms',
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
//                       /// Item 5
//                       ListTile(
//                         dense: true,
//                         contentPadding: EdgeInsets.zero,
//                         title: Text('Diode Tummy',
//                             style: Theme.of(context).textTheme.titleMedium),
//                         subtitle: const Text(
//                           'Lorem ipsum dolor sit amet',
//                           style: TextStyle(
//                             color: TColors.darkGrey,
//                           ),
//                         ),
//                         trailing: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               '₱1199',
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
//                                       service: 'Diode Tummys',
//                                       price: '1199',
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
//                       /// item 6
//                       ListTile(
//                         dense: true,
//                         contentPadding: EdgeInsets.zero,
//                         title: Text('Diode Bikini',
//                             style: Theme.of(context).textTheme.titleMedium),
//                         subtitle: const Text(
//                           'Confidence blooms with precision.',
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
//                                       service: 'Diode Bikini',
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
//
//                       /// Item 7
//                       ListTile(
//                         dense: true,
//                         contentPadding: EdgeInsets.zero,
//                         title: Text('Diode Butt',
//                             style: Theme.of(context).textTheme.titleMedium),
//                         subtitle: const Text(
//                           'Lorem ipsum dolor sit amet',
//                           style: TextStyle(
//                             color: TColors.darkGrey,
//                           ),
//                         ),
//                         trailing: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               '₱699',
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
//                                       service: 'Diode Butt',
//                                       price: '699',
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
//                         title: Text('Diode Brazilian',
//                             style: Theme.of(context).textTheme.titleMedium),
//                         subtitle: const Text(
//                           'Experience sleek confidence, perfectly defined.',
//                           style: TextStyle(
//                             color: TColors.darkGrey,
//                           ),
//                         ),
//                         trailing: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               '₱1299',
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
//                                       service: 'Diode Brazilian',
//                                       price: '1299',
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
//                       /// Item 9
//                       ListTile(
//                         dense: true,
//                         contentPadding: EdgeInsets.zero,
//                         title: Text('Diode Half Legs',
//                             style: Theme.of(context).textTheme.titleMedium),
//                         subtitle: const Text(
//                           'Lorem ipsum dolor sit amet',
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
//                                         () =>  BookingPage(
//                                       service: 'Diode Half Legs',
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
//                       /// Item 10
//                       ListTile(
//                         dense: true,
//                         contentPadding: EdgeInsets.zero,
//                         title: Text('Diode Full Legs',
//                             style: Theme.of(context).textTheme.titleMedium),
//                         subtitle: const Text(
//                           'Lorem ipsum dolor sit amet',
//                           style: TextStyle(
//                             color: TColors.darkGrey,
//                           ),
//                         ),
//                         trailing: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               '₱1199',
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
//                                       service: 'Diode Full Legs',
//                                       price: '1199',
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
//                       /// Item 11
//                       ListTile(
//                         dense: true,
//                         contentPadding: EdgeInsets.zero,
//                         title: Text('Diode Bikini Laser',
//                             style: Theme.of(context).textTheme.titleMedium),
//                         subtitle: const Text(
//                           'Confidence blooms with precision',
//                           style: TextStyle(
//                             color: TColors.darkGrey,
//                           ),
//                         ),
//                         trailing: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               '₱1000',
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
//                                       service: 'Diode Bikini Laser',
//                                       price: '1000',
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
//                       /// Item 12
//                       ListTile(
//                         dense: true,
//                         contentPadding: EdgeInsets.zero,
//                         title: Text('Diode Underarm',
//                             style: Theme.of(context).textTheme.titleMedium),
//                         subtitle: const Text(
//                           'Lorem ipsum dolor sit amet',
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
//                                         () =>  BookingPage(
//                                       service: 'Diode Underarm',
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
//                       const SizedBox(height: 100),
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
