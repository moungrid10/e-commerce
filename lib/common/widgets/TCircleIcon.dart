


import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

class TCircleIcon extends StatelessWidget {
  const TCircleIcon({
    super.key,required this.icon , this.size = TSizes.lg,  this.backgroundColor , this.onPressed, this.width, this.height, this.color,
  });

  final double? width, height, size;
  final Color? color;
  final IconData icon;
  final Color? backgroundColor;
  final VoidCallback? onPressed; 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
 
      decoration: BoxDecoration(

        color: backgroundColor ?? (THelperFunctions.isDarkMode(context)?TColors.black.withOpacity(0.5):TColors.white.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(icon,color: color, size: size,),),
    );
  }
}
