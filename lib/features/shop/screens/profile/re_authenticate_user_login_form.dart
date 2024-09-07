import 'package:e_commerce/common/style/user_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/validator/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(

      appBar: AppBar(title: Text("Re-Authenticate User"),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Form(
          key: controller.reAuthFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.verifyEmail,
              validator: TValidator.validateEmail,
              decoration: InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: "E-Mail"),
            ),
            SizedBox(height: TSizes.spaceBetweeninputField,),

            Obx(() => TextFormField(
              obscureText: controller.hidePassword.value,
              controller: controller.verifyPassword,
              validator:(value)=> TValidator.validateEmptyText(value, "Password"),
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: IconButton(onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                icon: Icon(Iconsax.eye_slash)),
              ),
            )),
            SizedBox(height: TSizes.spaceBetweenSections,),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: ()=> controller.reAuthenticateEmailAndPasswordUser(), child: Text("Verify")),
            )

          ],
        )),),
        
      ),
    );
  }
}