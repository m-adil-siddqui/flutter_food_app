import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../../../../components/skelton_card.dart';
import '../../../../../size_config.dart';
import 'tabs.dart';

class TabList extends StatelessWidget {
   TabList({ Key? key }) : super(key: key);

  final _homeController = Get.find<HomeController>();
  
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
              height: getScreenHeight(50), 
              child: 
              Obx((){
                  if(_homeController.isCatsLoading.value == true){
                    return  
                      ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => SkeltonCard(width: 120, height: 50, radius:10),
                       separatorBuilder: (context, index) => const SizedBox(width: 7), itemCount: 4);
                    
                  }else{
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _homeController.categoryList.length != null ? _homeController.categoryList.length : 0,
                      itemBuilder: (context, index){
                        return Tabs(
                          pid : "${_homeController.categoryList[index].id}",
                          name: "${_homeController.categoryList[index].title}", 
                          img: "assets/images/pizza.png",
                        // img: "${_homeController.categoryList[index].image}",
                          index: index);
                    });
                  }
                }) 
             
            );
  }
}