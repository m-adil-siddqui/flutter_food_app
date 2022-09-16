import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../../../../size_config.dart';
import '../../cart/controllers/cart_controller.dart';
import '../controllers/single_product_controller.dart';
import 'components/body_view.dart';

class SingleProductView extends GetView<SingleProductController> {
  @override
  final _cartController = Get.find<CartController>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
           Padding(
            padding: const  EdgeInsets.only(right:20, top:10, bottom: 10), 
            child:InkWell(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
                Get.toNamed(Routes.CART);
              },
              child: SizedBox(
                width: getScreenWidth(40),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(child: const Icon(Icons.shopping_bag_outlined)),
                    Obx(() => Positioned(
                      right: 10,
                      top: -3,
                      child: ClipOval(
                        child: Container(
                          alignment: Alignment.center,
                          width: 17,
                          height: 17,
                          padding: EdgeInsets.all(4),
                          color: Colors.red[400],
                          child: Text("${_cartController.totalQty}", style: TextStyle(fontSize: 8)),
                        ), 
                      ) 
                    )),
                  ],
                ),
              ),
            )
          )
        ]),
      body: BodyView(),
    );
  }
}
