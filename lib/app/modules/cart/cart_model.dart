import 'package:food_delivery_app/app/modules/product/product_model.dart';

class Cart{
  Map items = {};
  int totalQty = 0;
  double totalPrice = 0.0;

  Cart({required this.items, this.totalPrice = 0.0, this.totalQty = 0});

  addToCart(Product product, id){
    Map<String, dynamic> storedItem = {'qty': 0, 'price': product.price, 'item' : product}; 
    
    if(items.containsKey(id)){
      storedItem = items[id];
    }

    storedItem['qty']++;   
    items[id] = storedItem;
    totalQty++; 
    totalPrice += product.price!.toDouble();

    print("-------------- cart status -----");
    print(items);
    print(totalPrice);
    print(totalQty);
    print("---------cart status end ---------");
  }
}

cartFromJson(jsonString){
  if(jsonString['products'].length != 0 && jsonString['products'] != null){
    return List<Product>.from(jsonString['products'].map((x) => Product.fromJson(x)));
  }else{
    return <Product>[];
  }
}

Map<String, dynamic> cartToJson(cart){
  return {
    "items" : cart.items,
    "totalQty" : cart.totalQty,
    "totalPrice" : cart.totalPrice,
  };
}