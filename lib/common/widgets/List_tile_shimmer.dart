import 'package:e_commerce/common/widgets/shimmer.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ListtileShimmer extends StatelessWidget {
  const ListtileShimmer({super.key});
 
 
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(children: [
          ShimmerEffect(width: 50, height: 50,radius: 50,),
          SizedBox(width: TSizes.spaceBetweenItems,),
          Column(
            children: [
              ShimmerEffect(width: 100, height: 15),
              SizedBox(height: TSizes.spaceBetweenItems / 2,),
              ShimmerEffect(width: 80, height: 12),
            ],
          )
        ],)
      ],

    );
  }
}