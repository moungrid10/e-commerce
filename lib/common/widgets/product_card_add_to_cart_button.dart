
import 'package:e_commerce/features/shop/controllers/cart_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/screens/product_detaills/product_details.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({
    super.key, required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    return InkWell(
      onTap: (){
        if(product.productType == ProductType.single.toString()){
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);

        } else {
          Get.to(()=> ProductDetaiils(product: product));
        }

      },
      child: Obx(
        (){
          final productQuantitycart = cartController.getProductQuantityInCart(product.id);

          return Container(
          decoration:  BoxDecoration(
            color:productQuantitycart > 0 ?TColors.primary: TColors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(TSizes.cardRadiusMd),
              bottomRight: Radius.circular(TSizes.cardRadiusMd),
            ),
          ),
          child: SizedBox(
            width: TSizes.iconLg * 1.2,
            height: TSizes.iconLg * 1.2,
            child: Center(
              child:productQuantitycart > 0 
              ?  Text(productQuantitycart.toString(), style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.white),)
              :Icon(
                Iconsax.add,
                color: TColors.white,
              ),
            ),
          ),
        );}
      ),
    );
  }
}
