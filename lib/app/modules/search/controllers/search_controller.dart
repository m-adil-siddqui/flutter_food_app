import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/modules/product/providers/product_provider.dart';
import 'package:get/get.dart';

import '../../../config/helper.dart';
import '../../product/product_model.dart';

class SearchController extends GetxController {
  var searchProductList = <Product>[].obs;
  var searchInput = RxString('');
  var isLoading =  RxBool(false);
 
  @override
  void onInit() {
    super.onInit();

    debounce(searchInput, (value) async{
      try{
        if(searchInput != ''){

          isLoading(true);
          
          ProductProvider().searchProducts(searchInput).then((resp) {
            if(resp != null && resp.length != 0){
              searchProductList.value = resp;
            }else{
              isLoading.value = false;
              searchProductList.value = [];
            }
          }, onError: (err){
            isLoading.value = false;
            print(err.toString());
            showSnackBar("Exception!", err.toString(), Colors.redAccent);
          });
          
        }else{
          isLoading.value = false;
          searchProductList.value = [];
        }
      }catch(exception){
        isLoading.value = false;
        print(exception.toString());
        showSnackBar("Exception!", exception.toString(), Colors.redAccent);
    }
     
    }, time: Duration(seconds: 1));
  }

  void onChange(val){
      searchInput.value = val;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
