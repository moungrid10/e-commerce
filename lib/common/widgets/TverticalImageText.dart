
import 'package:e_commerce/common/widgets/TCircleImage.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

class ImageTextCategories extends StatelessWidget {
  const ImageTextCategories({
    super.key, required this.image, required this.title,  this.textColor = TColors.white, this.backgroundColor = TColors.white, this.onTap,this.isNetworkimage = true,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkimage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBetweenItems),
        child: Column(
          children: [
            TCircleImage(image: image,
            fit: BoxFit.fitHeight,
            padding: TSizes.sm * 1.4,
            isNetworkImage: isNetworkimage,
            backgroundColor: backgroundColor,
            overlayColor: dark? TColors.light: TColors.black,),
            const SizedBox(height: TSizes.spaceBetweenItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
