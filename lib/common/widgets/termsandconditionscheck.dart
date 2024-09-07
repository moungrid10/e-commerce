
import 'package:e_commerce/features/authentification/screens/Signup/SignUpController.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndConditionsCheckbox extends StatelessWidget {
  const TermsAndConditionsCheckbox({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
        final controller = Signupcontroller.instance;

        final dark = THelperFunctions.isDarkMode(context);

    return Row(
      children:[ 
      SizedBox(width: 24,height: 24,child: Obx(()=> Checkbox(value: controller.privacypolicy.value, onChanged: (value)=> controller.privacypolicy.value = !controller.privacypolicy.value))),
      const SizedBox(width: TSizes.spaceBetweenItems,),
    
      Text.rich(
        TextSpan(
          children: [ 
            TextSpan(text: 'I agree to', style:  Theme.of(context).textTheme.bodySmall),
            TextSpan(text: ' Privacy Policy ', style: Theme.of(context).textTheme.bodyMedium!.apply(color: dark? TColors.white: TColors.primary,
            decoration: TextDecoration.underline,
            
            decorationColor: dark? TColors.white: TColors.primary,) ),
            TextSpan(text: 'And', style:  Theme.of(context).textTheme.bodySmall),
            TextSpan(text: ' Terms of use', style: Theme.of(context).textTheme.bodyMedium!.apply(color: dark? TColors.white: TColors.primary,
            decoration: TextDecoration.underline,
            
            decorationColor: dark? TColors.white: TColors.primary,) ),
      ]))
      
      ]);
  }
}
