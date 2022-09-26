import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/modules/login/controllers/login_controller.dart';
import 'package:food_delivery_app/app/modules/profile/views/components/other_card.dart';
import 'package:food_delivery_app/size_config.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

class BodyView extends StatelessWidget {
  BodyView({super.key});
  final _loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getScreenHeight(20)),
            Stack(
              children: [
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),
                  shadowColor: Colors.black.withOpacity(0.4),
                  child:Container(
                    padding: EdgeInsets.symmetric(vertical: getScreenWidth(20)),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color:Colors.grey[100],
                      borderRadius:BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: getScreenHeight(40)),
                        Container(
                          width: getScreenWidth(180),
                          height: getScreenHeight(180),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/images/profile_avatar.png"),
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                        SizedBox(height: getScreenHeight(10)),
                        Obx(() => Text("${_loginController.user.value?.full_name}", style: const TextStyle(fontFamily: 'Nunito-ExtraBold', fontSize: 22, color: Colors.redAccent))),
                        Obx(() => Text("${_loginController.user.value?.email}", style: const TextStyle(fontFamily: 'Nunito-Medium'))),
                        SizedBox(height: getScreenHeight(40)),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.7,
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Text("Rs8900", style: TextStyle(fontFamily: 'Nunito-Bold', fontSize: 18, color: Colors.redAccent)),
                                Text("Income", style: TextStyle(fontFamily: 'Nunito-Medium')),
                              ],
                            ),
                            verticalBorder(), 
                            Column(
                              children: const [
                                Text("Rs5500", style: TextStyle(fontFamily: 'Nunito-Bold', fontSize: 18, color: Colors.redAccent)),
                                Text("Expenses", style: TextStyle(fontFamily: 'Nunito-Medium')),
                              ],
                            ),
                            verticalBorder(),
                            Column(
                              children: const [
                                Text("Rs190", style: TextStyle(fontFamily: 'Nunito-Bold', fontSize: 18, color: Colors.redAccent)),
                                Text("Loan", style: TextStyle(fontFamily: 'Nunito-Medium')),
                              ],
                            )
                          ],
                        ),
                        ),
                        SizedBox(height: getScreenHeight(40)),
                      ],
                    ),
                  ) ,
                ),
                Positioned(
                  left: 20, 
                  top: 20,
                  child: InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.all(getScreenWidth(4)),
                      child:  Icon(Icons.arrow_back_ios_new_rounded, size: getScreenWidth(20)),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                      ),
                    ),
                    )
                  ),
              ],
            ),
            SizedBox(height: getScreenHeight(30)),
            const Text("Others", style: TextStyle(fontFamily: 'Nunito-ExtraBold', fontSize: 22, color: Colors.redAccent)),
            const SizedBox(height: 20),
            OtherCard(icon: Icons.edit, press: (){
              Get.toNamed(Routes.EDIT_PROFILE);
            }, heading: "Edit Profile"),
            const SizedBox(height: 10),
            OtherCard(icon: Icons.key, press: (){}, heading: "Change Password"),
            const SizedBox(height: 10),
            OtherCard(icon: Icons.logout_rounded, press: (){
              _loginController.logout();
              Future.delayed(const Duration(seconds: 1),(){
                Get.toNamed(Routes.LOGIN);
              });
              }, heading: "Log Out"),
            SizedBox(height: getScreenHeight(30)),
            
          ],
        ),
      ),
      )
      );
  }


  Container verticalBorder() => Container(
        width: 2,
        height: 40,
        color:Colors.grey
      );
}