import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/modules/product/product_model.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../../size_config.dart';

class CartItemView extends StatelessWidget {
  CartItemView({Key? key, required this.product}) : super(key: key);
  final Product product;
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
            SizedBox(
              width: getScreenWidth(88),
              child: AspectRatio(
                aspectRatio: 0.88,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(base_url+"/images${product.images?[0]}"),
                ),
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
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      maxLines: 2,
                    ),
                ), 
                const SizedBox(height: 5),   
                Row(
                  children: [
                    Text.rich(
                    TextSpan(
                      text:"${product.price}",
                      style:TextStyle(color: Colors.red),
                      children: [
                        TextSpan(
                          // text: " x${cart.numOfItem}",
                          text: " x 4",
                          style: TextStyle(color: Colors.black)
                        )
                      ]
                    )
                  ),
                  SizedBox(width: getScreenWidth(20)),
                  SizedBox(
                    height: getScreenHeight(30),
                    child:Container(
                      decoration: BoxDecoration(
                        color: HexColor("#fb3c54"),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: HexColor("#fb3c54").withOpacity(0), // this is for bg of button
                              elevation: 0,
                              minimumSize: Size.zero, 
                              padding: EdgeInsets.zero,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)
                                  )),
                            ),
                            child: const Icon(Icons.add, color: Colors.white, size: 14),
                          ),
                          const Text("1", style: TextStyle(color: Colors.white)),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              // side: BorderSide(color: Colors.red, width: 4),
                              primary: HexColor("#fb3c54").withOpacity(0), // this is for bg of button
                              // onPrimary: Colors.white, // this is for text color
                              elevation: 0,
                              minimumSize: Size.zero, // Set this
                              padding: EdgeInsets.zero,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    topLeft: Radius.circular(0),
                                    bottomLeft: Radius.circular(0)
                                  )),
                            ),
                            child: const Icon(Icons.remove, color: Colors.white, size: 14),
                          ) 
                        ],
                      ),
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