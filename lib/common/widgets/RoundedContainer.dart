import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';


class TRroundedContainer extends StatelessWidget {
  const TRroundedContainer({
    super.key,this.borderRadius = TSizes.cardRadiusLg,  this.padding,  this.backgroundColor = TColors.light, this.width, this.height, this.margin,  this.showBorder = false, this.child,  this.borderColor = TColors.borderPrimary,
  });

  final double? width, height;
  final double borderRadius;
  final bool showBorder;
  
  final Widget? child;
  //final BoxFit? fit;
  final EdgeInsetsGeometry? padding,margin;
  final Color backgroundColor,borderColor;
  //final VoidCallback? onPressed; 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        border: showBorder? Border.all(color: borderColor):null,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
