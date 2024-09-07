import 'package:e_commerce/features/authentification/controllers_onboarding/onBorading_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/device/device_functions.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';

class OnBoardingClass extends StatelessWidget {
  const OnBoardingClass({super.key});

  @override
  Widget build(BuildContext context) {


    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(OnboradingController());


    return Scaffold(
      body: Stack(
        children:[ PageView(
          controller: controller.pageController,
          onPageChanged: controller.updatePageIndicator,
          
          children: [
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  Image(
                    width: THelperFunctions.screenWidth() * 0.8,
                    height: THelperFunctions.screenHeight() * 0.6,
                    image: const AssetImage("assets/images/onBoerding/search.gif"),
                  ),
                  Text(
                    "Search your Product",
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: TSizes.spaceBetweenItems),
                  Text(
                    "Explore a wide range of products tailored to your needs and preferences. Start your journey with us and find what you're looking for effortlessly.",
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  Image(
                    width: THelperFunctions.screenWidth() * 0.8,
                    height: THelperFunctions.screenHeight() * 0.6,
                    image: const AssetImage("assets/images/onBoerding/payment-app.gif"),
                  ),
                  Text(
                    "Secure and Easy Payments",
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: TSizes.spaceBetweenItems),
                  Text(
                    "Make payments with confidence using our secure credit card processing. Your financial information is protected with the highest standards of security.",
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  Image(
                    width: THelperFunctions.screenWidth() * 0.8,
                    height: THelperFunctions.screenHeight() * 0.6,
                    image: const AssetImage("assets/images/onBoerding/delivery-truck.gif"),
                  ),
                  Text(
                    "Fast and Reliable Delivery",
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: TSizes.spaceBetweenItems),
                  Text(
                    "Get your orders delivered swiftly and reliably right to your doorstep. Experience the convenience of timely and hassle-free delivery with every purchase",
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          
          
          ],
          ),
            Positioned(top: TdeviceUtils.getAppBarHeight() ,right: TSizes.defaultSpace,child: TextButton(onPressed: ()=>OnboradingController.instance.skipPage(), child: const Text('Skip'))),

            Positioned(left:0,right:0,bottom:TdeviceUtils.getBottomNavBarHeight() + 30.0, child:Center(child: SmoothPageIndicator(controller: controller.pageController,onDotClicked: controller.dotNavigateFunction ,count: 3,effect: ExpandingDotsEffect(activeDotColor: dark? TColors.light : TColors.black, dotHeight: 6),))),

            Positioned(right:TSizes.defaultSpace,bottom: TdeviceUtils.getBottomNavBarHeight(),child: ElevatedButton(
              onPressed: ()=> OnboradingController.instance.nextPage(),
              style: ElevatedButton.styleFrom(shape: const CircleBorder(), backgroundColor:dark? TColors.primary : Colors.black),
              child:  const Icon(Iconsax.arrow_right_3),


            ))

        
        ]
      ),
    );
  }
}
