import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/common/style/user_controller.dart';
import 'package:e_commerce/common/widgets/CircularContainer.dart';
import 'package:e_commerce/common/widgets/SectionTitle.dart';
import 'package:e_commerce/common/widgets/SliderBanners.dart';
import 'package:e_commerce/common/widgets/TGridLayout.dart';
import 'package:e_commerce/common/widgets/TProductcardVertical.dart';
import 'package:e_commerce/common/widgets/TSearchContainer.dart';
import 'package:e_commerce/common/widgets/TverticalImageText.dart';
import 'package:e_commerce/common/widgets/appbar.dart';
import 'package:e_commerce/common/widgets/curved_edges_clippath.dart';
import 'package:e_commerce/common/widgets/iconCounter.dart';
import 'package:e_commerce/common/widgets/shimmer.dart';
import 'package:e_commerce/common/widgets/vertical_product_shimmer.dart';
import 'package:e_commerce/features/shop/controllers/product_controller.dart';
import 'package:e_commerce/features/shop/screens/home/hoe_categories.dart';
import 'package:e_commerce/features/shop/screens/product_detaills/allProduct.dart';
import 'package:e_commerce/features/shop/screens/sub_categories/sub_categories.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    final productcontroller = Get.put(ProductController());


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: TCurvedEdges(),
              child: Container(
                color: TColors.primary,
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                  height: 400,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 150,
                        right: -220,
                        child: TCircularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1),),
                      ),
                      Positioned(
                        top: -150,
                        right: -250,
                        child: TCircularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1),),
                      ),
                      Column(
                        children: [
                          TAppBar(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome!",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .apply(color: TColors.grey),
                                ),
                                Obx(
                                  (){ 
                                    if(controller.profileLoading.value){
                                       return const ShimmerEffect(width: 80, height: 15);
                                    } else {
                                      return Text(
                                    controller.user.value.fullName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .apply(color: TColors.white),
                                    );
                                    }
                                    
                                    }
                                ),
                              ],
                            ),
                            actions: [
                              TcarticonCounter( onPressed: (){} ),
                            ],
                          ),
                          const SizedBox(height: TSizes.spaceBetweenSections),
                          const TSearchContainer(text: "Search in Store",),
                          const SizedBox(height: TSizes.spaceBetweenSections),
                          Padding(
                            padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const TSectionHeading(title: "Popular Categories",textColor: TColors.white,),
                                const SizedBox(height: TSizes.spaceBetweenItems),
                                THomeCategories(),
                                
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
             Padding(
              padding:  const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const Slidebanners(),
                  const SizedBox(height: TSizes.spaceBetweenSections,),

                   TSectionHeading(title: "Popular Categories",showActionButton: true,onPressed: ()=> Get.to(
                    ()=>Allproduct(
                      title: "Popular Products",
                      futureMethode: productcontroller.fetchAllFeaturedProducts(),
                    ))),
                   const SizedBox(height: TSizes.spaceBetweenItems,),


                  Obx((){
                    if (productcontroller.isLoading.value) return TVerticalProductShimmer();

                    if (productcontroller.featuredProducts.isEmpty){
                      return Center(child: Text('No data found!', style: Theme.of(context).textTheme.bodyMedium,),
                      );                 
                    }
                    return TGridLayout(
                    itemCount: productcontroller.featuredProducts.length,
                    itemBuilder: (_, index) =>  TProductCardVertical(product: productcontroller.featuredProducts[index],),);
                  })
                ],
              ),
              
            ),
            
          ],
        ),
      ),
    );
  }
}

