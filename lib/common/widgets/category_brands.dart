import 'package:e_commerce/common/widgets/List_tile_shimmer.dart';
import 'package:e_commerce/common/widgets/boxes_shimmer.dart';
import 'package:e_commerce/common/widgets/brand_show_case.dart';
import 'package:e_commerce/features/shop/models/categories_model.dart';
import 'package:e_commerce/features/shop/screens/store/brand_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.Instance;
    return  FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot){
        const loader = Column(
          children: [
            ListtileShimmer(),
            SizedBox(height: TSizes.spaceBetweenItems,),
            BoxesShimmer(),
            SizedBox(height: TSizes.spaceBetweenItems,),


          ],
        );

        if(snapshot.connectionState == ConnectionState.waiting){
              return loader;
            }
            if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty){
              return Center(child: Text('No Data Found'));
            }
            if(snapshot.hasError){
              return Center(child: Text('Something went wrong'));

            }

            final brands = snapshot.data!;



        return ListView.builder(
          shrinkWrap: true,
          physics:  NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          itemBuilder: (_,index){
            final brand = brands[index];
            return FutureBuilder(
              future: controller.getBrandProducts(brandId: brand.id, limit: 3),
              builder: (context, snapshot) {
                

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


                return TBrandShowCase(images: products.map((e)=> e.thumbnail!).toList(),brand: brand,);
              },)
              ;
          });
      },
    );
  }
}