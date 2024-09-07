
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/common/widgets/RoundedContainer.dart';
import 'package:e_commerce/common/widgets/TBrandCard.dart';
import 'package:e_commerce/common/widgets/shimmer.dart';
import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:e_commerce/features/shop/screens/store/brand_products.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key,
    required this.images, required this.brand,
  });
  
  final BrandModel brand;
  final List<String> images;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: TRroundedContainer(
      
        padding: const EdgeInsets.all(TSizes.md),
        showBorder: true,
        borderColor: TColors.darkGrey,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: TSizes.spaceBetweenItems),
        child: Column(
          children: [
             TBrandCard(showBorder: false,brand: brand,),
            Row(
              children: 
                images.map((image)=> brandTopProductImageWidjet(image, context)).toList(),
                
      
              
            )
          ]
           
      
          ),
        ),
    );
  }

  Widget brandTopProductImageWidjet(String image, context) {
    return Expanded(
              child: TRroundedContainer(
                height: 100,
                backgroundColor: THelperFunctions.isDarkMode(context)? TColors.darkGrey:TColors.white,
                margin: const EdgeInsets.only(right: TSizes.sm),
                padding: const EdgeInsets.all(TSizes.md),
                child:  CachedNetworkImage(fit: BoxFit.contain,imageUrl: image,progressIndicatorBuilder: (context, url, downloadProgress)=> ShimmerEffect(width: 100, height: 100),
                errorWidget: (context, url, error)=> Icon(Icons.error),),
                
              ),
            );
  }
}
