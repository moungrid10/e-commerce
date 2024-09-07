import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/common/widgets/TGridLayout.dart';
import 'package:e_commerce/common/widgets/TProductcardVertical.dart';
import 'package:e_commerce/common/widgets/appbar.dart';
import 'package:e_commerce/common/widgets/sortableproducts.dart';
import 'package:e_commerce/common/widgets/vertical_product_shimmer.dart';
import 'package:e_commerce/features/shop/models/allProducts_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Allproduct extends StatelessWidget {
  const Allproduct({super.key, required this.title, this.query, this.futureMethode});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethode;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllproductsController());

    return Scaffold(
      appBar: TAppBar(title: Text(title),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: FutureBuilder(
          future: futureMethode ?? controller.fetchProductsByQuery(query),
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
            return SortableProduct(products: products,);
            }),
        ),

      ),
    );
  }
}
