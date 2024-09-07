
import 'package:e_commerce/common/widgets/TGridLayout.dart';
import 'package:e_commerce/common/widgets/shimmer.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TVerticalProductShimmer extends StatelessWidget {
   const TVerticalProductShimmer ({
super.key,
this.itemCount = 4,
});
final int itemCount;
@override
Widget build(BuildContext context) {

return TGridLayout(
itemCount: itemCount,
itemBuilder: (_, __) => const SizedBox(
width: 180,
child: Column(
crossAxisAlignment: CrossAxisAlignment.start, 
children: [

/// Image
ShimmerEffect (width: 180, height: 180), 
SizedBox (height: TSizes.spaceBetweenItems),
/// Text
ShimmerEffect (width: 160, height: 15), 
SizedBox (height: TSizes.spaceBetweenItems / 2), 
ShimmerEffect (width: 110, height: 15),
],
), // Column
), // SizedBox
); // TGridLayout
}
}