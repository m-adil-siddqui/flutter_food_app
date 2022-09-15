import 'dart:convert';

import 'package:food_delivery_app/app/modules/cart/cart_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../product/product_model.dart';

class CartController extends GetxController {

  var cartItems = [].obs;
  var cartItem  = [].obs;
  
  
  SharedPreferences? pref;
  // int get count  => cartItem.length;
  var count = 0.obs;
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price!.toDouble());
  // var totalAmount = 0.0;

  @override
  void onInit() async{
    super.onInit();
    pref = await SharedPreferences.getInstance();
    // cartList();
    // pref?.remove("cart");

  }
    

  void addToCart(Product product){
  //  cartList();
  //  totalQty();
    var cart_provider = pref?.getString('cart');

    if(cart_provider == null){
      var cart = new Cart(items: {});
      cart.addToCart(product, product.id);
      pref?.setString('cart', jsonEncode(cartToJson(cart)));

    }else{

      var cd = pref?.getString('cart');
      Map decodee = jsonDecode(cd.toString());
      var cart = new Cart(items: decodee['items'], totalPrice: decodee['totalPrice'], totalQty: decodee['totalQty']);
      cart.addToCart(product, product.id);
      pref?.setString('cart', jsonEncode(cartToJson(cart)));

    }

    cart_provider = pref?.getString("cart");
    Map<String, dynamic> decoded_cart = jsonDecode(cart_provider.toString());

    print(decoded_cart['items']);
    decoded_cart['items'][product.id]['item'] =  Product.fromJson(decoded_cart['items'][product.id]['item']);
    cartItems.add(decoded_cart['items']);
    print(cartItems);


    // if(cartItems.singleWhere((item) => item.id == product.id)){
  //   if ((cartItems.singleWhere((it) => it.itemId == product.id,
  //         orElse: () => null)) != null) {
    
  //   print('Already exists!');
  // } else {
  //   print('Added!');
  // }
    // }
    // print(cartItems);
        // decoded_cart['items'].forEach((key, val){
          
        //   val['item'] = Product.fromJson(decoded_cart['items'][key]['item']);
        //   print(val);

        //   cartItem.add(val);
        // });
        

    // if(!cartItems.contains(product)){
    //     totalAmount = totalPrice;
    //     cartItems.add(product); 
    // }else{
    //   showSnackBar("Cart!", "This item already in your cart", Colors.black);
    // }
  }

  void totalQty(){
    var cd = pref?.getString("cart");
    if(cd != null){
      Map<String, dynamic> decoded_cart = jsonDecode(cd.toString());
      count.value = decoded_cart['totalQty'];
    }
    count.value;
  }

  cartList(){
      var cd = pref?.getString("cart");

      if(cd != null){
        cartItem = [].obs;
        Map<String, dynamic> decoded_cart = jsonDecode(cd.toString());
        decoded_cart['items'].forEach((key, val){
          
          val['item'] = Product.fromJson(decoded_cart['items'][key]['item']);
          print(val);

          cartItem.add(val);
        });
        
        // print(cartItem);
        return cartItem;
      }
    return [];
  }

  double totalAmount(){
    var cd = pref?.getString("cart");
    if(cd != null){
      Map<String, dynamic> decoded_cart = jsonDecode(cd.toString());
      // print(decoded_cart['totalPrice']);
      return decoded_cart['totalPrice'];
    }
    return 0.0;
  }


    int totalItems(){
      var cd = pref?.getString("cart");
      if(cd != null){
        Map<String, dynamic> decoded_cart = jsonDecode(cd.toString());
        // print(decoded_cart['items'].length);
        return decoded_cart['items'].length;
      }
    return 0;
  }

  void removeFromCart(product){
    cartItems.remove(product);
  }

}
