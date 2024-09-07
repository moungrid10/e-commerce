import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TCurvedEdges extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    var path = Path();
    path.lineTo(0, size.height);
    final firstCurve = Offset(0, size.height - 20);
    final SecondCurve = Offset(30, size.height - 20);

    path.quadraticBezierTo(firstCurve.dx, firstCurve.dy, SecondCurve.dx, SecondCurve.dy);

    final thirdCurve = Offset(0, size.height - 20);
    final forthCurve = Offset(size.width -30 , size.height -20 );

    path.quadraticBezierTo(thirdCurve.dx, thirdCurve.dy, forthCurve.dx, forthCurve.dy);

    final fiveCurve = Offset(size.width, size.height - 20);
    final sixCurve = Offset(size.width , size.height );

    path.quadraticBezierTo(fiveCurve.dx, fiveCurve.dy, sixCurve.dx, sixCurve.dy);


    path.lineTo(size.width, 0);
    path.close(); 



    

    return path;

  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper){
    return true;
  }
}