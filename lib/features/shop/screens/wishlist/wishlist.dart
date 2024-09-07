import 'package:e_commerce/Bottom_Nav_Bar.dart';
import 'package:e_commerce/common/widgets/TCircleIcon.dart';
import 'package:e_commerce/common/widgets/TGridLayout.dart';
import 'package:e_commerce/common/widgets/TProductcardVertical.dart';
import 'package:e_commerce/common/widgets/appbar.dart';
import 'package:e_commerce/common/widgets/vertical_product_shimmer.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/features/shop/screens/wishlist/favorite_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = FavoriteController.instance; 
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
          title: Text("Wishlist", style: Theme.of(context).textTheme.headlineMedium,),
          actions: [TCircleIcon(icon: Iconsax.add, onPressed: ()=> Get.off(() => Navigation_bar()),)],
        ),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(
            ()=> FutureBuilder(
              future: controller.FavoriteProducts() ,
              builder: (context, snapshot) {
                const loader = TVerticalProductShimmer();
              if(snapshot.connectionState == ConnectionState.waiting){
                return loader;
              }
              if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty){
                return Center(child: Text('Whoops! Wishlist is empty ..'));
              }
              if(snapshot.hasError){
                return Center(child: Text('Something went wrong'));
            
              }
            
              final products = snapshot.data!;
            
            
              return TGridLayout(itemCount: products.length, itemBuilder: (_,index) =>  TProductCardVertical(product:  products[index],));
            
              }
              ),
          ),
        )),




    );}}