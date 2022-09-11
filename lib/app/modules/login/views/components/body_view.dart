import 'package:flutter/material.dart';
import 'package:food_delivery_app/size_config.dart';

import '../../../../../components/no_account_text.dart';
import '../../../../../components/social_card.dart';
import 'login_form_view.dart';

class BodyView extends StatelessWidget {
  const BodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(10)),
        child: SingleChildScrollView(
          child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.04),
            Text("Welcome Back", 
              style: TextStyle(
                color: Colors.black,
                fontSize: getScreenHeight(28),
                fontWeight: FontWeight.bold
            )),
            const Text(
              "Sign in with your email or password \nor continue with your social media",
              textAlign:TextAlign.center
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            LoginFormView(),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialCard(press: () async{},
                  icon: Icon(Icons.facebook_outlined)),
                SocialCard(press: (){}, icon: Icon(Icons.facebook_outlined)),
                SocialCard(press: () async {
                }, icon: Icon(Icons.facebook_outlined)),
              ]
            ),
            SizedBox(height: getScreenHeight(20)),
            NoAccountText()
          ],
        ),
        ),
        ) 
    );
  }
}