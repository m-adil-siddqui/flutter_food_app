import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../components/default_button.dart';
import '../../../../size_config.dart';
import '../controllers/cart_controller.dart';
import 'components/body_view.dart';

class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Food", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const  EdgeInsets.only(right:20, top:10, bottom: 10),
            child: GestureDetector(
              onTap: (){},
              child: SizedBox(
                width: getScreenWidth(40),
                child: AspectRatio(
                  aspectRatio: 1,
                  child:Image.asset("assets/images/profile_avatar.png"),
                  ),
                ),
            )
          )
        ]),
      body: BodyView(),
      bottomNavigationBar: CheckOutBottomCard(),
    );
  }
}



class CheckOutBottomCard extends StatelessWidget {
 CheckOutBottomCard({ Key? key }) : super(key: key);
  final _cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(
          horizontal: getScreenHeight(30),
          vertical: getScreenHeight(10)
      ),
      decoration:  BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 15,
            offset: const Offset(0,-10)
          )
        ]
      ),
      child: SafeArea(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() => Text("Items (${_cartController.totalQty})", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))),
              Obx(() => Text.rich(
                TextSpan(
                  text: "Rs",
                  style: TextStyle(color: Colors.red),
                  children: [
                    TextSpan(
                      text:"${_cartController.totalPrice}",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    )
                  ]
                )
              ))
            ]),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text("Total Price", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              Obx(()=> Text.rich(
                TextSpan(
                  text: "Rs",
                  style: TextStyle(color: Colors.red),
                  children: [
                    TextSpan(
                      text:"${_cartController.totalPrice}",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    )
                  ]
                )
              ))
            ]),
          const SizedBox(height: 20),
          DefaultButton(press: (){
          }, text: "Checkout")
        ],
      ),
      ),
    );
  }
}
