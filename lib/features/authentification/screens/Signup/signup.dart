import 'package:e_commerce/common/widgets/termsandconditionscheck.dart';
import 'package:e_commerce/features/authentification/screens/Login/login_controller.dart';
import 'package:e_commerce/features/authentification/screens/Signup/email_verify.dart';
import 'package:e_commerce/features/authentification/screens/Signup/signupform.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Let's Create a new account :",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBetweenSections),
              SignUpForm(),
              


                


                
                const SizedBox(height: TSizes.spaceBetweenSections,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(child: Divider(color: dark? TColors.darkGrey: TColors.black, thickness: 0.5, indent: 50, endIndent: 5,)),
                    Text("OR SIGN IN", style: Theme.of(context).textTheme.labelMedium,),
                    Flexible(child: Divider(color: dark? TColors.darkGrey: TColors.black, thickness: 0.5, indent: 5, endIndent: 50,)),





                  ],),
                  const SizedBox(height: TSizes.spaceBetweenSections,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100)),
                    child: IconButton(
                      onPressed: (){},
                      icon:
                       const Image(
                        height: TSizes.iconMd,
                        width: TSizes.iconMd,
                        image: AssetImage("assets/images/facebook.png")),),
                  ),
                  const SizedBox(width: TSizes.defaultSpace,),
                   Container(
                    decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100)),
                    child: IconButton(
                      onPressed: ()=> controller.googleSignIn(),
                      icon:
                       const Image(
                        height: TSizes.iconMd,
                        width: TSizes.iconMd,
                        image: AssetImage("assets/images/google.png")),),
                  ),
                  ],)
            ],
          ),
        ),
      ),
    );
  }
}
