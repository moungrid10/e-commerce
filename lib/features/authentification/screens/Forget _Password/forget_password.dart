import 'package:e_commerce/features/authentification/screens/Forget%20_Password/forget_passwors_controller.dart';
import 'package:e_commerce/features/authentification/screens/Forget%20_Password/reset_passwrof.dart';
import 'package:e_commerce/features/authentification/screens/Login/login.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/validator/validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';



class Forget_Passwrod extends StatelessWidget {
  const Forget_Passwrod({super.key});


 @override
  Widget build (BuildContext context){
    final controller = Get.put(ForgetPassworsController());
    return Scaffold(
      appBar: AppBar(
      automaticallyImplyLeading: false,
      actions: [IconButton(onPressed: () => Get.offAll(()=>const LoginScreen()),icon:const Icon(CupertinoIcons.clear))],
      
      ),
      body: SingleChildScrollView(
        child: Padding(
          
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("Reset Your Password", style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBetweenItems,),
              Text("Enter your email address to receive a password reset link", style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBetweenSections,),

              Form(
                key: controller.forgetPasswordFormKey,

                child: TextFormField(
                  controller: controller.email,
                  validator: TValidator.validateEmail,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right), labelText: "E-mail",
                    ),
                  ),
              ),
                
                const SizedBox(height: TSizes.spaceBetweenSections,),
                SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=> controller.sendPasswordResetEmail(),child: const Text("Submit"),),),
            ],
          ),
          ),
          
      ),
      
    );
  }



}
