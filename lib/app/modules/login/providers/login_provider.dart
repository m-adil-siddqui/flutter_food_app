import 'dart:async';
import 'dart:io';
// import 'dart:convert';
import 'package:get/get.dart';
// import 'package:dio/dio.dart';
// import 'package:dio/src/form_data.dart'; 



// class LoginProvider {
//   @override
//   static var client = http.Client();
//   void onInit() {
//   }



// Future editProfile(data, id) async{
//     try{
      
//       var formData = FormData({
//         'id'        : id,
//         'full_name' : data['full_name'],
//         'email'     : data['email'],
//         'phone'     : data['phone'],
//         'dob'       : data['dob'],
//       });
//      final res =  await client.post(Uri.parse("http://10.0.2.2:3000/api/auth/edit_profile"), body: formData);

//       // if(res.statusCode.){
//         // return Future.error(res.statusText!);
//       // }else{
//       //   // 62b85a2ea0d79bfb4ac43558
//       //   return res;
//       return res;
//       // }
//     }on TimeoutException catch(er){
//       print(er);
//     }
//     catch(exception){
//       return Future.error(exception.toString());
//     }
//   }



// }






class LoginProvider extends GetConnect{

  @override
  void onInit() {
  }

  Future login(Map data) async{
    try{

      final res = await post("http://10.0.2.2:3000/api/auth/login", data);
      if(res.status.hasError){
        return Future.error(res.statusText!);
      }else{
        return res;
      }
      
    }catch(exception){
      return Future.error(exception.toString());
    }
  }



Future editProfile(data,  file) async{
    try{
      
      var pic = MultipartFile(File(file), filename: 'profile.jpg');

      var formData  = FormData({
        'id'        : data['id'],
        'full_name' : data['full_name'],
        'email'     : data['email'],
        'phone'     : data['phone'],
        'dob'       : data['dob'],
        'image'     : pic
      });
      
      final res = await post("http://10.0.2.2:3000/api/auth/edit_profile", formData,
       headers: {
        "Content-Length": "${formData.length}",
        'Content-Type': "multipart/form-data; boundary=${formData.boundary}",
        });
        
      if(res.status.hasError){
        return Future.error(res.statusText!);
      }
      return res;
    }on TimeoutException catch(er){
      return Future.error(er.toString());
    }
    catch(exception){
      return Future.error(exception.toString());
    }
  }

  get _headers => {
    //  "Authorization": "Bearer $token",
      "Content-Type": "application/json",
      "Accept": "application/json",
  };

}



