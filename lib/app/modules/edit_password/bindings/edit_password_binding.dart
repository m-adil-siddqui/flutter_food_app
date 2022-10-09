import 'package:get/get.dart';

import '../../login/providers/login_provider.dart';
import '../controllers/edit_password_controller.dart';

class EditPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginProvider>(() => LoginProvider());
    Get.lazyPut<EditPasswordController>(() => EditPasswordController());
  }
}
