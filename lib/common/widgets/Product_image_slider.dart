
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/common/widgets/RoundedBanner.dart';
import 'package:e_commerce/common/widgets/TCircleIcon.dart';
import 'package:e_commerce/common/widgets/TCurvedEdgeWidjet.dart';
import 'package:e_commerce/common/widgets/appbar.dart';
import 'package:e_commerce/features/shop/controllers/images_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/screens/wishlist/favorite_icon.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,required this.product,
  });
  final ProductModel product;



  @override
  Widget build(BuildContext context) {
  final dark = THelperFunctions.isDarkMode(context);
  final controller = Get.put(ImagesController());
  final images = controller.getAllProductImages(product);

    return TCurvedEdgeContainer(child: Container(
      color: dark? TColors.darkGrey:TColors.light,
      child: Stack(
        children: [
           SizedBox(height: 400,child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Center(child: Obx((){
              final image = controller.selectedProductImage.value;
              return GestureDetector(
                onTap: ()=> controller.showEnlargedImage(image),
                child: CachedNetworkImage(imageUrl: image,progressIndicatorBuilder: (_,__, downloadProgress) => 
                CircularProgressIndicator(value: downloadProgress.progress,color: TColors.primary,),),
              );
            })
            ),
          ),
          
          ),
          Positioned(
            bottom: 30,
            right: 0,
            left: TSizes.spaceBetweenItems,
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                separatorBuilder: (_,__)=> const SizedBox(width: TSizes.spaceBetweenItems),
                itemCount: images.length,
                itemBuilder: (_,index)=> Obx((){
                
                final imageSelected = controller.selectedProductImage.value == images[index];

                return TRoundedBanner(
                  onPressed:()=> controller.selectedProductImage.value = images[index],
                isNetworkImage: true,
                imageUrl: images[index],
                width: 80,
                backgroundColor: dark? TColors.black:TColors.white,
                border: Border.all(color:imageSelected? TColors.primary : Colors.transparent),
                padding: const EdgeInsets.all(TSizes.sm),);
                }) )),
          ),
           TAppBar(showBackArrow: true,
          actions: [
            FavoriteIcon(productId:  product.id,),
          ],
          )
        ],
      ),
    ));
  }
}