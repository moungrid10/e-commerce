
import 'package:e_commerce/common/widgets/TGridLayout.dart';
import 'package:e_commerce/common/widgets/TProductcardVertical.dart';
import 'package:e_commerce/features/shop/models/allProducts_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SortableProduct extends StatelessWidget {
  const SortableProduct({
    super.key, required this.products,
  });
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllproductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField( 
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          value: controller.selectedSortOption.value,
        items: ['Name','Higher rating','Newest','Lower Price','Sale','Popularity',]
        .map((option) => DropdownMenuItem(value: option,child: Text(option)))
        .toList(),
        onChanged: (value){
          controller.sortProducts(value!);
        }),
        SizedBox(height:TSizes.spaceBetweenSections,),
        Obx(()=> TGridLayout(itemCount: controller.products.length, itemBuilder: (_,index)=> TProductCardVertical(product: controller.products[index],)))
    
    
    
    
      ],
    );
  }
}