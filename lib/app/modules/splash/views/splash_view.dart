import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../size_config.dart';
import '../../login/controllers/login_controller.dart';
import '../controllers/splash_controller.dart';
import 'components/body_view.dart';

class SplashView extends GetView<SplashController> {
  
  SplashView({Key? key}) : super(key: key);
  final _loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    _loginController.checkApiTokenStatus();
    _loginController.getUserFromStorage();
    SizeConfig().init(context);
    return Scaffold(
      body: BodyView(),
    );
  }
}
