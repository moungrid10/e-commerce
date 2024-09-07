import 'package:e_commerce/common/widgets/SectionTitle.dart';
import 'package:e_commerce/features/shop/models/payment_method_model.dart';
import 'package:e_commerce/features/shop/screens/cart/Payment_tile.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChekoutController extends GetxController {
  static ChekoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value = PaymentMethodModel(image: "assets/images/pay-pal.png", name: 'Paypal');
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod (BuildContext context) {
return showModalBottomSheet(
context: context,
builder: (_) => SingleChildScrollView(
child: Container(
padding: const EdgeInsets.all(TSizes.lg),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [

const TSectionHeading (title: 'Select Payment Method', showActionButton: false),
const SizedBox (height: TSizes.spaceBetweenSections),
PaymentTile (paymentMethod: PaymentMethodModel (name: 'Paypal', image:"assets/images/pay-pal.png")),
const SizedBox (height: TSizes.spaceBetweenItems/2),
PaymentTile (paymentMethod: PaymentMethodModel (name: 'Google Pay', image:"assets/images/pay-pal.png")), const SizedBox (height: TSizes.spaceBetweenItems/2),
PaymentTile (paymentMethod: PaymentMethodModel (name: 'Apple Pay', image:"assets/images/pay-pal.png")), const SizedBox (height: TSizes.spaceBetweenItems/2),
PaymentTile (paymentMethod: PaymentMethodModel (name: 'VISA', image:"assets/images/pay-pal.png")),
const SizedBox (height: TSizes.spaceBetweenItems/2),
PaymentTile (paymentMethod: PaymentMethodModel (name: 'Master Card', image: "assets/images/pay-pal.png")), const SizedBox (height: TSizes.spaceBetweenItems/2),
PaymentTile (paymentMethod: PaymentMethodModel (name: 'Paytm', image: "assets/images/pay-pal.png")),
const SizedBox (height: TSizes.spaceBetweenItems/2),
PaymentTile (paymentMethod: PaymentMethodModel (name: 'Paystack', image: "assets/images/pay-pal.png")), const SizedBox (height: TSizes.spaceBetweenItems/2),
PaymentTile (paymentMethod: PaymentMethodModel (name: 'Credit Card', image: "assets/images/pay-pal.png")), const SizedBox (height: TSizes.spaceBetweenItems/2),
const SizedBox (height: TSizes.spaceBetweenSections),
],
)
)
)
);
}
}
