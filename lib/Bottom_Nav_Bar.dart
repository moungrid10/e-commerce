
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/features/shop/screens/settings/settings.dart';
import 'package:e_commerce/features/shop/screens/store/store.dart';
import 'package:e_commerce/features/shop/screens/wishlist/wishlist.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Navigation_bar extends StatelessWidget {
  const Navigation_bar({super.key});

  @override
  Widget build(BuildContext context){
    final controller = Get.put(NavBar_Controller());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value ,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: dark? Colors.black : Colors.white,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
        
        ],
        
        
        ),
      ),
      body: Obx(()=> controller.screens[controller.selectedIndex.value]),
    );
     

  }
   
  
  
  
  
  
  
  }
  class NavBar_Controller extends GetxController{
    final Rx<int> selectedIndex = 0.obs;

    final screens=[ const HomeScreen(),const Store(),const Wishlist(),const Settings()];

   }
