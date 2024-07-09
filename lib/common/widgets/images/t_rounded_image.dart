import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor,
    this.fit,
    this.padding,
    this.isNetworkImage,
    this.onPressed,
    this.borderRadius = TSizes.md,
    this.heightImage,
    required this.widthImage,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool? isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;
  final double? heightImage;
  final double widthImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          Container(
            width: width,
            height: height,
            padding: padding,
            decoration: BoxDecoration(
              border: border,
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: ClipRRect(
              borderRadius: applyImageRadius
                  ? BorderRadius.circular(borderRadius)
                  : BorderRadius.zero,
              child: Image(
                image: isNetworkImage!
                    ? NetworkImage(imageUrl)
                    : AssetImage(imageUrl) as ImageProvider,
                fit: fit,
                alignment: const Alignment(0, 0.28),
                height: heightImage,
                width: widthImage,
              ),
            ),
          ),

          // /// JBL Logo
          // Positioned(
          //   top: 110,
          //   right: 9,
          //   child: Image.asset('assets/images/jbl_images/jbl-favicon.png', height: 40,),
          // ),
        ],
      ),
    );
  }
}
