import 'package:e_commerce/common/widgets/shimmer.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key,
  this.itemCount=6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => SizedBox(width: TSizes.spaceBetweenItems,),
        itemBuilder: (_,__){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerEffect(width: 55, height: 55,radius: 55,),
              SizedBox(height: TSizes.spaceBetweenItems,),
              ShimmerEffect(width: 55, height: 8),
            ],
          );
        }, )
    );
  }
}