import 'package:e_commerce/common/widgets/SectionTitle.dart';
import 'package:e_commerce/common/widgets/SettingMenu.dart';
import 'package:e_commerce/common/widgets/TPrimaryHeaderWidjet.dart';
import 'package:e_commerce/common/widgets/UserProfiule.dart';
import 'package:e_commerce/common/widgets/appbar.dart';
import 'package:e_commerce/data/repositories.authentication/authentication_repository.dart';
import 'package:e_commerce/features/shop/screens/address/adrress.dart';
import 'package:e_commerce/features/shop/screens/cart/cartScreen..dart';
import 'package:e_commerce/features/shop/screens/profile/profile.dart';
import 'package:e_commerce/features/shop/screens/settings/order.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(child: Column(
              children: [
                TAppBar(title: Text("Account", style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),),),

                 TUserProfileTile(onPressed: () => Get.to(()=> const ProfileScreen())),
                const SizedBox(height: TSizes.spaceBetweenSections,), 


              ],
            )),
           Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
           child: Column(
            children: [
              const TSectionHeading(title: "Acount Settings", ),
              const SizedBox(height: TSizes.spaceBetweenItems),

              TSettingMenuTile(title: "My address",subtitle: "Set shipping delivery address", icon: Iconsax.safe_home,onTap: ()=>Get.to(()=> const UserAddressScreen()),),
              TSettingMenuTile(title: "My cart",subtitle: "Add, remove products and move to checkout", icon: Iconsax.shopping_cart,onTap: ()=>Get.to(()=>CartScreen()),),
              TSettingMenuTile(title: "My orders",subtitle: "In_progress and Completed Orders", icon: Iconsax.bag_tick,onTap: ()=>Get.to(()=>OrderScreen()),),
              TSettingMenuTile(title: "Bank Account",subtitle: "Withdraw balance to registred bank account", icon: Iconsax.bank,onTap: (){},),
              TSettingMenuTile(title: "My Coupons",subtitle: "List of all the discounted coupons", icon: Iconsax.discount_shape,onTap: (){},),
              TSettingMenuTile(title: "Notifications",subtitle: "Set any kind of notifications message", icon: Iconsax.notification,onTap: (){},),
              TSettingMenuTile(title: "Acount Privacy",subtitle: "Manage data usage and connected accounts", icon: Iconsax.security_card,onTap: (){},),

              const SizedBox(height: TSizes.spaceBetweenItems),
              const TSectionHeading(title: "App Settings", showActionButton: false,),
              const SizedBox(height: TSizes.spaceBetweenItems),
              TSettingMenuTile(title: "Load Data",subtitle: "upload data to your Cloud Firebase", icon: Iconsax.document_upload,onTap: (){},),
              TSettingMenuTile(title: "Geolocation",subtitle: "Set recommendation based on location", icon: Iconsax.document_upload,onTap: (){},
              trailing: Switch(value: true, onChanged: (value){}),),
              TSettingMenuTile(title: "Safe Mode",subtitle: "Search result is safe for all ages", icon: Iconsax.document_upload,onTap: (){},
              trailing: Switch(value: false, onChanged: (value){}),),
              TSettingMenuTile(title: "HD Image Quality",subtitle: "Set image quality to be seen", icon: Iconsax.document_upload,onTap: (){},
              trailing: Switch(value: true, onChanged: (value){}),),

              const SizedBox(height: TSizes.spaceBetweenSections),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(onPressed: ()=>AuthenticationRepository.instance.logout(), child: const Text("Logout")),
              ),
              const SizedBox(height: TSizes.spaceBetweenSections * 1.5,)

              


            ],
           ),
           
           ) 
          ],
        ),



      )
      );
      
      }}
