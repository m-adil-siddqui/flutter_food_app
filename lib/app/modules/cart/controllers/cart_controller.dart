import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/config/helper.dart';
import 'package:food_delivery_app/app/modules/cart/cart_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../product/product_model.dart';

class CartController extends GetxController {

  var cartItems = <Product>[].obs;
  
  
  SharedPreferences? pref;
  int get count  => cartItems.length;
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price!.toDouble());
  var totalAmount = 0.0;

  @override
  void onInit() async{
    super.onInit();
    pref = await SharedPreferences.getInstance();
  }
    

  void addToCart(Product product){

    var cart = pref?.getString('cart');
    if(cart == null){
      var ct = new Cart(items: {});
      ct.addToCart(product, product.id);
      
      var toJson = cartToJson(ct);
      var j      = jsonEncode(toJson);
      pref?.setString('cart', j);

    }else{
      var cd =pref?.getString('cart');
      Map decodee = jsonDecode(cd.toString());
      var ct = new Cart(items: decodee['items'], totalPrice: decodee['totalPrice'], totalQty: decodee['totalQty']);
      ct.addToCart(product, product.id);
      pref?.setString('cart', jsonEncode(cartToJson(ct)));


    }

    // if(!cartItems.contains(product)){
    //     totalAmount = totalPrice;
    //     cartItems.add(product); 
    // }else{
    //   showSnackBar("Cart!", "This item already in your cart", Colors.black);
    // }
  }

  void removeFromCart(Product product){
    cartItems.remove(product);
  }

}
