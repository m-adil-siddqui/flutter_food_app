import 'package:flutter/material.dart';
import 'package:food_delivery_app/theme.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async{
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      title: "Application",
      theme: theme(),
      debugShowCheckedModeBanner:false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
