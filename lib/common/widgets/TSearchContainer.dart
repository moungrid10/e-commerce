
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/device/device_functions.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key, this.icon = Iconsax.search_normal,this.padding = const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),  this.showBackground = true,  this.showBorder = true, required this.text, this.onTap,
  });

    final IconData? icon ;
    final EdgeInsetsGeometry padding;
    final String text;
    final bool showBackground, showBorder;
    final VoidCallback? onTap;




  @override
  Widget build(BuildContext context) {
      final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 50,
          width: TdeviceUtils.getScreenWidth(context),
          decoration: BoxDecoration(
            color: showBackground ? dark ? Colors.black : TColors.light : Colors.transparent,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
            border: showBorder? Border.all(color: TColors.grey) : null,
          ),
          child: Row(
            children: [
               Icon(icon, color: TColors.darkerGrey),
              const SizedBox(width: TSizes.spaceBetweenItems),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
