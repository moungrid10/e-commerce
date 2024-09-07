
import 'package:e_commerce/common/widgets/Category_tab.dart';
import 'package:e_commerce/common/widgets/SectionTitle.dart';
import 'package:e_commerce/common/widgets/TBrandCard.dart';
import 'package:e_commerce/common/widgets/TGridLayout.dart';
import 'package:e_commerce/common/widgets/TSearchContainer.dart';
import 'package:e_commerce/common/widgets/TabBar.dart';
import 'package:e_commerce/common/widgets/appbar.dart';
import 'package:e_commerce/common/widgets/iconCounter.dart';
import 'package:e_commerce/features/shop/controllers/category_controller.dart';
import 'package:e_commerce/features/shop/screens/store/Brand_shimmer.dart';
import 'package:e_commerce/features/shop/screens/store/allBrands.dart';
import 'package:e_commerce/features/shop/screens/store/brand_controller.dart';
import 'package:e_commerce/features/shop/screens/store/brand_products.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Store extends StatelessWidget {
  const Store({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;
    final dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text("Store", style: Theme.of(context).textTheme.headlineMedium,),
          actions: [TcarticonCounter( onPressed: (){},)],
        ),
        body: NestedScrollView(headerSliverBuilder: (_, innerBoxIsScrolled){
          return [
            SliverAppBar(
              pinned: true,
              floating: true,
              backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.black:TColors.white ,
              expandedHeight: 440,
              automaticallyImplyLeading: false,
      
              flexibleSpace: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const TSearchContainer(text: "Search", showBorder: true,showBackground: false,padding: EdgeInsets.all(0),),
                  const SizedBox(height: TSizes.spaceBetweenSections,),
      
                  TSectionHeading(title: "Featured Brands",showActionButton: true,onPressed: ()=>Get.to(()=>Allbrands()),),
      
                  const SizedBox(height: TSizes.spaceBetweenItems/1.5,),
      
                  Obx(
                    (){
                      if(brandController.isLoading.value) return BrandShimmer();

                      if (brandController.featuredBrands.isEmpty){
                      return Center(child: Text('No data found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),
                      );                 
                    }

                     return TGridLayout(itemCount: brandController.featuredBrands.length,mainAxisExtent: 80 ,
                     itemBuilder: (_, index){
                      final brand = brandController.featuredBrands[index];
                       return  TBrandCard(showBorder: true, brand: brand,onTap:()=> Get.to(()=> BrandProducts(brand: brand,)),);
                          
                          
                    }
                    );
                  }
                    
                  )
      
                  
      
                ],),
              ),
              bottom:  TTabBar(
                
                tabs: categories.map((category) => Tab(child: Text(category.name))).toList()
                ),
            )
          ];
        }, body:   TabBarView(children: categories.map((category)=> TCategory_tab(categories: category)).toList() ,)),
      ),
    );}}
