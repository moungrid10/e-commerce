import 'package:e_commerce/common/widgets/network_manager.dart';
import 'package:e_commerce/features/shop/controllers/cart_controller.dart';
import 'package:e_commerce/features/shop/controllers/chekout_controller.dart';
import 'package:e_commerce/features/shop/controllers/variation_controller.dart';
import 'package:e_commerce/features/shop/screens/address/address_controller.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(AddressController());
    Get.put(ChekoutController());
    
    
  }
}