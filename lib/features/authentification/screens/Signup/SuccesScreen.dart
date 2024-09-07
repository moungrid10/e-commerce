import 'package:e_commerce/features/authentification/screens/Login/login.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Image(image:  AssetImage(image), 
              width: THelperFunctions.screenWidth() * 0.6,),
              const SizedBox(height: TSizes.spaceBetweenSections,),
              Text(title, style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBetweenItems,),
              Text(subTitle, style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              
              
                const SizedBox(height: TSizes.spaceBetweenSections + 20,),
                SizedBox(width: double.infinity,child: ElevatedButton(onPressed: onPressed,child: const Text("Continue"),),),
                
              
                

              
               

            ],
          ),
        ),
      ),
    );
  }
}
