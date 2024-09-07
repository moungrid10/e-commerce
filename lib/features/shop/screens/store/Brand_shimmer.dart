import 'package:e_commerce/common/widgets/TGridLayout.dart';
import 'package:e_commerce/common/widgets/shimmer.dart';
import 'package:flutter/material.dart';

class BrandShimmer extends StatelessWidget {
  const BrandShimmer({super.key,this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return  TGridLayout(
      mainAxisExtent: 80,
      itemCount:  itemCount,
      itemBuilder: (_,__) => ShimmerEffect(width: 300, height: 80),

    );
  }
}