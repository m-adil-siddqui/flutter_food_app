import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/modules/home/controllers/home_controller.dart';
import 'package:food_delivery_app/app/modules/home/views/components/tab_list.dart';
import 'package:food_delivery_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../../../../../components/loaders/vertical_card_loader.dart';
import '../../../../../components/skelton_card.dart';
import '../../../../../size_config.dart';
import 'food_card.dart';

class BodyView extends StatelessWidget {
  BodyView({Key? key}) : super(key: key);
  final _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text("Let's eat \nquality food 😋", style:  TextStyle(fontWeight: FontWeight.w800, fontSize: 30.0)),
            const SizedBox(height: 30),
            Obx((){
              if(_homeController.isLoading.value == true){
                return Center(child: SkeltonCard(width: 250, height: 50, radius: 15));
              }else{
                return searchBar();
              }
            }),
            const SizedBox(height: 30),
            TabList(),
            const SizedBox(height: 30),
            SizedBox(
              height: getScreenHeight(370), 
              child:
                Obx((){
                  if(_homeController.isLoading.value == true){
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => VerticalCardLoader(),
                      separatorBuilder: (context, index) => const SizedBox(width: 10),
                      itemCount: 4);
                  }else{
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _homeController.productList.length != null ? _homeController.productList.length : 0,
                      itemBuilder: (context, index){
                        return FoodCard(
                          // img: "assets/images/main-food-1.jpg",
                          pid: "${_homeController.productList[index].id}",
                          img: "${_homeController.productList[index].images![0]}",
                          title: "${_homeController.productList[index].title}", 
                          price: _homeController.productList[index].price!.toDouble(),
                          tagline: "${_homeController.productList[index].tagline}",
                          );
                    });
                  }
                })
               
            ),
            const SizedBox(height: 30),
           
              
          ],
      )),)
    );
  }

  Container searchBar() => Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(
                  onTap: (){
                    Get.toNamed(Routes.SEARCH);
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: getScreenWidth(16),
                      vertical: getScreenHeight(13)
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder:InputBorder.none,
                    hintText: "Find food"
                  ),
                ),
            );
}