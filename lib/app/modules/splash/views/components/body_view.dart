import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/default_button.dart';
import 'package:food_delivery_app/size_config.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

class BodyView extends StatelessWidget {
  const BodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: AspectRatio(
              aspectRatio: 2/2, 
              child: Image.asset("assets/images/splash_screen_img.png"),
              ),
            ),
            SizedBox(height: getScreenHeight(20)),
            const Text("Quick delivery at \n your Doorstep", style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'Nunito-ExtraBold'), textAlign: TextAlign.center),
            SizedBox(height: getScreenHeight(20)),
            const Text("Home delivery and online reservation \n system for restaurants and cafe", style: TextStyle(
              color: Colors.grey, fontFamily: 'Nunito-regular'), textAlign: TextAlign.center),
            SizedBox(height: getScreenHeight(40)),
           SizedBox(
            width: getScreenWidth(200),
            child: DefaultButton(press: (){
              Get.offAllNamed(Routes.HOME);
            }, text: "Get Started"),
           )
          
          ],
        ),
      ),
    );
  }
}