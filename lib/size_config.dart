import 'package:flutter/material.dart';

class SizeConfig{
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation _orientation;

  void init(BuildContext context){
     _mediaQueryData = MediaQuery.of(context);
     screenWidth     = _mediaQueryData.size.width;
     screenHeight    = _mediaQueryData.size.height;
     _orientation    = _mediaQueryData.orientation;
  } 
}

double getScreenHeight(double _height){
  double height = SizeConfig.screenHeight;
  return (_height / 812.0) * height;
}

double getScreenWidth(double _width){
  double width = SizeConfig.screenWidth;
  return (_width / 375.0) * width;
}