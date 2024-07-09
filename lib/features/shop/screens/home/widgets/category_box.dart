// import 'package:flutter/material.dart';
//
// import '../../../../../utils/constants/colors.dart';
// import '../../../../../utils/constants/sizes.dart';
// import '../../../model/category_model.dart';
//
//
//
// class CategoryBox extends StatelessWidget {
//   final Category category;
//
//   const CategoryBox({super.key, required this.category});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 9.5),
//       child: Column(
//         children: [
//           /// Image
//           Container(
//             width: 56,
//             height: 56,
//             padding: const EdgeInsets.all(TSizes.sm),
//             decoration: BoxDecoration(
//               color: TColors.white,
//               borderRadius: BorderRadius.circular(100),
//             ),
//             child: category.image,
//           ),
//
//           /// Text
//           const SizedBox(height: TSizes.spaceBtwItems / 2),
//           SizedBox(
//             width: 55,
//             child: Text(
//               category.name,
//               style: Theme
//                   .of(context)
//                   .textTheme
//                   .labelMedium!
//                   .apply(color: Colors.white),
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
