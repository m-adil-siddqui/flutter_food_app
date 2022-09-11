import 'dart:async';

import 'package:get/get.dart';

import '../product_model.dart';

class ProductProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.timeout = const Duration(seconds: 60);
    httpClient.defaultDecoder = (map) {
      // timeout: const Duration(seconds: 30);
      if (map is Map<String, dynamic>) return Product.fromJson(map);
      if (map is List)
        return map.map((item) => Product.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Product?> getProduct(int id) async {
    final response = await get('product/$id');
    return response.body;
  }

  Future<Response<Product>> postProduct(Product product) async =>
      await post('product', product);
  Future<Response> deleteProduct(int id) async => await delete('product/$id');

  Future<List<Product>> getProducts() async{
    try{
      final response = await get('https://n-online-food-delivery.herokuapp.com/api/product');
      
      if(response.status.hasError){
        return Future.error(response.statusText!);
      }else{
        return productFromJson(response.body);
      }
    } on TimeoutException catch (timeOutException) {
        return Future.error("Bad request!");
    }
    catch(exception){
      return Future.error(exception.toString());
    }
  }


  Future<List<Product>> searchProducts(query) async{
    try{
      final response = await get("https://n-online-food-delivery.herokuapp.com/api/product/search/${query}");
      if(response.status.hasError){
        return Future.error(response.statusText!);
      }else{
        return productFromJson(response.body);
      }
    }catch(exception){
      return Future.error(exception.toString());
    }
  }


  // 
  Future<List<Product>> fetchProductsByCategory(id) async{
     try{
      final response = await get("https://n-online-food-delivery.herokuapp.com/api/product/by-category/${id}");
      if(response.status.hasError){
        return Future.error(response.statusText!);
      }else{
        return productFromJson(response.body);
      }
    }catch(exception){
      return Future.error(exception.toString());
    }
  }

  Future<Product> fetchSingleProduct(id) async{
    try{
      final response = await get("https://n-online-food-delivery.herokuapp.com/api/product/${id}");
      if(response.status.hasError){
        return Future.error(response.statusText!);
      }else{
        return singleProductFromJson(response.body);
      }
    }catch(exception){
      return Future.error(exception.toString());
    }
  }
}


