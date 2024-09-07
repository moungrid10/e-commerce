
import 'package:e_commerce/common/widgets/termsandconditionscheck.dart';
import 'package:e_commerce/features/authentification/screens/Signup/SignUpController.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/validator/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Signupcontroller());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  controller: controller.firstname,
                  validator: (value)=>TValidator.validateEmptyText(value,'First Name'),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: "First Name",
                  ),
                ),
              ),
              const SizedBox(width: TSizes.spaceBetweeninputField),
              Flexible(
                child: TextFormField(
                  controller: controller.lastname,
                  validator: (value)=>TValidator.validateEmptyText(value,'Last Name'),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: "Second Name",
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBetweeninputField),
          TextFormField(
            controller: controller.username,
            validator: (value)=>TValidator.validateEmptyText(value,'User Name'),

            decoration: const InputDecoration(
              
              prefixIcon: Icon(Iconsax.user_edit),
              labelText: "Username",
            ),
          ),
          const SizedBox(height: TSizes.spaceBetweeninputField),
          TextFormField(
            controller: controller.email,
            validator: (value)=>TValidator.validateEmail( value),

            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: "E-Mail",
            ),
          ),
          const SizedBox(height: TSizes.spaceBetweeninputField),
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value)=>TValidator.validatePhoneNumber( value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              labelText: "Phone Number",
            ),
          ),
          const SizedBox(height: TSizes.spaceBetweeninputField),
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

          const SizedBox(height: TSizes.spaceBetweenItems),

              TermsAndConditionsCheckbox(),
                
                const SizedBox(height: TSizes.spaceBetweenSections,),


                SizedBox(width: double.infinity,child:
                 ElevatedButton(onPressed: ()=>controller.signup(),
                 child: const Text("Sign up"),),),
        ],
      ),
    );
  }
}
