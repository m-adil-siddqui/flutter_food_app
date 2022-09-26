import 'dart:async';

import 'package:get/get.dart';

import '../category_model.dart';

class CategoryProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.timeout = const Duration(seconds: 60);
    httpClient.defaultDecoder = (map) {
      // timeout: const Duration(seconds: 30);
      if (map is Map<String, dynamic>) return Category.fromJson(map);
      if (map is List)
        return map.map((item) => Category.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'https://n-online-food-delivery.herokuapp.com';
  }

  // Future<Category?> getCategory(int id) async {
  //   final response = await get('category/$id');
  //   return response.body;
  // }

  Future getCategories() async{
    try{
      final response = await get('https://n-online-food-delivery.herokuapp.com/api/category').timeout(Duration(seconds: 30));
      if(response.status.hasError){
        return Future.error(response.statusText!);
      }else{
        return categoryFromJson(response.body);
      }
    } on TimeoutException catch (timeOutException) {
        return Future.error("Bad request!");
    }
    catch(exception){
      return Future.error(exception.toString());
    }
  }

  // Future<Response<Category>> postCategory(Category category) async =>
  //     await post('category', category);
  // Future<Response> deleteCategory(int id) async => await delete('category/$id');
}
