import 'package:e_commerce/common/widgets/appbar.dart';
import 'package:e_commerce/features/shop/screens/profile/update_name_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/validator/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
   final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text("Change Name"),

       ),
       body: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Use real name for easy verification, this name will appear on several pages",
          style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(height: TSizes.spaceBetweenSections,),

          Form(key: controller.updateUserNameFormKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.firstname,
                validator: (value) => TValidator.validateEmptyText(value, 'First Name'),
                expands: false,
                decoration: InputDecoration(labelText: "First Name", prefixIcon: Icon(Iconsax.user)),

              ),
              SizedBox(height: TSizes.spaceBetweeninputField,),
             
              TextFormField(
                controller: controller.lastname,
                validator: (value) => TValidator.validateEmptyText(value, 'First Name'),
                expands: false,
                decoration: InputDecoration(labelText: "Last Name", prefixIcon: Icon(Iconsax.user)),

              ),
            ],
          ),),
          SizedBox(height: TSizes.spaceBetweenSections,),


          SizedBox(width: double.infinity,
          child: ElevatedButton(onPressed: ()=>controller.updateUserName(), child: Text("Save")),),


        ],
       ),),

    );
  }
}