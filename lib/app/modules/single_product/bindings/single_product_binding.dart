import 'package:get/get.dart';

import '../controllers/single_product_controller.dart';

class SingleProductBinding extends Bindings {
  @override
  void dependencies() {
    print("---------------------------------------dddd");
    // Get.put(SingleProductController());
     Get.lazyPut<SingleProductController>(
      () => SingleProductController(),
    );
  }
}
