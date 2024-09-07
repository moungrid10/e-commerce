import 'package:e_commerce/common/widgets/RoundedBanner.dart';
import 'package:e_commerce/common/widgets/RoundedContainer.dart';
import 'package:e_commerce/common/widgets/SectionTitle.dart';
import 'package:e_commerce/common/widgets/TBrandTitleWithVerification.dart';
import 'package:e_commerce/common/widgets/TCircleIcon.dart';
import 'package:e_commerce/common/widgets/TProductCardHorizontal.dart';
import 'package:e_commerce/common/widgets/TProductTitleText.dart';
import 'package:e_commerce/common/widgets/appbar.dart';
import 'package:e_commerce/common/widgets/horixontal_product_shimmer.dart';
import 'package:e_commerce/common/widgets/vertical_product_shimmer.dart';
import 'package:e_commerce/features/shop/controllers/category_controller.dart';
import 'package:e_commerce/features/shop/models/categories_model.dart';
import 'package:e_commerce/features/shop/screens/product_detaills/allProduct.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SubCategories extends StatelessWidget {
  const SubCategories({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
  final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(title: Text(category.name),showBackArrow: true,),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [


            TRoundedBanner(imageUrl: "assets/images/banners/nike1.jpg",width: double.infinity,applyImageRaduis: true,),
            SizedBox(height: TSizes.spaceBetweenSections,),
            


            FutureBuilder(
              future: controller.getSubCategories(category.id) ,

              builder: (context, snapshot) {
                  const loader = HorizontalProductShimmer();
              if(snapshot.connectionState == ConnectionState.waiting){
                return loader;
              }
              if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty){
                return Center(child: Text('Whoops! Wishlist is empty ..'));
              }
              if(snapshot.hasError){
                return Center(child: Text('Something went wrong'));
            
              }
            
              final subCategories = snapshot.data!; 
              return ListView.builder(
                shrinkWrap: true,
                itemCount: subCategories.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_,index){
                  final subCategory = subCategories[index];
                  return FutureBuilder(
                    future: controller.getCategoryProducts(categoryId: subCategory.id),
                    builder: (context, snapshot) {
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


                      return Column(
                          children: [

                    Column(
                      children: [
                        TSectionHeading(title: subCategory.name, showActionButton: true,onPressed: () => Get.to(()=> Allproduct(title: subCategory.name,futureMethode: controller.getCategoryProducts(categoryId: subCategory.id,limit: -1),)),),
                         SizedBox(height: TSizes.spaceBetweenItems / 2,),
                                  
                        SizedBox(
                          height: 120,
                          child: ListView.separated(
                            itemCount: products.length,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) => SizedBox(width: TSizes.spaceBetweenItems,),
                            itemBuilder: (context,index)=> ProductcardHorizontal(product: products[index])),
                        ),
                        SizedBox(height: TSizes.spaceBetweenSections,)
                      ],
                    )
                                  
                    
                                    ],
                                  );
                      
                    } 
                  );

                });
              
              }
            ),

          ],
        ),        
      ),

    );
  }
}