import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../size_config.dart';
import '../../../routes/app_pages.dart';
import '../../login/controllers/login_controller.dart';
import '../controllers/home_controller.dart';
import 'components/body_view.dart';

class HomeView extends GetView<HomeController> {
  final _loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(
        leading: menuBuilder(),
        actions:    [
          Obx((){
            if(_loginController.isTokenExpire.value){
              return Padding(
                padding: const  EdgeInsets.only(right:20, top:10, bottom: 10),
                child: GestureDetector(
                  onTap: (){
                    Get.toNamed(Routes.PROFILE);
                  },
                  child: SizedBox(
                    width: getScreenWidth(40),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.asset("assets/images/profile_avatar.png") 
                      ),
                    ),
                ));
            }else{
              return const SizedBox();
            }
          })
          
        ]  ,
      ),
      drawer: drawerBuilder(),
      body: BodyView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: const Icon(Icons.shopping_bag_outlined),
        backgroundColor: HexColor("#fb3c54"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _bottomAppBar(),
    );
  }

  BottomAppBar _bottomAppBar() => BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: getScreenHeight(50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                   
                  },
                child:Icon(Icons.home, color : HexColor("#fb3c54"))),
                MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                  
                  },
                  child: const Icon(Icons.chat, color : Colors.grey)),
                Container(
                  width: SizeConfig.screenWidth * 0.05,
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                  
                  },
                child: const Icon(Icons.notifications, color : Colors.grey)),
                MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                   
                  },
                child: const Icon(Icons.settings, color : Colors.grey))
            ],
          ),
        ),
      );



  Builder drawerBuilder() => Builder(
    builder: (context) {
      return Drawer(
        child: ListView(children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: HexColor("#fb3c54")
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children:  [
                Obx((){
                  if(_loginController.isTokenExpire.value){
                    return  Align(
                      alignment: Alignment.bottomLeft,
                      child:  Text("${_loginController.user.value?.full_name}", style:  TextStyle(color: Colors.white, fontFamily: 'Nunito-Medium')),
                    );
                  }else{
                    return Align(
                      alignment: Alignment.bottomLeft,
                      child: InkWell(
                        onTap: (){
                          Get.toNamed(Routes.LOGIN);
                            Scaffold.of(context).closeDrawer();
                        },
                        child: const Text("Log in / Create account", style: TextStyle(color: Colors.white,fontFamily: 'Nunito-Medium')),
                      ),
                    );
                  }
                })
                 
                ],
              )),
            Obx((){
              if(_loginController.isTokenExpire.value){
                return Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.person_outline_rounded, color: HexColor("#fb3c54"), size:26),
                      title:const Text("Profile", style: TextStyle(fontFamily: 'Nunito-Medium')),
                    ),  
                    ListTile(
                      leading: Icon(Icons.favorite_outline_rounded, color: HexColor("#fb3c54"), size:26),
                      title: const Text("Favourites", style: TextStyle(fontFamily: 'Nunito-Medium')),
                    ), 
                    ListTile(
                      leading: Icon(Icons.list_alt_rounded, color: HexColor("#fb3c54"), size:26),
                      title:const Text("Order & reordering", style: TextStyle(fontFamily: 'Nunito-Medium')),
                    ),  
                    ListTile(
                      leading: Icon(Icons.card_travel_rounded, color: HexColor("#fb3c54"), size:26),
                      title:const Text("Vouchers", style: TextStyle(fontFamily: 'Nunito-Medium')),
                    ),
                  ],
                );
              }else{
                return SizedBox();
              }
            }),
           
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: HexColor("#fb3c54"),
                  width: 1.7
                )
              ),
              child: Icon(Icons.question_mark_rounded, color: HexColor("#fb3c54"), size: 18),
            ),
            title: const Text("Help center", style: TextStyle(fontFamily: 'Nunito-Medium')),
          ),
           ListTile(
            leading: Text("Settings", style: TextStyle(fontFamily: 'Nunito-Medium')),
          ),
          ListTile(
            leading: Text("Terms & Conditions / Privacy", style: TextStyle(fontFamily: 'Nunito-Medium')),
          ),
          
          Obx((){
            if(_loginController.isTokenExpire.value){
              return InkWell(
                onTap: (){
                  _loginController.logout();

                  Future.delayed(const Duration(seconds: 1), (){
                   Scaffold.of(context).closeDrawer();
                  });
                },
                child: const ListTile(
                  title:  Text("Log out", style: TextStyle(fontFamily: 'Nunito-Medium')),
                ),
              );
            }else{
              return SizedBox();
            }
          })
          ,
        ]),
      );
    });

  Builder menuBuilder() => Builder(
          builder: (context){
            return Padding(
              padding: const EdgeInsets.only(left:20, top:10, bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow( 
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0,
                        blurRadius: 15,
                        offset: const Offset(0,2)
                       )
                    ]
                  ),
                  child: IconButton(
                    icon: Image.asset("assets/images/menu.png", width: getScreenWidth(15)),
                    onPressed: () => Scaffold.of(context).openDrawer()),
                )
            );
          },
        );
}
