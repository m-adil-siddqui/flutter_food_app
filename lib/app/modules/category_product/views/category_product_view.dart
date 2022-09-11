import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/category_product_controller.dart';
import 'components/body_view.dart';

class CategoryProductView extends GetView<CategoryProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyView(),
    );
  }
}
