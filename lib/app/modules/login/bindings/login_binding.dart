import 'package:food_delivery_app/app/modules/login/providers/login_provider.dart';
import 'package:get/get.dart';

// import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    print('------------------- login binding---');
    Get.lazyPut<LoginProvider>(() => LoginProvider());
    // Get.lazyPut<LoginController>(() => LoginController());
  }
}
