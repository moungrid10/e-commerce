
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/common/widgets/CircularContainer.dart';
import 'package:e_commerce/common/widgets/RoundedBanner.dart';
import 'package:e_commerce/common/widgets/shimmer.dart';
import 'package:e_commerce/features/shop/controllers/banners_controller.dart';
import 'package:e_commerce/features/shop/screens/home/HomeController.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Slidebanners extends StatelessWidget {
  const Slidebanners({
    super.key, 
  });


  @override
  Widget build(BuildContext context) {
    final bannercontroller = Get.put(BannersController());
    final controller = Get.put(HomeController());
    return Obx(
      (){

        if(bannercontroller.isLoading.value) return ShimmerEffect(width: double.infinity, height: 190);

        if(bannercontroller.banners.isEmpty){
        return Center(child: Text('No data Found'),);
        
        } else {
        return Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              onPageChanged: (index, reason) => controller.updatePageIndicator(index),
              viewportFraction: 1,
            ),
            items:bannercontroller.banners.map((banner) => TRoundedBanner(imageUrl: banner.imageUrl, isNetworkImage: true, onPressed: ()=> Get.toNamed(banner.targetScreen),)).toList(), 
           
      
              
            
          ),
          const SizedBox(height: TSizes.spaceBetweenItems),
          Center(
            child: Obx(
              () => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < bannercontroller.banners.length; i++)
                    TCircularContainer(
                      width: 20,
                      height: 4,
                      margin: const EdgeInsets.only(right: 10),
                      backgroundColor: controller.carousalControllerIndex.value == i
                            ? TColors.primary
                            : TColors.grey,
                      
                    ),
                ],
              ),
            ),
          ),
          
          
      
        ],
      );}}
    );
  }
}
