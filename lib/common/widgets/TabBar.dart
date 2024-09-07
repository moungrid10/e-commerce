
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/device/device_functions.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({
    super.key,
    required this.tabs,

  });

  final List<Widget> tabs;
  


  @override
  Widget build(BuildContext context){
  final dark = THelperFunctions.isDarkMode(context);
    return  Material(
      color: dark? TColors.black: TColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: TColors.primary,
        labelColor: dark? TColors.white:TColors.primary,
        unselectedLabelColor: TColors.darkGrey,
        


        

      ),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(TdeviceUtils.getAppBarHeight());
  
}