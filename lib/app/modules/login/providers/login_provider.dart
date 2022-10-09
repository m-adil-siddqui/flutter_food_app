import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';

import '../../../../constants.dart';

class LoginProvider extends GetConnect{


  @override
  void onInit() {
    httpClient.baseUrl            = localBaseUrl;
    httpClient.defaultContentType = "application/json";
    httpClient.timeout            = const Duration(seconds: 30);
    super.onInit();
  }


  Future login(Map data) async{
    try{

      final res = await post("/api/auth/login", data);
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
      
      final res = await post("/api/auth/edit_profile", formData,
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


  Future updatePassword(Map data) async {
    try{
      print(data);
      var res = await post("/api/auth/update-password", data);
      if(res.status.hasError){
        return Future.error(res.body['message']);
      }
      return res;
    }catch(err){
      Future.error(err.toString());
    }
  }

  get _headers => {
    //  "Authorization": "Bearer $token",
      "Content-Type": "application/json",
      "Accept": "application/json",
  };

}



