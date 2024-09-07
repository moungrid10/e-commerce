
import 'package:e_commerce/features/shop/controllers/cart_controller.dart';
import 'package:e_commerce/features/shop/screens/cart/cartScreen..dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TcarticonCounter extends StatelessWidget {
  const TcarticonCounter({
    super.key,this.changeColor = false, required this.onPressed,
  });
  final VoidCallback onPressed;
  final bool changeColor;


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    final dark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
          onPressed: ()=> Get.to(()=> CartScreen()),
          icon:  Icon(
            Iconsax.shopping_bag,
            color: changeColor? (dark? TColors.black: TColors.light) : (dark? TColors.light: TColors.black),
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: TColors.black,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Obx(
                ()=> Text(
                  controller.noOfCartItems.value.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
