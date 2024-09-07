
import 'package:e_commerce/common/widgets/CircularContainer.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,required this.text,required this.selected, this.onSelected,
  });

  final bool selected;
  final String text;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
      label:THelperFunctions.getColor(text) != null? const SizedBox() : Text(text), 
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected? TColors.white:null),
      avatar:THelperFunctions.getColor(text) != null
      ? TCircularContainer(width: 50,height: 50,backgroundColor:THelperFunctions.getColor(text)!,) 
      : null ,
      shape: THelperFunctions.getColor(text) != null? const CircleBorder() : null,
      labelPadding:THelperFunctions.getColor(text) != null? const EdgeInsets.all(0) :null,
      padding:THelperFunctions.getColor(text) != null? const EdgeInsets.all(0): null,
      backgroundColor: THelperFunctions.getColor(text),),
    );
  }
}