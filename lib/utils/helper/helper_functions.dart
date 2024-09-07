


//helper functions we need like screenheight, getcolor, navigate to other screen




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class THelperFunctions{

  static Color? getColor(String value){
    if (value == "Green"){
      return Colors.green;
    }else if (value == "Red"){
      return Colors.red;
    }else if (value == "Blue"){
      return Colors.blue;
    }else if (value == "Black"){
      return Colors.black;
    }else if (value == "White"){
      return Colors.white;
    }else if (value == "Yellow"){
      return Colors.yellow;
    }else if (value == "Pink"){
      return Colors.pink;
    }
    return null;
  }


  static Size screenSize(){
    return MediaQuery.of(Get.context!).size;}

  static double screenHeight(){
    return MediaQuery.of(Get.context!).size.height;  
  }
  static String getFormattedDate(DateTime date, {String format = 'dd MM yyyy'}){
    return DateFormat(format).format(date);
  }
  
  static double screenWidth(){
    return MediaQuery.of(Get.context!).size.width;  
  }
  static bool isDarkMode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }
}