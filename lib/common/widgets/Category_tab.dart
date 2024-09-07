
import 'package:e_commerce/common/widgets/SectionTitle.dart';
import 'package:e_commerce/common/widgets/TGridLayout.dart';
import 'package:e_commerce/common/widgets/TProductcardVertical.dart';
import 'package:e_commerce/common/widgets/brand_show_case.dart';
import 'package:e_commerce/common/widgets/category_brands.dart';
import 'package:e_commerce/common/widgets/vertical_product_shimmer.dart';
import 'package:e_commerce/features/shop/controllers/category_controller.dart';
import 'package:e_commerce/features/shop/models/categories_model.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/screens/product_detaills/allProduct.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TCategory_tab extends StatelessWidget {
  const TCategory_tab({
    super.key,required this.categories,
  });
  final CategoryModel categories;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return  ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children:[ Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(children: [
        
        CategoryBrands(category: categories,),

        const SizedBox(height: TSizes.spaceBetweenSections,),
      
        FutureBuilder(
          future: controller.getCategoryProducts(categoryId: categories.id),
           builder: (context, snapshot) {

             const loader = TVerticalProductShimmer();
            if(snapshot.connectionState == ConnectionState.waiting){
              return loader;
            }
            if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty){
              return Center(child: Text('No Data Found'));
            }
            if(snapshot.hasError){
              return Center(child: Text('Something went wrong'));

            }

            final products = snapshot.data!;
             return Column(children:[ 
            TSectionHeading(title: "You might like", onPressed: ()=> Get.to(Allproduct(title: categories.name,
            futureMethode: controller.getCategoryProducts(categoryId: categories.id),
            ) ),showActionButton: true,),
            const SizedBox(height: TSizes.spaceBetweenItems,),
                
                
          TGridLayout(itemCount: products.length, itemBuilder: (_,index) =>  TProductCardVertical(product: products[index],)),
            ]
            );
           }) 
       
        
      
      
      
        
      ],),
      ),
    ]);
  }
}
