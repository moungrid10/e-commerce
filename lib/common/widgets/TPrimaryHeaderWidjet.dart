import 'package:e_commerce/common/widgets/CircularContainer.dart';
import 'package:e_commerce/common/widgets/TCurvedEdgeWidjet.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({super.key,
  required this.child,});

  final Widget child;

  @override
  Widget build(BuildContext context) {


    return TCurvedEdgeContainer(
              child: SizedBox(
                 
                  child: Container(
                    color: TColors.primary,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 150,
                          right: -220,
                          child: TCircularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1),),
                        ),
                        Positioned(
                          top: -150,
                          right: -250,
                          child: TCircularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1),),
                        ),
                        child,
                        ]
                        ),
                  ),
                      
                      ),
              )

            ;}}