import 'package:e_commerce/common/widgets/shimmer.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HorizontalProductShimmer extends StatelessWidget {
  const HorizontalProductShimmer({super.key,  this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(bottom: TSizes.spaceBetweenSections),
      height: 120,
      child: ListView.separated(itemBuilder: (_,__) => 
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ShimmerEffect(width: 120, height: 120),
          SizedBox(height: TSizes.spaceBetweenItems,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: TSizes.spaceBetweenItems /2,),
              ShimmerEffect(width: 160, height: 15),
              SizedBox(height: TSizes.spaceBetweenItems /2,),
              ShimmerEffect(width: 110, height: 15),
              SizedBox(height: TSizes.spaceBetweenItems /2,),
              ShimmerEffect(width: 80, height: 15),
              Spacer(),

            ],
          )


        ],
      ), separatorBuilder: (_,__,) => SizedBox(height: TSizes.spaceBetweenItems,) ,itemCount: itemCount,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,),

    );
  }
}