

import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();


  final carousalControllerIndex = 0.obs;

  void updatePageIndicator(index){
    carousalControllerIndex.value= index;
  }
}
