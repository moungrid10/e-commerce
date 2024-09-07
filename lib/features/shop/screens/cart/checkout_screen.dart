import 'package:e_commerce/Bottom_Nav_Bar.dart';
import 'package:e_commerce/common/widgets/RoundedContainer.dart';
import 'package:e_commerce/common/widgets/TCartItems.dart';
import 'package:e_commerce/common/widgets/appbar.dart';
import 'package:e_commerce/common/widgets/biiling_amount_section.dart';
import 'package:e_commerce/common/widgets/billing_address_section.dart';
import 'package:e_commerce/common/widgets/billing_payment_section.dart';
import 'package:e_commerce/common/widgets/coupopn_widget.dart';
import 'package:e_commerce/common/widgets/loaders.dart';
import 'package:e_commerce/features/authentification/screens/Signup/SuccesScreen.dart';
import 'package:e_commerce/features/shop/controllers/cart_controller.dart';
import 'package:e_commerce/features/shop/controllers/order_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:e_commerce/utils/helper/pricing_calculator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderController = Get.put(OrderController());
    final controller = CartController.instance;
    final subTotal = controller.totalCartPrice.value;
    final totalAmount = TPricingCalculator.calculateTotalPrice(subTotal, 'US');

    final dark = THelperFunctions.isDarkMode(context);
    return  Scaffold(
      appBar: TAppBar(title: Text("Order Review",style: Theme.of(context).textTheme.headlineSmall,),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(children: [
          TCartItems(showAddRemoveButt: false,),
          SizedBox(height: TSizes.spaceBetweenSections,),


          TcouponCode(),
          SizedBox(height: TSizes.spaceBetweenSections,),

          TRroundedContainer(
            showBorder: true,
            padding: EdgeInsets.all(TSizes.md),
            backgroundColor: dark? TColors.black: TColors.white,
            child: Column(children: [
              BillingAmountSection(),
              SizedBox(height: TSizes.spaceBetweenItems,),

              Divider(),
              SizedBox(height: TSizes.spaceBetweenItems,),
              BillingPaymentSection(),

              SizedBox(height: TSizes.spaceBetweenItems,),


              BillingAddressSection(),



            ],),
          )



 

        ],),),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: subTotal > 0
        ? ()=> orderController.processOrder(totalAmount)
        : () => TLoaders.warningSnackBar(title: 'Empty Cart',message: 'Add items in the cart'),
        child: Text("Buy \$$totalAmount")),
      ),
    );
  }
}
