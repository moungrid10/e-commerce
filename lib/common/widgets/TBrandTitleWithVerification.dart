
import 'package:e_commerce/common/widgets/TBrandTitleText.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TBrandTextWithVerification extends StatelessWidget {
  const TBrandTextWithVerification({
    super.key,required this.title , this.brandTextSize = TextSizes.small,  this.maxLines = 1, this.textAlign = TextAlign.center, this.iconColor = TColors.primary, this.textColor,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: TBrandtitletext(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(width: TSizes.sm),
         Icon(
          Iconsax.verify5,
          color: iconColor,
          size: TSizes.iconxs,
        ),
      ],
    );
  }
}
