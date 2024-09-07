import 'package:e_commerce/common/widgets/Product_attributes.dart';
import 'package:e_commerce/common/widgets/Product_image_slider.dart';
import 'package:e_commerce/common/widgets/SectionTitle.dart';
import 'package:e_commerce/common/widgets/TbottommAddtoCart.dart';
import 'package:e_commerce/common/widgets/product_meta_data.dart';
import 'package:e_commerce/common/widgets/rating_and_share.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/screens/product_detaills/product_reviews.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ProductDetaiils extends StatelessWidget {
  const ProductDetaiils({super.key,required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar:  Tbottommaddtocart(product: product),
      body: SingleChildScrollView(
        child: Column(children: [

           TProductImageSlider(product: product,),

          Padding(padding: const EdgeInsets.only(right: TSizes.defaultSpace,left: TSizes.defaultSpace,bottom: TSizes.defaultSpace),
          child: Column(
            children: [

              const TRatingAndShare(),

               TProductMetaData(product: product,),

              // if(product.productType == ProductType.variable.toString())
               TProductAttribut(product: product,),
               SizedBox(height: TSizes.spaceBetweenSections,),
              
              SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){}, child: const Text("Chekout")),),

              const SizedBox(height: TSizes.spaceBetweenSections,),
              const TSectionHeading(title: "Desciption",showActionButton: false,),
              const SizedBox(height: TSizes.spaceBetweenItems,),
               ReadMoreText(product.description ?? "",
              trimLines: 2,
              trimMode: TrimMode.Line,
              trimExpandedText: ' Less',
              trimCollapsedText: ' Show more',
              moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
              lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800) ,),
              const Divider(),
              const SizedBox(height: TSizes.spaceBetweenItems,),
              
              TSectionHeading(title: "Reviews (199)", showActionButton: true,onPressed: () => Get.to(()=> const ProductReviewsScreen()),),

              


              const SizedBox(height: TSizes.spaceBetweenSections,),




            ],
          ),)
        ],),
      ),


    );
  }
}
