import 'package:get/get.dart';

import '../../login/providers/login_provider.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginProvider>(() => LoginProvider());
    Get.lazyPut<EditProfileController>(
      () => EditProfileController(),
    );
  }
}
