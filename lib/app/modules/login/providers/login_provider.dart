import 'dart:async';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;



class LoginProvider {
  @override
  static var client = http.Client();
  void onInit() {
  }



Future editProfile(data, id) async{
    try{
      
     final res =  await client.post(Uri.parse("http://10.0.2.2:3000/api/auth/edit_profile/${id}"), body: data);

      // final res = await client.post(", body: data).timeout(Duration(seconds: 30));
      // if(res.status.hasError){
      //   return Future.error(res.statusText!);
      // }else{
      //   // 62b85a2ea0d79bfb4ac43558
      //   return res;
      print(res);
      return res;
      // }
    }on TimeoutException catch(er){
      print(er);
    }
    catch(exception){
      return Future.error(exception.toString());
    }
  }




}






// class LoginProvider extends GetConnect {
//   @override
//   // TODO: implement httpClient
//   GetHttpClient get httpClient => super.httpClient;
//   @override
//   void onInit() {
//     // httpClient.timeout = const Duration(seconds: 30);
//     print('-on----------------------------');
//     baseUrl = 'http://10.0.2.2:3000';
//   }

//   Future login(Map data) async{
//     try{
//       // final res = await post("https://n-online-food-delivery.herokuapp.com/api/auth/login", data);
//       final res = await post("http://10.0.2.2:3000/api/auth/login", data).timeout(Duration(seconds: 30));
//       if(res.status.hasError){
//         return Future.error(res.statusText!);
//       }else{
//         // setToken("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyYjg1YTJlYTBkNzliZmI0YWM0MzU1OCIsImVtYWlsIjoibWFkaWxAYmVhcnBsZXguY29tIiwiaWF0IjoxNjYzNDQ3NjcxLCJleHAiOjE2NjM0NTEyNzF9.AJhovpgSLVsSdMlnU0mQfMsQRE6W11KFuimTMyn-mrk");
//         return res;
//       }
//     }catch(exception){
//       return Future.error(exception.toString());
//     }
//   }



// Future editProfile(data, id) async{
//     try{
      
      
//       final res = await httpClient.post("http://10.0.2.2:3000/api/auth/edit_profile/${id}", body: data).timeout(Duration(seconds: 30));
//       if(res.status.hasError){
//         return Future.error(res.statusText!);
//       }else{
//         // 62b85a2ea0d79bfb4ac43558
//         return res;
//       }
//     }on TimeoutException catch(er){
//       print(er);
//     }
//     catch(exception){
//       return Future.error(exception.toString());
//     }
//   }




// }



