import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/config/helper.dart';
import 'package:food_delivery_app/app/modules/login/controllers/login_controller.dart';
import 'package:food_delivery_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../login/providers/login_provider.dart';

class EditPasswordController extends GetxController {

  var isLoading = RxBool(false);
  final GlobalKey<FormState> updateFormKey = GlobalKey<FormState>();
  late final TextEditingController passwordController, confirmPasswordController;
  var password = '';
  var confirmPassword = '';


  @override
  void onInit() {
    passwordController        = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  String? validatePassword(String val){
    if(val.length < 8){
      return "Password must be of 8 characters";
    }
    return null;
  }

  String? validateConfirmPassword(String val){
    if(val.length < 8){
      return "Password must be of 8 characters";
    }else if(val != passwordController.text){
      return "Password doesn't match";
    }
    return null;
  }


  void checkFormStateAndUpdatePassword(){
    var isValid = updateFormKey.currentState!.validate();
    if(!isValid){
      return;
    }

    updateFormKey.currentState!.save();
    updatePassword();
  }



  void updatePassword(){
    try{
      isLoading.value = true;
      final loginProvider = Get.find<LoginProvider>();
      final loginController = Get.find<LoginController>();

      loginProvider.updatePassword({
        "id"       : loginController.user.value?.id,
        "password" : passwordController.text,
        "confirm_password" : passwordController.text
      }).then((resp){
        isLoading.value = false;
        showSnackBar("Success ):", resp.body['message'], Colors.black);
        
        Future.delayed(const Duration(seconds: 2), (){
          Get.offAndToNamed(Routes.PROFILE);
        });
      }, onError: (e){

        isLoading.value = false;
        showSnackBar("Error ):", e.toString(), Colors.black);

      });

    }catch(err){
      isLoading.value = false;
      showSnackBar("Error ):", err.toString(), Colors.black);
    }
  }

}
