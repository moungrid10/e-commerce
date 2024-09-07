
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TRoundedBanner extends StatelessWidget {
  const TRoundedBanner({
    super.key,this.borderRadius = TSizes.md, required this.imageUrl,  this.applyImageRaduis = true,  this.isNetworkImage = false, this.border, this.fit = BoxFit.cover, this.padding,  this.backgroundColor = TColors.light, this.onPressed, this.width=295, this.height=150,
  });

  final double? width, height;
  final double borderRadius;
  final String imageUrl;
  final bool applyImageRaduis, isNetworkImage;
  final BoxBorder? border;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final Color backgroundColor;
  final VoidCallback? onPressed; 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImageRaduis? BorderRadius.circular(borderRadius):BorderRadius.zero,
          child:  Image(
            image: isNetworkImage? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider,
            fit: fit,
          ),
        ),
      ),
    );
  }
}
