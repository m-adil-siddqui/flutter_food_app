import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/config/helper.dart';
import 'package:food_delivery_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:food_delivery_app/app/modules/category/providers/category_provider.dart';
import 'package:food_delivery_app/app/modules/product/product_model.dart';
import 'package:food_delivery_app/app/modules/product/providers/product_provider.dart';
import 'package:get/get.dart';

import '../../../config/api_token.dart';
import '../../category/category_model.dart';

class HomeController extends GetxController {
  var categoryList = <Category>[].obs;
  var productListByCategory = <Product>[].obs;
  var productList = <Product>[].obs;
  var isLoading    = true.obs;
  var isCatsLoading    = true.obs;
  Rxn<Product> product = Rxn<Product>();

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    // print( await isTokenValid());
    fetchCategories();
    fetchProducts();
  }

  @override
  void onReady() async{
    super.onReady();
     
  }

  void fetchCategories(){
    try{
      isLoading.value = true;
      CategoryProvider().getCategories().then((res){
        print(res[0].title);
        isCatsLoading.value = false;
        categoryList.value = res;
      },onError: (err){
        isCatsLoading.value = false;
        print(err.toString());
        print('-------------------------');
        showSnackBar("Err", err.toString(), Colors.redAccent);
      } 
      );
    }catch(exception){
        isCatsLoading.value = false;
        print(exception.toString());
      showSnackBar("Exception!", exception.toString(), Colors.redAccent);
    }
  }


  void fetchProducts(){
    try{
      isLoading.value = true;
      ProductProvider().getProducts().then((res){
        print(res[0].title);
        isLoading.value = false;
        productList.value = res;
      },onError: (err){
        isLoading.value = false;
        print(err.toString());
        print('-------------------------p');
        showSnackBar("Err", err.toString(), Colors.redAccent);
      } 
      );
    }catch(exception){
        isLoading.value = false;
        print(exception.toString());
      showSnackBar("Exception!", exception.toString(), Colors.redAccent);
    }
  }



  void fetchProductsByCategory(id){
    try{
      isLoading.value = true;
      ProductProvider().fetchProductsByCategory(id).then((res){
        // print(res[0].title);
        isLoading.value = false;
        productListByCategory.value = res;
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


   

  @override
  void onClose() {}
  void increment() => count.value++;
}
