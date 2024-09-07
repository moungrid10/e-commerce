import 'package:e_commerce/features/shop/controllers/cart_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helper/pricing_calculator.dart';
import 'package:flutter/material.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    return  Column
    (
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text("Subtotal",style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text("\$$subTotal",style: Theme.of(context).textTheme.bodyLarge,
            ),
            


        ],),
          SizedBox(height: TSizes.spaceBetweenItems,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text("Shipping fee",style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text("\$${TPricingCalculator.calculateShippingCost(subTotal, 'US')}",style: Theme.of(context).textTheme.bodyLarge,
            ),
            


        ],),
          SizedBox(height: TSizes.spaceBetweenItems,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text("Tax Fee",style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text("\$${TPricingCalculator.calculateTax(subTotal, 'US')}",style: Theme.of(context).textTheme.bodyLarge,
            ),
            


        ],),
                      SizedBox(height: TSizes.spaceBetweenItems,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text("Order Total",style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text("\$${TPricingCalculator.calculateTotalPrice(subTotal, 'US')}",style: Theme.of(context).textTheme.titleLarge,
            ),
            


        ],)

      ],
    );
  }
}