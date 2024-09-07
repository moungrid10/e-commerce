import 'package:e_commerce/common/widgets/TCircleIcon.dart';
import 'package:e_commerce/features/shop/screens/wishlist/favorite_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoriteController());
    return  Obx(()=> TCircleIcon(
      icon: controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart, 
      color: controller.isFavourite(productId) ? TColors.error : null,
      onPressed: () => controller.toggleFavoriteProduct(productId),)
      );
  }
}