
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/device/device_functions.dart';
import 'package:flutter/material.dart';

class TRAtingProgressIndicator extends StatelessWidget {
  const TRAtingProgressIndicator({
    super.key,required this.text, required this.value,
  });
  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(flex: 1,child: Text(text, style: Theme.of(context).textTheme.bodyMedium ,)),
    
      Expanded(
        flex: 11,
        child: SizedBox(
          width: TdeviceUtils.getScreenWidth(context) * 0.8,
          child: LinearProgressIndicator(
            value: value,
            minHeight: 14,
            backgroundColor: TColors.grey,
            valueColor:const AlwaysStoppedAnimation(TColors.primary) ,
            borderRadius: BorderRadius.circular(7),
          
          ),
        ),
      )
    
    
      
    ],);
  }
}