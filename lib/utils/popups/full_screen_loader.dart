import 'package:e_commerce/common/widgets/AnimationWidget.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullScreenLoader{


  static void openLoadingDialog(String text, String animation){
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!) ? TColors.black:TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 250,),
              AnimationloaderWidget(text: text, animation: animation),
            ],
          ),
        )
        )
      
      );
  }

  static stopLoading(){
  Navigator.of(Get.overlayContext!).pop();
}


}

