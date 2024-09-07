
import 'package:e_commerce/common/widgets/TGridLayout.dart';
import 'package:e_commerce/common/widgets/TProductcardVertical.dart';
import 'package:e_commerce/common/widgets/TverticalImageText.dart';
import 'package:e_commerce/common/widgets/category_shimmer.dart';
import 'package:e_commerce/features/shop/controllers/category_controller.dart';
import 'package:e_commerce/features/shop/screens/sub_categories/sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx((){
      if(categoryController.isLoading.value) return CategoryShimmer();

      if(categoryController.featuredCategories.isEmpty){
        return Center(child: Text('No Data Found', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),);

      }
      return SizedBox(
                                    height: 80,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: categoryController.featuredCategories.length,
                                      itemBuilder: (_, index) {
                                        final category = categoryController.featuredCategories[index];
                                        return ImageTextCategories(title: category.name,image: category.image,onTap: ()=>Get.to(()=>  SubCategories(category: category,)),);
                                            }
                                            
                                        
                                        )
                                      );
                                      }
    );
                                    }
                                 
                                }
    
    
    
    
    
    