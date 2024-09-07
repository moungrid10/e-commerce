import 'package:e_commerce/common/widgets/RoundedContainer.dart';
import 'package:e_commerce/common/widgets/SectionTitle.dart';
import 'package:e_commerce/features/shop/controllers/chekout_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChekoutController());
        final dark = THelperFunctions.isDarkMode(context);

    return  Column(
      children: [
        TSectionHeading(title: "Payment Method",
        buttonTitle: "Change",
        showActionButton: true,
        
        onPressed: ()=> controller.selectPaymentMethod(context),),
        SizedBox(height: TSizes.spaceBetweenItems / 2,),


        Obx(
          ()=> Row(children: [
            TRroundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark? TColors.light : TColors.white,
              padding: EdgeInsets.all(TSizes.sm),
              child: Image(image: AssetImage(controller.selectedPaymentMethod.value.image),fit: BoxFit.contain,),
            ),
            SizedBox(width: TSizes.spaceBetweenItems / 2,),
            Text(controller.selectedPaymentMethod.value.name, style: Theme.of(context).textTheme.bodyLarge,)
          
          
          ],),
        )


      ],
    );
  }
}