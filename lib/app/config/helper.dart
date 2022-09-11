import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnackBar(String title, String message, Color backgroundColor){
  Get.snackbar(title, message,
  backgroundColor: backgroundColor,
  isDismissible: true,
  snackPosition: SnackPosition.BOTTOM,
  forwardAnimationCurve: Curves.easeOutBack,
  colorText: Colors.white,
  duration: Duration(seconds: 4),
  );
}