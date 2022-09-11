import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../size_config.dart';
import '../controllers/home_controller.dart';
import 'components/body_view.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: menuBuilder(),
        actions: [
          Padding(
          padding: const  EdgeInsets.only(right:20, top:10, bottom: 10),
          child: GestureDetector(
            onTap: (){},
            child: SizedBox(
              width: getScreenWidth(40),
              child: AspectRatio(
                aspectRatio: 1,
                child: Container( 
                  child: Image.asset("assets/images/profile_avatar.png"),
                 ) 
                ),
              ),
          ))
        ],
      ),
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
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0,3)
                       )
                    ]
                  ),
                  child: IconButton(
                    icon: Image.asset("assets/images/menu.png", width: getScreenWidth(25)),
                    onPressed: () => Scaffold.of(context).openDrawer()),
                )
            );
          },
        );
}
