import 'package:e_commerce/common/widgets/TBrandCard.dart';
import 'package:e_commerce/common/widgets/appbar.dart';
import 'package:e_commerce/common/widgets/sortableproducts.dart';
import 'package:e_commerce/common/widgets/vertical_product_shimmer.dart';
import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:e_commerce/features/shop/screens/store/brand_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller= BrandController.Instance;
    return Scaffold(
      appBar: TAppBar(title: Text(brand.name,style: Theme.of(context).textTheme.headlineMedium,),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            TBrandCard(showBorder: true,brand: brand,),
            SizedBox(height: TSizes.spaceBetweenItems,),
            FutureBuilder(
              future: controller.getBrandProducts(brandId: brand.id),
              
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

            final brandproducts = snapshot.data!;
                return SortableProduct(products:brandproducts,);}
              ),
          ],
        ),),
      ),
    );
  }
}