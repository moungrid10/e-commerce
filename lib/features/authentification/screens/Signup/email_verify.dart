import 'package:e_commerce/data/repositories.authentication/authentication_repository.dart';
import 'package:e_commerce/features/authentification/screens/Login/login.dart';
import 'package:e_commerce/features/authentification/screens/Signup/SuccesScreen.dart';
import 'package:e_commerce/features/authentification/screens/Signup/verify_email_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: ()=> AuthenticationRepository.instance.logout(), icon: const Icon(CupertinoIcons.clear))],
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Image(image: const AssetImage("assets/images/email_verify/email.gif"), 
              width: THelperFunctions.screenWidth() * 0.6,),
              const SizedBox(height: TSizes.spaceBetweenSections,),
              Text(email ?? "", style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBetweenItems,),
              Text("Congratulations! your acount awaits: Verify your email to start shopping and experience this big world", style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              
              
                 SizedBox(height: TSizes.spaceBetweenSections + 20,),
                SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=>Get.to(() => controller.checkEmailVerificationStatus() ),child:  Text("Verify"),),),
                
                const SizedBox(height: TSizes.spaceBetweenItems,),
                SizedBox(width: double.infinity,child: TextButton(onPressed: ()=> controller.sendEmailVerification(),child: const Text("Resend Email"),),),


            ],
          ),
        ),
      ),
    );
  }
}
