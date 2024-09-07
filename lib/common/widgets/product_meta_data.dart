import 'package:e_commerce/common/widgets/RoundedContainer.dart';
import 'package:e_commerce/common/widgets/TBrandTitleWithVerification.dart';
import 'package:e_commerce/common/widgets/TCircleImage.dart';
import 'package:e_commerce/common/widgets/TProductPriceText.dart';
import 'package:e_commerce/common/widgets/TProductTitleText.dart';
import 'package:e_commerce/features/shop/controllers/product_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

class TProductMetaData
 extends StatelessWidget {
  const TProductMetaData({super.key, required this.product});
  final ProductModel product ;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final saleprice = product.salePrice;
    
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TRroundedContainer(
                      
                      borderRadius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text(
                        "$salePercentage%",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                     SizedBox(width: TSizes.spaceBetweenItems,),


                     if(product.productType == ProductType.single.toString() && product.salePrice! > 0)
                       Text("\$${product.price}",style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough,)),
                     if(product.productType == ProductType.single.toString() && product.salePrice! > 0) const SizedBox(width: TSizes.spaceBetweenItems / 2,),

                     TProductPriceText(price: controller.getProductPrice(product)),
                      

          ],
        ),
        const SizedBox(height: TSizes.spaceBetweenItems / 1.5,),

       
        const SizedBox(height: TSizes.spaceBetweenItems / 1.5,),


         TProductTitleText(title: product.title),
        Row(
          children: [
            const TProductTitleText(title: "Status"),
            const SizedBox(width: TSizes.spaceBetweenItems / 1.5,),

            Text(product.stock > 0 ? "In Stock":"Out of Stock", style: Theme.of(context).textTheme.titleMedium,)
          ],
        ),
        const SizedBox(height: TSizes.spaceBetweenItems / 1.5,),
          Row(
          children: [
            TCircleImage(image: product.brand!.image,),
            TBrandTextWithVerification(title: product.brand != null ? product.brand!.name:"",brandTextSize: TextSizes.large,),
          ],
        ),




      ],
    );
  }
}