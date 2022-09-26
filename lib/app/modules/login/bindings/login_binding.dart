import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    print('------------------- login binding---');
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
