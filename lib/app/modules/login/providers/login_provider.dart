import 'package:food_delivery_app/app/config/api_token.dart';
import 'package:get/get.dart';

import '../user_model.dart';

class LoginProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<User> login(Map data) async{
    try{
      final res = await post("https://n-online-food-delivery.herokuapp.com/api/auth/login", data);
      if(res.status.hasError){
        return Future.error(res.statusText!);
      }else{
        setToken(res.body['data']['token']);
        return User.fromJson(res.body['data']['user']);
      }
    }catch(exception){
      return Future.error(exception.toString());
    }
  }
}
