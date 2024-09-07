import 'package:e_commerce/common/widgets/RoundedBanner.dart';
import 'package:e_commerce/common/widgets/RoundedContainer.dart';
import 'package:e_commerce/common/widgets/TBrandTitleWithVerification.dart';
import 'package:e_commerce/common/widgets/TCircleIcon.dart';
import 'package:e_commerce/common/widgets/TProductPriceText.dart';
import 'package:e_commerce/common/widgets/TProductTitleText.dart';
import 'package:e_commerce/features/shop/controllers/product_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/screens/product_detaills/product_details.dart';
import 'package:e_commerce/features/shop/screens/wishlist/favorite_icon.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/shadows.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductcardHorizontal extends StatelessWidget {
  const ProductcardHorizontal({super.key, required this.product});
  final ProductModel product;


  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercenrtage = controller.calculateSalePercentage(product.price, product.salePrice);
        final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
     // onTap: () => Get.to(()=> const ProductDetaiils()),
      child: Container(
        width: 310,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: dark ? TColors.darkerGrey : TColors.softGrey,
          borderRadius: BorderRadius.circular(TSizes.defaultSpace),
        ),
        child: Row(children: [
          TRroundedContainer(
              height: 120,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.black : TColors.light,
              child: Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: TRoundedBanner(imageUrl: product.thumbnail!,applyImageRaduis: true,isNetworkImage: true,)),
                   Positioned(
                        top: 12,
                        child: TRroundedContainer(
                          
                          borderRadius: TSizes.sm,
                          backgroundColor: TColors.secondary.withOpacity(0.8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: TSizes.sm, vertical: TSizes.xs),
                          child: Text(
                            "$salePercenrtage%",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: TColors.black),
                          ),
                        ),
                      ),
                       Positioned(
                        top: 0,
                        right: 0,
                        child: FavoriteIcon(productId: product.id ,),
                      ),



                ]),),
          SizedBox(
            
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.sm,left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(title: product.title, smallsize: true,),
                      SizedBox(height: TSizes.spaceBetweenItems / 2,),
                      TBrandTextWithVerification(title: product.brand!.name),
                              
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                             if (product.productType == ProductType.single.toString() && product.salePrice! > 0)
                                Padding(
                                  padding: EdgeInsets.only(left: TSizes.sm),
                                  child: Text(
                                    product.price.toString(),
                                    style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                           
                                  ),
                                ),
                            Padding(
                              padding: EdgeInsets.only(left: TSizes.sm),
                              child: TProductPriceText(price: controller.getProductPrice(product))),
                          ],
                        ),
                      ),

                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight: Radius.circular(TSizes.cardRadiusMd),
                          ),
                        ),
                        child: const SizedBox(
                          width: TSizes.iconLg * 1.2,
                          height: TSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add,
                              color: TColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],),
        ),
        );
  }
}