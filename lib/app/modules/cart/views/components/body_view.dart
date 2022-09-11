import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:food_delivery_app/app/modules/cart/views/components/cart_item_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../size_config.dart';

class BodyView extends StatelessWidget {
  BodyView({Key? key}) : super(key: key);
  final _cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
      padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
      child: Obx((){
        return ListView.separated(
        itemBuilder: (context, index){
          return Dismissible(
            key: Key(UniqueKey().toString()),
            direction: DismissDirection.endToStart,
            child: CartItemView(product: _cartController.cartItems[index]),
            onDismissed: (direction) {
                _cartController.removeFromCart(_cartController.cartItems[index]);
            },
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset("assets/images/Trash.svg"),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemCount: _cartController.cartItems.length);
      })
      ) 
      );
  }
}