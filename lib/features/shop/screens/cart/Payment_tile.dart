import 'package:e_commerce/common/widgets/RoundedContainer.dart';
import 'package:e_commerce/features/shop/controllers/chekout_controller.dart';
import 'package:e_commerce/features/shop/models/payment_method_model.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class PaymentTile extends StatelessWidget {
const PaymentTile({ super.key, required this.paymentMethod});
final PaymentMethodModel paymentMethod;
@override
Widget build (BuildContext context) {
final controller = ChekoutController.instance;
return ListTile(
contentPadding: const EdgeInsets.all(0), 
onTap: () {
controller.selectedPaymentMethod.value = paymentMethod;
 Get.back();
},
leading: TRroundedContainer(
width: 60,
height: 40,
backgroundColor: THelperFunctions.isDarkMode (context)? TColors.light: TColors.white,
padding: const EdgeInsets.all(TSizes.sm),
child: Image (image: AssetImage(paymentMethod. image), fit: BoxFit.contain),
), // TRoundedContainer
title: Text (paymentMethod.name),
trailing: const Icon (Iconsax.arrow_right_34),
);
}
}