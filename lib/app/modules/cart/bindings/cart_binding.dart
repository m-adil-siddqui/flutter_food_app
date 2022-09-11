import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    print("cart binding................................");
    Get.put(CartController(), permanent: true);
  }
}
