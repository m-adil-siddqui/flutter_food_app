import 'package:food_delivery_app/app/modules/login/controllers/login_controller.dart';
import 'package:get/get.dart';

import '../../cart/controllers/cart_controller.dart';
import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put<BaseProvider>(BaseProvider(), permanent: true);
    Get.lazyPut<SplashController>(() => SplashController());
    Get.put<CartController>(CartController(), permanent: true);
    Get.put<LoginController>(LoginController(), permanent: true);
  }
}