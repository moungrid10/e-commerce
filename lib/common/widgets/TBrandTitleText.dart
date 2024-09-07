
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class TBrandtitletext extends StatelessWidget {
  const TBrandtitletext({
    super.key,required this.title , this.brandTextSize = TextSizes.small,  this.maxLines = 1, this.textAlign = TextAlign.center, this.color,
  });

  final String title;
  final int maxLines;
  final Color? color;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;


  @override
  Widget build(BuildContext context) {
    return Text(title,
    
    style: brandTextSize == TextSizes.small ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
     : brandTextSize == TextSizes.meduim 
        ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
        : brandTextSize == TextSizes.large 
           ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
           : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
    overflow: TextOverflow.ellipsis,
    maxLines: maxLines,
    textAlign: textAlign,);
}}
