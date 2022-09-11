import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../../../../components/loaders/horizontal_card_loader.dart';
import '../../../../../size_config.dart';
import '../../../search/views/components/category_product_card.dart';

class BodyView extends StatelessWidget {
  BodyView({Key? key}) : super(key: key);
  final _homeController = Get.find<HomeController>();
  final String? id = Get.parameters['id'];
  
  @override
  Widget build(BuildContext context) {
     Future.delayed(Duration.zero,(){
      _homeController.fetchProductsByCategory(id);
    });
    return SafeArea(
        child: Obx((){
          if(_homeController.isLoading.value == true){
            return ListView.separated(
              itemBuilder: (context, index) => HorizontalCardLoader(),
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: 5);
          }else{
            return SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 4/2,
                    child: ClipRRect(
                      borderRadius: const  BorderRadius.only(
                        bottomLeft: Radius.elliptical(700, 90), 
                        bottomRight: Radius.elliptical(700, 90)
                      ),
                      child: Image.asset("assets/images/category_banner.jpg", fit:BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    left: 10, 
                    top: 10,
                    child: InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Container(
                        padding: EdgeInsets.all(getScreenWidth(4)),
                        child: Icon(Icons.arrow_back_ios_new_rounded, size: getScreenWidth(20)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)
                        ),
                      ),
                    )
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getScreenWidth(10)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 30),
                    Obx((){
                      return  ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: _homeController.productListByCategory.length,
                          itemBuilder: (context, index){
                            return LimitedBox(
                              maxHeight: getScreenHeight(275), 
                              child: CategoryProductCard(product: _homeController.productListByCategory[index]),
                            );
                          }
                        );
                    }),
                  ],
                ),
              )
            ],
          ),
        );
          }
        }),
        
         
      );
  }
  }
