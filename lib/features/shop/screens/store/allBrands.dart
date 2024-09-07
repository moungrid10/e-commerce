import 'package:e_commerce/common/widgets/SectionTitle.dart';
import 'package:e_commerce/common/widgets/TBrandCard.dart';
import 'package:e_commerce/common/widgets/TGridLayout.dart';
import 'package:e_commerce/common/widgets/appbar.dart';
import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:e_commerce/features/shop/screens/store/Brand_shimmer.dart';
import 'package:e_commerce/features/shop/screens/store/brand_controller.dart';
import 'package:e_commerce/features/shop/screens/store/brand_products.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Allbrands extends StatelessWidget {
  const Allbrands({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.Instance;
    return Scaffold(
      appBar: TAppBar(title: Text("Brands",style: Theme.of(context).textTheme.headlineMedium,),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            TSectionHeading(title: "Brands",),
            SizedBox(
             height: TSizes.spaceBetweenSections,
            ),

            Obx(
                    (){
                      if(controller.isLoading.value) return BrandShimmer();

                      if (controller.allBrands.isEmpty){
                      return Center(child: Text('No data found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),
                      );                 
                    }

                     return TGridLayout(itemCount: controller.allBrands.length,mainAxisExtent: 80 ,
                     itemBuilder: (_, index){
                      final brand = controller.allBrands[index];
                       return  TBrandCard(showBorder: true, brand: brand,);
                          
                          
                    });
                  }
                    
                  )

          ],
        ),),
      ),
    );
  }
}