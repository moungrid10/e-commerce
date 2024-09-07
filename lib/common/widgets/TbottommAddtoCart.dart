import 'package:e_commerce/common/widgets/TCircleIcon.dart';
import 'package:e_commerce/features/shop/controllers/cart_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Tbottommaddtocart extends StatelessWidget {
  const Tbottommaddtocart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) { 
    final controller = CartController.instance;
    controller.updateAlredyAddedProductCount(product);
    final dark = THelperFunctions.isDarkMode(context);
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace /2),
      decoration: BoxDecoration(
        color: dark? TColors.darkerGrey:TColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg),
        )
      ),
      child: Obx(
        ()=> Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                Row(children: [
                 TCircleIcon(icon: Iconsax.minus,
                backgroundColor: TColors.darkGrey,
                width: 40,
                height: 40,
                color: TColors.white,
                onPressed:()=> controller.productQuantityInCart.value < 1 ? null : controller.productQuantityInCart.value -= 1,),
              
                const SizedBox(width: TSizes.spaceBetweenItems,),
                Text(controller.productQuantityInCart.value.toString(), style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(width: TSizes.spaceBetweenItems,),
              
                 TCircleIcon(icon: Iconsax.add,
                backgroundColor: TColors.darkGrey,
                width: 40,
                height: 40,
                color: TColors.white,
                onPressed: ()=>  controller.productQuantityInCart.value += 1,),
              
              ],),
            
            ElevatedButton(onPressed: controller.productQuantityInCart.value <1 ?null:()=> controller.addToCart(product),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: TColors.black,
              side: const BorderSide(color: TColors.black)
            ), child: const Text("Add to cart"),)
          ],
        ),
      ),

      
    );
  }
}