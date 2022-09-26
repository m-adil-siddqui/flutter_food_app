import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/modules/edit_profile/controllers/edit_profile_controller.dart';
import 'package:food_delivery_app/app/modules/login/controllers/login_controller.dart';
import 'package:food_delivery_app/components/default_button.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/size_config.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';


class BodyView extends StatelessWidget {
  BodyView({super.key});
  final _loginController = Get.find<LoginController>();
  
  @override
  Widget build(BuildContext context) {

    _loginController.fullNameController.text = _loginController.user.value?.full_name ?? '';
    _loginController.emailController.text = _loginController.user.value?.email ?? '';
    _loginController.phoneController.text = _loginController.user.value?.phone ?? '';
    _loginController.dobController.text = _loginController.user.value?.dob ?? '';

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    width: getScreenWidth(120),
                    height: getScreenHeight(120),
                    decoration:  BoxDecoration(
                      border: Border.all(
                        width: 4,
                        color: Colors.grey.shade200
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Obx((){
                      // if(_loginController.user.value?.photo != ''){
                      //   return Image.network(base_url+"${_loginController.user.value?.photo}", fit:BoxFit.cover);
                      // }  
                      // else 
                      if(_loginController.selectedImagePath.value == ''){
                        return Image.asset("assets/images/profile_avatar.png", fit:BoxFit.cover);
                      }else{
                        return Image.file(File(_loginController.selectedImagePath.value), fit:BoxFit.cover);
                      }
                    }),
                    )
                  ),
                  Positioned(
                    bottom: 8,
                    right: 4,
                    child: InkWell(
                      onTap: (){
                        bottomSheet();
                      },
                      child: Container(
                        width: getScreenWidth(30),
                        height: getScreenHeight(30),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.add, color: Colors.white, size: 17),
                      ),
                    )
                  )
                ],
              ),
            ),
            SizedBox(height: getScreenHeight(50)),
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _loginController.loginFormKey,
              child: Column(children: [
                nameInputField(),
                SizedBox(height: getScreenHeight(40)),
                emailInputField(),
                SizedBox(height: getScreenHeight(40)),
                phoneInputField(),
                SizedBox(height: getScreenHeight(40)),
                dobInputFieldBuilder(),
                SizedBox(height: getScreenHeight(50)),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                  width: SizeConfig.screenWidth * 0.4,
                  child: DefaultButton(press: (){
                   _loginController.editProfile();
                  }, text: "Save"),
                ),
                )

              ],))
          ],
        ),
      ),
      )
      );
  }

  OutlineInputBorder outlineInputBorder =  OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide:  BorderSide(color: Colors.white.withOpacity(0)),
  );


   OutlineInputBorder outlinErrInputBorder =  OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: Colors.red),
  );

  Material nameInputField () => Material(
    elevation: 5,
    shadowColor: Colors.black.withOpacity(0.4),
    borderRadius: BorderRadius.circular(10),
    child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10)
        ),
        child: TextFormField(
          controller: _loginController.fullNameController,
          validator: (val){
            return _loginController.validateFullName(val!);
          },
          onSaved: (val){
            _loginController.fullName = val!;
          },
          keyboardType: TextInputType.text,
          decoration:  InputDecoration(
            labelText: "Your name",
            hintText: "Enter name",
            floatingLabelBehavior: FloatingLabelBehavior.never,
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            errorBorder: outlinErrInputBorder,
            focusedErrorBorder:outlinErrInputBorder
          ),
        ),
      ),
    );

  Material emailInputField () => Material(
    elevation: 5,
    shadowColor: Colors.black.withOpacity(0.4),
    borderRadius: BorderRadius.circular(10),
    child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10)
        ),
        child: TextFormField(
          controller: _loginController.emailController,
          validator: (val){
            return _loginController.validateEmail(val!);
          },
          onSaved: (val){
            _loginController.email = val!;
          },
          keyboardType: TextInputType.emailAddress,
          decoration:  InputDecoration(
            labelText: "Email",
            hintText: "Enter email",
            floatingLabelBehavior: FloatingLabelBehavior.never,
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            errorBorder: outlinErrInputBorder,
            focusedErrorBorder:outlinErrInputBorder
          ),
        ),
      ),
    );

  Material phoneInputField () => Material(
    elevation: 5,
    shadowColor: Colors.black.withOpacity(0.4),
    borderRadius: BorderRadius.circular(10),
    child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10)
        ),
        child: TextFormField(
          controller: _loginController.phoneController,
          validator: (val){},
          onSaved: (val){
            _loginController.phone = val!;
          },
          keyboardType: TextInputType.phone,
          decoration: inputDecoration("Your phone", "Enter phone"),
        ),
      ),
    );

  Builder dobInputFieldBuilder() => Builder(
    builder: (context){
      return Material(
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10)
            ),
            child: TextFormField(
              controller: _loginController.dobController,
              validator: (val){},
              onSaved: (val){
                _loginController.dob = val!;
              },
              onTap: () async{
                DateTime? date = DateTime(1980);
                FocusScope.of(context).requestFocus(new FocusNode());
                date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1980),
                  lastDate: DateTime(2200));
                  if(date != null){
                    _loginController.dobController.text = DateFormat.yMMMd().format(date);
                  }
              },
              keyboardType: TextInputType.datetime,
              decoration:  inputDecoration("June 12, 1993", "June 12, 1993"),
            ),
          ),
        );
    });


  InputDecoration inputDecoration(label, hint) => InputDecoration(
    labelText: label,
    hintText: hint,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    errorBorder: outlinErrInputBorder,
    focusedErrorBorder:outlinErrInputBorder
  );
  

  bottomSheet(){
    Get.bottomSheet(  
      Container(
        padding: EdgeInsets.only(top: getScreenWidth(20)),
        height: 100,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
        ),
        child:Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                _loginController.getImage(ImageSource.camera);
              },
              child: bottomSheetIcon("Camera", "assets/images/camera.png"),
            ),
            SizedBox(width: getScreenWidth(30)),
            InkWell(
              onTap: (){
                _loginController.getImage(ImageSource.gallery);
              },
              child: bottomSheetIcon("Gallery", "assets/images/gallery.png"),
            ),
          ],
        )
      ),
      barrierColor: Colors.grey.withOpacity(.6),
      enableDrag: true,
    );
  }


  Column bottomSheetIcon(title, img) => Column(
    children: [
      Container(
        width: getScreenWidth(40),
        height: getScreenHeight(40),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image:  DecorationImage(
            image: AssetImage(img),
            fit: BoxFit.cover
          )
        ),
      ),
      const SizedBox(height: 8),
      Text(title, style: TextStyle(fontFamily: 'Nunito-Medium'))
    ],
  );
}