
import 'package:e_commerce/common/widgets/RoundedContainer.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

class TcouponCode extends StatelessWidget {
  const TcouponCode({
    super.key,
   
  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return TRroundedContainer(
      showBorder: true,
      backgroundColor: dark?TColors.black:TColors.white,
      padding: EdgeInsets.only(top: TSizes.sm,bottom: TSizes.sm,right: TSizes.sm,left: TSizes.md ),
      child: Row(children: [
        Flexible(child: TextFormField(
          decoration: InputDecoration(
            hintText: "Have a promo code? Enter here",
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
    
          ),
          )
          ),
    
          SizedBox(width: 80,
          child: ElevatedButton(onPressed: (){}, child: Text("Apply"),
          style: ElevatedButton.styleFrom(
            foregroundColor: dark? TColors.white.withOpacity(0.5) : TColors.black.withOpacity(0.5),
            backgroundColor: Colors.grey.withOpacity(0.2),
            side: BorderSide(color: Colors.grey.withOpacity(0.1)),
          ),
          ),),
      ],),
    );
  }
}