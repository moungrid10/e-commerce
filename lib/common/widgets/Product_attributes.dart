import 'package:e_commerce/common/widgets/RoundedContainer.dart';
import 'package:e_commerce/common/widgets/SectionTitle.dart';
import 'package:e_commerce/common/widgets/TProductPriceText.dart';
import 'package:e_commerce/common/widgets/TProductTitleText.dart';
import 'package:e_commerce/common/widgets/choiceShip.dart';
import 'package:e_commerce/features/shop/controllers/variation_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TProductAttribut extends StatelessWidget {
  const TProductAttribut({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = THelperFunctions.isDarkMode(context);

    return Obx(
      ()=> Column(
        children: [
          if(controller.selectedVariation.value.id.isNotEmpty)
          TRroundedContainer(
            padding: const EdgeInsets.all(TSizes.md),
            backgroundColor: dark? TColors.darkerGrey: TColors.grey,
            child: Column(
              children: [
                Row(
                  children: [
                    const TSectionHeading(title: "Variation",showActionButton: false,),
                    const SizedBox(width: TSizes.spaceBetweenItems,),
                    
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const TProductTitleText(title: "Price",),
                            const SizedBox(width: TSizes.spaceBetweenItems,),
      
                            Text("\$${controller.selectedVariation.value.price}",
                            style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough,)),
                        
                            const SizedBox(width: TSizes.spaceBetweenItems,),
                             TProductPriceText(price: "${controller.selectedVariation.value.salePrice}"),
                        
                        
                        
                        
                          ],
                        ),
                        Row(
                          children: [
                            const TProductTitleText(title: "Stock",),
                            
                            const SizedBox(width: TSizes.spaceBetweenItems,),
      
                            Text(controller.selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock',
                            style: Theme.of(context).textTheme.titleMedium),
      
                          ],
                        )
                      ],
                    )
      
                  ],
                ),
                const SizedBox(height: TSizes.spaceBetweenItems,),
                const TProductTitleText(title: "This is the description of the product with max 4 lines", smallsize: true, maxLines: 4,)
              ],
            ),
      
          ),
          const SizedBox(height: TSizes.spaceBetweenSections,),
          Column(
            children: [
              
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: product.productAttributes!
                .map((attribute) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TSectionHeading(title: attribute.name ?? "" , showActionButton: false,),
                    SizedBox(height: TSizes.spaceBetweenItems /2,),
                    Obx(
                      ()=> Wrap(
                        spacing: 8,
                        children: attribute.values!.map((attributeValue){
                          final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                          final available = controller
                          .getAttributesAvailabilityInVariation(product.productVariations!, attribute.name!)
                          .contains(attributeValue);
                        
                          return TChoiceChip(text: attributeValue, selected: isSelected,
                          onSelected: available
                          ? (selected) {
                            if(selected && available){
                              controller.onAttributeSelected(product, attribute.name!, attributeValue);
                            }
                          }
                          : null
                          );
                        }
                        ).toList()
                      ),
                    )
                  ],
                )).toList(),
              ),
      
                
                 
              
            ],
          )
              
        ],
      
      
      ),
    );
  }
}
