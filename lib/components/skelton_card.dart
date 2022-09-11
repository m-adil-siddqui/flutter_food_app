import 'package:flutter/material.dart';

import '../size_config.dart';

class SkeltonCard extends StatelessWidget {
  SkeltonCard({ Key? key, this.height, this.width, this.radius = 10 }) : super(key: key);
  final double? height, width;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
        padding: EdgeInsets.all(getScreenWidth(radius)),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: BorderRadius.all(Radius.circular(16))
        ),
      );
  }
}