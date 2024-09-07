
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/device/device_functions.dart';
import 'package:flutter/widgets.dart';

class TpaddingStyle{
  static  EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: TdeviceUtils.getAppBarHeight(),
    left: TSizes.defaultSpace,
    right: TSizes.defaultSpace,
    bottom: TSizes.defaultSpace,
  );
}