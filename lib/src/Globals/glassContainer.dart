import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final double height, width;
  final dynamic child;

  const GlassContainer({
    Key key,
    this.height,
    this.width,
    this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
          child: Container( 
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: Color.fromRGBO(23, 23, 23, 0.19),
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: Color.fromRGBO(23, 23, 23, 0.21),
              )
            ),
            child: child,
          ),
        ),
      );
  }
}