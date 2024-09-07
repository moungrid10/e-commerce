
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/device/device_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({
    super.key,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,
    this.title,
    this.actions,

  });

  final IconData? leadingIcon;
  final VoidCallback? leadingOnPressed;
  final bool showBackArrow;
  final Widget? title;
  final List<Widget>? actions;
  


  @override
  Widget build(BuildContext context){
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        title: title,
        actions: actions,
        leading: showBackArrow ?
        IconButton(onPressed: () => Get.back(), icon: const Icon(Iconsax.arrow_left))
        : leadingIcon != null ?IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)) : null,



        

      ),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(TdeviceUtils.getAppBarHeight());
  
}