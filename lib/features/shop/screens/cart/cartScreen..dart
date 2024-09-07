import 'package:e_commerce/common/widgets/TCartItems.dart';
import 'package:e_commerce/common/widgets/appbar.dart';
import 'package:e_commerce/features/shop/controllers/cart_controller.dart';
import 'package:e_commerce/features/shop/screens/cart/checkout_screen.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => CheckoutScreen()),
          child: Obx(() => Text('Checkout \$${controller.totalCartPrice.value}')),
        ),
      ),
      body: Obx(
        () {
          if (controller.cartItems.isEmpty) {
            return Center(
              child: Text('Your cart is empty'),
            );
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: TCartItems(),
            ),
          );
        },
      ),
    );
  }
}
