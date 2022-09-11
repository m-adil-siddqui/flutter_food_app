import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/modules/login/providers/login_provider.dart';
import 'package:food_delivery_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../../../config/helper.dart';
import '../user_model.dart';

class LoginController extends GetxController {

  Rxn<User> user = Rxn<User>();
  var isLoading = RxBool(false);



  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late final TextEditingController emailController, passwordController;
  var email = '';
  var password = '';

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
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
  // void increment() => count.value++;

  String? validateEmail(String val){
    if(!GetUtils.isEmail(val)){
      return "Enter a valid email";
    }else{
      return null;
    }
  }


  String? validatePassword(String val){
    if(val.length < 6){
      return "Password must be of 6 characters";
    }else{
      return null;
    }
  }

  void checkLogin(){
        // removeToken();

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
      var resp =  LoginProvider().login({
        'email' : emailController.text,//emailController.value,
        'password' : passwordController.text
      })      
      .then((resp){
        isLoading.value = false;
        user.value = resp;
        Get.toNamed(Routes.CART);
        // Get.offAllNamed(Routes.CART);
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
}


