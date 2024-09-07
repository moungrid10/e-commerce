
import 'package:e_commerce/common/widgets/TProductPriceText.dart';
import 'package:e_commerce/common/widgets/add_remove_button.dart';
import 'package:e_commerce/common/widgets/cart_item.dart';
import 'package:e_commerce/features/shop/controllers/cart_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButt = true});

  final bool showAddRemoveButt;

  @override
  Widget build(BuildContext context) {
    final cartcontroller = CartController.instance;
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(), // Disable ListView's own scrolling
        itemCount: cartcontroller.cartItems.length,
        separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBetweenSections),
        itemBuilder: (_, index) {
          final item = cartcontroller.cartItems[index];
          return Column(
            children: [
              TCartItem(cartItem: item),
              if (showAddRemoveButt) SizedBox(height: TSizes.spaceBetweenItems),
              if (showAddRemoveButt)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 70),
                        TProductQuantityWithADDRemove(
                          quantity: item.quantity,
                          add: () => cartcontroller.addOneToCart(item),
                          remove: () => cartcontroller.removeOneFromCart(item),
                        ),
                      ],
                    ),
                    TProductPriceText(price: item.price.toString()),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}
