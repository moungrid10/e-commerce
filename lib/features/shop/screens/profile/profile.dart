import 'package:e_commerce/common/style/user_controller.dart';
import 'package:e_commerce/common/widgets/SectionTitle.dart';
import 'package:e_commerce/common/widgets/TCircleImage.dart';
import 'package:e_commerce/common/widgets/appbar.dart';
import 'package:e_commerce/common/widgets/shimmer.dart';
import 'package:e_commerce/features/shop/screens/profile/change_name.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return  Scaffold
    (
       appBar: const TAppBar(
        showBackArrow: true,
        title: Text("Profile"),

       ),
       body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Obx((){
                  final networkImage = controller.user.value.profilePicture;
                  final image = networkImage.isNotEmpty ? networkImage : "assets/images/homme.png";
                  


                  return controller.imageUploading.value
                  ? ShimmerEffect(width: 80, height: 80, radius: 80,)
                  : TCircleImage(
                image: image, width: 80, height: 80,isNetworkImage: networkImage.isNotEmpty,);
                }),
                TextButton(onPressed: () => controller.uploadUserProfilePicture(), child: const Text("change Profile Picture")
                )
            
              ],
            ),
          ),
          const SizedBox(height: TSizes.spaceBetweenItems / 2,),
          const Divider(),
          const SizedBox(height: TSizes.spaceBetweenItems,),
          const TSectionHeading(title:"Profile Information", showActionButton: false, ),
          const SizedBox(height: TSizes.spaceBetweenItems,),


          TProfileWidget(title: "Name",value: controller.user.value.fullName,onPressed: ()=> Get.to(()=> ChangeName()),),
          TProfileWidget(title: "Username",value: controller.user.value.username,onPressed: (){},),

          const SizedBox(height: TSizes.spaceBetweenItems,),
          const Divider(),
          const SizedBox(height: TSizes.spaceBetweenItems,),

          TProfileWidget(title: "User ID",value: controller.user.value.id,onPressed: (){},icon: Iconsax.copy,),

          TProfileWidget(title: "E-Mail",value: controller.user.value.email,onPressed: (){},),
          TProfileWidget(title: "Phone Numbere",value:controller.user.value.phoneNumber,onPressed: (){},),
          TProfileWidget(title: "Gender",value: "Male",onPressed: (){},),
          TProfileWidget(title: "Date of Birth",value: "10 oct 1995",onPressed: (){},),


          Center(
            
            child: TextButton(
              onPressed: ()=> controller.deleteAccountWarningPopup(),
              child: const Text("Close Account", style: TextStyle(color: Colors.red),),),
          )


        ],),
       ),

    );
  }
}

class TProfileWidget extends StatelessWidget {
  const TProfileWidget({
    super.key,
    required this.onPressed,
    required this.title,
    required this.value,
    this.icon= Iconsax.arrow_right_34,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBetweenItems / 1.5),
        child: Row(
          children: [
            Expanded(flex: 3 ,child: Text(title, style: Theme.of(context).textTheme.bodySmall, overflow: TextOverflow.ellipsis,)),
            Expanded(flex: 5,child: Text(value, style: Theme.of(context).textTheme.bodyMedium, overflow: TextOverflow.ellipsis,)),
            Expanded(child: Icon(icon, size: 18,)),
          ],
        ),
      ),
    );
  }
}