

import 'package:e_commerce/common/widgets/RoundedContainer.dart';
import 'package:e_commerce/common/widgets/TBrandTitleText.dart';
import 'package:e_commerce/common/widgets/TBrandTitleWithVerification.dart';
import 'package:e_commerce/common/widgets/TCircleImage.dart';
import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

class TBrandCard extends StatelessWidget {
  const  TBrandCard({
    super.key,
    this.onTap,
    required this.showBorder, required this.brand,
  });
  final bool showBorder;
  final BrandModel brand;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {

    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
    onTap: onTap,
          
    child:  TRroundedContainer(
      padding: const EdgeInsets.all(TSizes.sm),
      backgroundColor: Colors.transparent,
      showBorder: showBorder,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: TCircleImage(
              isNetworkImage: true,
              overlayColor: dark? TColors.white:TColors.black,
              backgroundColor: Colors.transparent,
              image: brand.image,),
          ),
            const SizedBox(width: TSizes.spaceBetweenItems / 2,),
    
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[ 
                
                TBrandTextWithVerification(title: brand.name, brandTextSize: TextSizes.large,),
                TBrandtitletext(title: '${brand.productCount ?? 0 } products' ),
                                
              
              ]),
            ),
        ],
      ),
    ),
                      );
  }
}
