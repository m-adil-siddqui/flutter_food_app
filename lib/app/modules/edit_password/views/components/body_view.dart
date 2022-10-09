import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/modules/edit_password/controllers/edit_password_controller.dart';
import 'package:food_delivery_app/size_config.dart';
import 'package:get/get.dart';

import '../../../../../components/default_button.dart';

class BodyView extends StatelessWidget {
  BodyView({super.key});
  final editPasswordController = Get.find<EditPasswordController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: editPasswordController.updateFormKey,
          child: Column(children: [
            SizedBox(height: SizeConfig.screenHeight * 0.2),
            passwordInputField(),
            SizedBox(height: getScreenHeight(40)),
            confirmPasswordInputField(),
            SizedBox(height: getScreenHeight(50)),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: SizeConfig.screenWidth * 0.5,
                child: Obx(() => DefaultButton(press: (){
                 editPasswordController.checkFormStateAndUpdatePassword();
                }, text: "Update password", loader: editPasswordController.isLoading.value)),
              ),
            )
          ]),
        ),
      ),
      ),
    );
  }

  Material confirmPasswordInputField () => Material(
    elevation: 5,
    shadowColor: Colors.black.withOpacity(0.4),
    borderRadius: BorderRadius.circular(10),
    child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10)
        ),
        child: TextFormField(
          controller: editPasswordController.confirmPasswordController,
          validator: (val){
            return editPasswordController.validateConfirmPassword(val!);
          },
          onSaved: (val){
            editPasswordController.confirmPassword = val!;
          },
          obscureText: true,
          decoration:  inputDecoration("Confirm Password", "Re-type password"),
        ),
      ),
    );


    Material passwordInputField () => Material(
    elevation: 5,
    shadowColor: Colors.black.withOpacity(0.4),
    borderRadius: BorderRadius.circular(10),
    child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10)
        ),
        child: TextFormField(
          controller: editPasswordController.passwordController,
          validator: (val){
            return editPasswordController.validatePassword(val!);
          },
          onSaved: (val){
            editPasswordController.password = val!;
          },
          obscureText: true,
          decoration:  inputDecoration("Enter Password", "Type password"),
        ),
      ),
    );

    
    InputDecoration inputDecoration(label, hint) => InputDecoration(
      labelText: label,
      hintText: hint,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      errorBorder: outlinErrInputBorder,
      focusedErrorBorder:outlinErrInputBorder
  );

  OutlineInputBorder outlineInputBorder =  OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide:  BorderSide(color: Colors.white.withOpacity(0)),
  );


   OutlineInputBorder outlinErrInputBorder =  OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: Colors.red),
  );
}