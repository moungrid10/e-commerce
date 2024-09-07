import 'package:e_commerce/Bottom_Nav_Bar.dart';
import 'package:e_commerce/common/widgets/loaders.dart';
import 'package:e_commerce/data/repositories.authentication/authentication_repository.dart';
import 'package:e_commerce/features/authentification/screens/Signup/SuccesScreen.dart';
import 'package:e_commerce/features/shop/controllers/cart_controller.dart';
import 'package:e_commerce/features/shop/controllers/chekout_controller.dart';
import 'package:e_commerce/features/shop/models/order_model.dart';
import 'package:e_commerce/features/shop/screens/address/address_controller.dart';
import 'package:e_commerce/features/shop/screens/settings/order_repository.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();


  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = ChekoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  Future<List<OrderModel>> fetchUserOrders() async{
    try{
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e){
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
      return [];
    }
  }

  void processOrder(double totalAmount) async {
try
{
// Start Loader
FullScreenLoader.openLoadingDialog('Processing your order', '');
// Get user authentication Id
final userId = AuthenticationRepository.instance.authUser!.uid;
if (userId.isEmpty) return;

final order = OrderModel(

id: UniqueKey().toString(),
userId: userId,
status: OrederStatus.pending,
totalAmount: totalAmount,
orderDate: DateTime.now(),
paymentMethod: checkoutController.selectedPaymentMethod.value.name, 
address: addressController.selectedAddress.value,

deliveryDate: DateTime.now(),
items: cartController.cartItems.toList(),
); 

await orderRepository.saveOrder (order, userId);
// Update the cart status cartController.clearCart();
cartController.clearCart();

Get.off(()=> SuccessScreen(
image: 'assets/images/email_verify/mission.gif',
title: 'Payment Success!',
subTitle: 'Your item will be shipped soon!',
onPressed: () => Get.offAll(() => const Navigation_bar()),
)); // SuccessScreen
} catch (e) {
TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
}
  }
}
