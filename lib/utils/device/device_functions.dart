



//functions related to the device to use in our code like 



import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
class TdeviceUtils{
bool isIOS(){
  return Platform.isIOS;
}
bool isAndroid(){
  return Platform.isAndroid;
}

static double getScreenHeight(){
  return MediaQuery.of(Get.context!).size.height;
}


static double getScreenWidth(BuildContext context){
  return MediaQuery.of(Get.context!).size.width;
}


static double getBottomNavBarHeight(){
  return kBottomNavigationBarHeight;
}

static double getStatusBarHeight(){
  return MediaQuery.of(Get.context!).padding.top;
}

static double getPixelRatio(){
  return MediaQuery.of(Get.context!).devicePixelRatio;
}


static double getAppBarHeight(){
  return kToolbarHeight;
}

static double getKeyboardHeight(){
  return MediaQuery.of(Get.context!).viewInsets.bottom;
}

static bool isKeyboardVisible(){
  final viewInsert = MediaQuery.of(Get.context!).viewInsets;
  return viewInsert.bottom > 0;
}


static Future<void> ShowStatusBar(){
  return SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: SystemUiOverlay.values);
}

static Future<void> HideStatusBar(){
  return SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: []);
}











}