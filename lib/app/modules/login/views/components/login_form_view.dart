import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/default_button.dart';
import 'package:food_delivery_app/size_config.dart';
import 'package:get/get.dart';

import '../../controllers/login_controller.dart';


class LoginFormView extends StatefulWidget {
  LoginFormView({Key? key}) : super(key: key);

  @override
  State<LoginFormView> createState() => _LoginFormViewState();
}

class _LoginFormViewState extends State<LoginFormView> {
  // final _formKey = GlobalKey<FormState>();
  bool remember = false;
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: controller.loginFormKey,
      child: Column(
        children: [
          buildFormTextField(),
          SizedBox(height: getScreenHeight(30)),
          buildFormPasswordField(),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: Colors.redAccent,
                onChanged: (val){
                  setState(() {
                    remember = val!;
                  });
                }),
                const Text("Remember me"),
                const Spacer(),
                GestureDetector(
                  onTap:(){},
                  child: const Text("Forget Password", style: TextStyle(decoration: TextDecoration.underline)),
                ), 
            ],
          ),
          SizedBox(height: getScreenHeight(20)),
          // Obx((){
          //   if(controller.isLoading.value == true){
          //     return Text("Loading...");
          //   }else{
          //     return Text("${controller.userList[0]['full_name']}");
          //   }
          // }),
          DefaultButton(press: (){
            controller.checkLogin();
          }, text: "Log in"),
        ],
      ),
    );
  }


  TextFormField buildFormTextField(){
    return TextFormField(
      controller: controller.emailController,
      validator: (value){
        return controller.validateEmail(value!);
      },
      onSaved: (value){
        controller.email = value!;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "your email",
        // suffixIcon: CustomSuffixIcon(icon: "assets/icons/Mail.svg")
      ));
  }

   TextFormField buildFormPasswordField(){
    return TextFormField(
      controller: controller.passwordController,
      onSaved: (value){
        controller.password = value!;
      },
      validator: (value){
        return controller.validatePassword(value!);
      },
      obscureText: true,
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "your password",
        // suffixIcon: CustomSuffixIcon(icon: "assets/icons/Lock.svg",)
      ));
  }
}