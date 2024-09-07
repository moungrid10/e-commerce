import 'package:e_commerce/features/authentification/screens/Forget%20_Password/forget_passwors_controller.dart';
import 'package:e_commerce/features/authentification/screens/Login/login.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Reset_Password extends StatelessWidget {
  const Reset_Password({super.key, required this.email});


  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: ()=> Get.offAll(() => const LoginScreen()), icon: const Icon(CupertinoIcons.clear))],
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [

              Image(image: const AssetImage("assets/images/email_verify/password.gif"), 
              width: THelperFunctions.screenWidth() * 0.6,),
              const SizedBox(height: TSizes.spaceBetweenSections,),

              Text(email, style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBetweenItems,),
              Text("Passsword Reset E-Mail sent", style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBetweenItems,),
              Text("Check your inbox for a link to reset your password.", style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              
              
                const SizedBox(height: TSizes.spaceBetweenSections + 20,),
                SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=>Get.offAll(() => const LoginScreen()),child: const Text("Done"),),),
                
                const SizedBox(height: TSizes.spaceBetweenItems,),
                SizedBox(width: double.infinity,child: TextButton(onPressed: () => ForgetPassworsController.instance.resendPasswordResetEmail(email),child: const Text("Resend Email"),),),


            ],
          ),
        ),
      ),
    );
  }
}
