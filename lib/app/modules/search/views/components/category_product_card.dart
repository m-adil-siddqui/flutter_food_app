import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';
import '../../../product/product_model.dart';

class CategoryProductCard extends StatelessWidget {
  const CategoryProductCard({ Key? key, required this.product }) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(bottom: getScreenWidth(20)),
      child: GestureDetector(
        onTap: (){
          Get.toNamed("/product/${product.id}");
        },
        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            AspectRatio(
                              aspectRatio: 4/2,
                              child:  ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(base_url+"/images/"+product.images![0], fit:BoxFit.cover),
                                  // child: Image.asset("assets/images/main-food-5.jpg", fit:BoxFit.cover),
                              ),
                            ),
                            Positioned(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: HexColor("#fb3c54"),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(4),
                                          bottomRight: Radius.circular(4)
                                        )
                                      ),
                                      child: Text("Pau pau ${product.discount}% OFF", style: TextStyle(color: Colors.white)),
                                    ),
                                  ), 
                                  Padding(
                                    padding: EdgeInsets.only(top: 10, right: 10),
                                    child: Container(
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20)
                                      ),
                                      child: Icon(Icons.favorite_border_outlined, size: 18),
                                    ),
                                  ),
                                ],
                              ) 
                            )
                          ],
                        ), 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: getScreenWidth(270),
                              child: Text(product.title.toString(), style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold), maxLines: 1),
                            ),
                            Row(children:  [
                              Icon(Icons.star, color: HexColor("#fb3c54"), size: 18),
                              Text("4.1")
                            ],)  
                          ],
                        ), 
                        Text(product.tagline.toString(), style: TextStyle(color: Colors.black54, fontSize: 13)),
                        Text("Rs ${product.price}", style: TextStyle(color: Colors.black54, fontSize: 13)),
                      ],
                    ),
      ),
    );
  }
}