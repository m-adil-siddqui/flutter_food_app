import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:food_delivery_app/app/modules/product/product_model.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../../size_config.dart';

class CartItemView extends StatelessWidget {
  CartItemView({Key? key, required this.product, this.cartItems}) : super(key: key);
  final _cartController = Get.find<CartController>();
  final Product product;
  var cartItems;
  
  @override
  Widget build(BuildContext context) {
    return Container(
          height: 90,
          padding: EdgeInsets.symmetric(horizontal: getScreenWidth(5)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 15,
                offset: const Offset(0,10)
              )
            ]    
          ),
          child: Row(
          children: [
            Container(
              width: getScreenWidth(90),
              height: getScreenHeight(90),
              decoration: BoxDecoration(
                shape: BoxShape.circle, 
                image: DecorationImage(
                  image: NetworkImage(base_url+"/images${product.images?[0]}"),
                  fit: BoxFit.cover
                )
              ),
            ),
            SizedBox(width: getScreenWidth(20)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children:  [
                SizedBox(
                  width: getScreenWidth(200),
                  child: Text("${product.title}",
                      style: TextStyle(color: Colors.black, fontSize: 14, fontFamily: 'Nunito-Medium'),
                      maxLines: 2,
                    ),
                ), 
                const SizedBox(height: 5),   
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        text:"Rs ${product.price}",
                        style:TextStyle(color: Colors.red, fontFamily: 'Nunito-Medium', fontSize: 13),
                        // children: [
                        //   TextSpan(
                        //     text: " x ${product.qty}",
                        //     style: TextStyle(color: Colors.black)
                        //   )
                        // ]
                      )
                   ),
                  SizedBox(width: getScreenWidth(20)),
                  SizedBox(
                    height: getScreenHeight(30),
                    child:Row(
                      children: [
                        SizedBox(
                          width: getScreenWidth(20),
                          child: ElevatedButton(
                            onPressed: () {
                              _cartController.incrementToCart(product);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: HexColor("#fb3c54").withOpacity(1), // this is for bg of button
                              elevation: 0,
                              minimumSize: Size.zero, 
                              padding: const EdgeInsets.all(2),
                              shape:  RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            child: const Icon(Icons.add, color: Colors.white, size: 14),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Obx(() => Text("${cartItems.length != 0 && cartItems.contains(product) ? cartItems[cartItems.indexWhere((element) => element.id == product.id)].qty : 0}", style: const TextStyle(fontSize: 14))),
                        const SizedBox(width: 5),
                        SizedBox(
                          width: getScreenWidth(20),
                          child: ElevatedButton(
                          onPressed: () {
                              _cartController.decrementToCart(product);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: HexColor("#fb3c54").withOpacity(1), // this is for bg of button
                            // onPrimary: Colors.white, // this is for text color
                            elevation: 0,
                            minimumSize: Size.zero, // Set this
                            padding: const EdgeInsets.all(2),
                            shape:  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: const Icon(Icons.remove, color: Colors.white, size: 14),
                        )
                        ) 
                      ],
                    )
                  ),
                ],
                )
                 
              ],
            )
          ],
      ),
      );
  }
}