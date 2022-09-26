import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/config/helper.dart';
import 'package:get/get.dart';
import '../../product/product_model.dart';
class CartController extends GetxController {

  var cartItems = [].obs;

  double get totalPrice => cartItems.fold(0, (sum, item) => sum + (item.price!.toDouble() * item.qty));
  num get totalQty => cartItems.fold(0, (sum, item) => sum + item.qty);

  
  @override
  void onInit() async{
    super.onInit();
  }
    

  void addToCart(Product product){
    if(!cartItems.contains(product)){
        product.qty++;
        cartItems.add(product); 
    }else{
        product.qty++;
        cartItems[cartItems.indexWhere((element) => element.id == product.id)] = product;
    }
  }

 
  void incrementToCart(Product? product){
    if(cartItems.contains(product)){
      product?.qty++;
      cartItems[cartItems.indexWhere((element) => element.id == product?.id)] = product;
    }else{
      showSnackBar("Cart info", "Add to cart this product before increment", Colors.black);
    }
  }

  void decrementToCart(Product? product){
    if(cartItems.contains(product)){
      product?.qty--;
      if(product?.qty == 0){
        this.removeFromCart(product);
      }else{
        cartItems[cartItems.indexWhere((element) => element.id == product?.id)] = product;
      }
    }else{
      showSnackBar("Cart info", "This product is not exist in cart", Colors.black);
    }
  }


  void removeFromCart(product){
    product.qty = 0;
    cartItems.remove(product);
  }

}
