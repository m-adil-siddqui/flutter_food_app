import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/modules/login/providers/login_provider.dart';
import 'package:food_delivery_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../../../config/api_token.dart';
import '../../../config/helper.dart';
import '../user_model.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';


class LoginController extends GetxController with CacheManager {

  Rxn<User> user = Rxn<User>();
  var isLoading = RxBool(false);
  var isTokenExpire = false.obs;

  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;


  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late final TextEditingController emailController, passwordController, fullNameController, phoneController, dobController;
  
  var email    = '';
  var password = '';
  var fullName = '';
  var phone    = '';
  var dob      = '';


  @override
  void onInit() {
    super.onInit();
    emailController    = TextEditingController();
    passwordController = TextEditingController();
    fullNameController = TextEditingController();
    phoneController    = TextEditingController();
    dobController      = TextEditingController();

  }


   

  void getImage(ImageSource imageSource) async{
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if(pickedFile != null){
      selectedImagePath.value = pickedFile.path;
      Future.delayed(const Duration(milliseconds: 500), (){
         Get.back();
      });
    }else{
      showSnackBar("Message", "No image is selected", Colors.black);
    }
  }

  void  checkApiTokenStatus() async {
    isTokenExpire.value = await isTokenValid();
    if(!isTokenExpire.value){
      removeKey("user");
    }
  }

  void getUserFromStorage() async{
      var u = await getUserInfo;
      if(u != null){
        user.value =  User.fromJson(jsonDecode(u));
      }
  }

  @override
  void onReady(){
    super.onReady();
  }


  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  String? validateEmail(String val){
    if(!GetUtils.isEmail(val)){
      return "Enter a valid email";
    }else{
      return null;
    }
  }

  String? validateFullName(String val){
    if(val == ""){
      return "Your name is required";
    }else{
      return null;
    }
  }


  String? validatePassword(String val){
    if(val.length < 8){
      return "Password must be of 8 characters";
    }else{
      return null;
    }
  }

  void checkLogin(){
    final isValid = loginFormKey.currentState!.validate();
    if(!isValid){
      return;
    }

    loginFormKey.currentState!.save();
    login();
  }

  login() {
    try{

      isLoading.value = true;
      final loginProvider = Get.find<LoginProvider>();

      var resp =  loginProvider.login({
        'email' : emailController.text,
        'password' : passwordController.text
      })      
      .then((resp) async{
        isLoading.value = false;

        setToken("api_token", resp.body['data']['token']);
        setToken("user", jsonEncode(resp.body['data']['user']));
        var u = await getUserInfo;
        user.value = User.fromJson(jsonDecode(u!));
        // print(jsonEncode(resp.body['data']['user']));
        
        // Get.find<LoginController>().checkApiTokenStatus(); 
        isTokenExpire.value = true; 
        //      
        Get.offAllNamed(Routes.HOME);
        
      }, onError: (err){
        isLoading.value = false;
        print(err.toString());
        showSnackBar("Exception!", err.toString(), Colors.red);
      }
      );
    }catch(e){
      isLoading.value=false;
      showSnackBar("Exception!", e.toString(), Colors.red);
    }
  }



  editProfile() async {
    try{

      isLoading.value = true;
      // final dir = await Directory.systemTemp;
      // final targetPath = dir.absolute.path + "/temp.jpg";

      // var compressedFile = await FlutterImageCompress.compressAndGetFile(
      //   selectedImagePath.value, targetPath, quality: 88);

// Connection closed before full header was received

      var formInfo = {
        "id"        : user.value?.id,
        'full_name' : fullNameController.text,
        'email'     : emailController.text,
        'phone'     : phoneController.text,
        'dob'       : dobController.text,
      };

      
      final loginProvider = Get.find<LoginProvider>();

      
      loginProvider.editProfile(formInfo,  selectedImagePath.value)      
      .then((resp) async{
        isLoading.value = false;

        setToken("user", jsonEncode(resp.body['user']));
        print(resp.body);
        var updatedUser = await getUserInfo;
        if(updatedUser != null){
          user.value = User.fromJson(jsonDecode(updatedUser));
        }
        
        //      
        // Get.offAllNamed(Routes.HOME);
        
      }, onError: (err){
        isLoading.value = false;
        print(err.toString());
        showSnackBar("Exception!", err.toString(), Colors.red);
      }
      );
    }catch(e){
      isLoading.value=false;
      showSnackBar("Exception", e.toString(), Colors.red);
    }
  }

  void logout(){
    removeKey("api_token");
    removeKey("user");
    isTokenExpire.value = false; 
  
  }
}


