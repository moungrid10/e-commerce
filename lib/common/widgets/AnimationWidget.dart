import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AnimationloaderWidget extends StatelessWidget {
  const AnimationloaderWidget({super.key, required this.text, required this.animation, this.actionText,  this.showAction = false,  this.onActionPressed});

  final String text, animation;
  final String? actionText;
  final bool showAction;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return  Center
    (
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.8),
          SizedBox(height: TSizes.defaultSpace,),
          Text(text,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
          ),
          SizedBox(height: TSizes.defaultSpace,),
          showAction 
          ? SizedBox(
            width: 250,
            child: OutlinedButton(onPressed: onActionPressed,style: OutlinedButton.styleFrom(backgroundColor: TColors.black),
            child: Text(actionText!,
            style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.light),

            )
             ),
          )
          : SizedBox(),


        ],
      ),
    );
  }
}