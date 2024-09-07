import 'package:e_commerce/common/widgets/curved_edges_clippath.dart';
import 'package:flutter/material.dart';

class TCurvedEdgeContainer extends StatelessWidget {
  const TCurvedEdgeContainer({super.key,
  required this.child,
  
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {


    return ClipPath(
              clipper: TCurvedEdges(),
              child: child,
            );

  }}