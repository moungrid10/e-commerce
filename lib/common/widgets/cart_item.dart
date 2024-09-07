import 'package:e_commerce/common/widgets/RoundedBanner.dart';
import 'package:e_commerce/common/widgets/TBrandTitleWithVerification.dart';
import 'package:e_commerce/common/widgets/TProductTitleText.dart';
import 'package:e_commerce/features/shop/models/cart_item_model.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key, required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image
        TRoundedBanner(
          isNetworkImage: true,
          imageUrl: cartItem.image ?? '',
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBetweenItems),
        
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBrandTextWithVerification(title: cartItem.brandName ?? ''),
              TProductTitleText(title: cartItem.title, maxLines: 1),
              Text.rich(
                TextSpan(
                  children: (cartItem.selectedVariation ?? {}).entries.map(
                    (e) => TextSpan(
                      children: [
                        TextSpan(text: '${e.key}', style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: '${e.value}', style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                  ).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
    
  }
}
