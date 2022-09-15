import 'package:flutter/material.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({ Key? key, required this.press, required this.text, this.loader = false}) : super(key: key);

  final Function() press;
  final String text;
  bool loader;
  // final _loginController = Get.find<LoginController>();


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getScreenHeight(50),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          backgroundColor: Colors.redAccent
        ),
        // child: _loginController.isLoading.value ? 
        child: loader ? 
        SizedBox(
          width: getScreenWidth(30), 
          height: getScreenHeight(30),
          child: const CircularProgressIndicator(
            strokeWidth: 2.0,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          )) 
         : Text(text, style: TextStyle(color: Colors.white,fontSize: getScreenWidth(18))),
        onPressed: press,
      ),
    );
  }
}