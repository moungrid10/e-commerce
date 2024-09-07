import 'package:e_commerce/Bottom_Nav_Bar.dart';
import 'package:e_commerce/common/style/padding_style.dart';
import 'package:e_commerce/features/authentification/screens/Forget%20_Password/forget_password.dart';
import 'package:e_commerce/features/authentification/screens/Login/login_controller.dart';
import 'package:e_commerce/features/authentification/screens/Signup/signup.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:e_commerce/utils/validator/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context){
    final controller = Get.put(LoginController());
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: TpaddingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(height: 150,
                  image: AssetImage( dark ? "assets/images/darkmode.PNG" :  "assets/images/lightmode.PNG"),

                  ),
                  Text("Welcome Back!", style: Theme.of(context).textTheme.headlineMedium,),
                  const SizedBox(height: 8.0),
                  Text("Log in to continue your journey with us. Access your account and explore our exclusive features.", style: Theme.of(context).textTheme.bodyMedium,),



                ],

              ),
              const SizedBox(height: TSizes.spaceBetweenSections,),

              Form(
                key: controller.loginFormKey,
                child: Column(children: [
                TextFormField(
                  controller: controller.email,
                  validator: (value)=> TValidator.validateEmail(value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right), labelText: "E-mail",
                  ),
                ),
                const SizedBox(height: TSizes.spaceBetweeninputField,),
                Obx(
            ()=> TextFormField(
              controller: controller.password,
              validator: (value)=>TValidator.validatePassword( value),
              obscureText: controller.hidePasssword.value,
              decoration:  InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: "Password",
                suffixIcon: IconButton(
                  icon: Icon(controller.hidePasssword.value? Iconsax.eye_slash : Iconsax.eye),
                 onPressed:()=> controller.hidePasssword.value = !controller.hidePasssword.value,),
              ),
            ),
          ),
                const SizedBox(height: TSizes.spaceBetweeninputField / 2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                Row(

                  children: [
                    Obx(()=> Checkbox(value: controller.rememberMe.value, onChanged: (value)=> controller.rememberMe.value = !controller.rememberMe.value)),
                    const Text("Remember Me"),


                ],),
                TextButton(onPressed: ()=> Get.to(()=>const Forget_Passwrod()), child: const Text("Forget Password ?")),
                
                ],),



                const SizedBox(height: TSizes.spaceBetweenSections,),
                SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=> controller.emailAndPasswordSignIn(),child: const Text("Sign in"),),),
                const SizedBox(height: TSizes.spaceBetweenItems,),
                SizedBox(width: double.infinity,child: OutlinedButton(onPressed: ()=> Get.to(()=>const SignupScreen()),child: const Text("Create account"),),),


                


                ])),
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
              
          
                ],),
        ),
    
  )
  );
  }
  
}