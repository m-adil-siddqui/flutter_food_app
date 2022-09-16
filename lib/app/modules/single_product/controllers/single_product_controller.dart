import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/helper.dart';
import '../../product/product_model.dart';
import '../../product/providers/product_provider.dart';

class SingleProductController extends GetxController {
   Rxn<Product> product = Rxn<Product>();
   var isLoading    = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

   void fetchSingleProduct(id) {
      try{
        isLoading.value = true;
        ProductProvider().fetchSingleProduct(id).then((res){
          isLoading.value = false;
          product.value = res;
        },onError: (err){
          isLoading.value = false;
          print(err.toString());
          showSnackBar("Err", err.toString(), Colors.redAccent);
        } 
        );
    }catch(exception){
      isLoading.value = false;
      print(exception.toString());
      showSnackBar("Exception!", exception.toString(), Colors.redAccent);
    }
  }
}
