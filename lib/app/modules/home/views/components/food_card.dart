import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../../constants.dart';


class FoodCard extends StatelessWidget {
  const FoodCard({ Key? key, required this.pid, required this.img, required this.title, required this.price, required this.tagline }) : super(key: key);
  final String pid, img, title, tagline;
  final num price;
  
  @override
  Widget build(BuildContext context) {
    return Container(
              width: 200,
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[100],
              ), 
              child: InkWell(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => SingleItem()));
                  Get.toNamed("/single-product/${pid}");
                },
                child: Padding(
                    padding: const EdgeInsets.only(right:15, top:10, bottom: 20, left: 15),
                    child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 20,
                              offset: const Offset(0,7)
                            )
                          ]
                        ),
                        child: ClipOval(
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(60), // Image radius
                            child: Image.network(base_url+"/images"+img, fit:BoxFit.cover),
                            // child: Image.asset(img, fit:BoxFit.cover),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(title, style: const TextStyle(fontSize: 20, fontWeight:FontWeight.w700), maxLines:2, textAlign: TextAlign.center),
                      const SizedBox(height: 7),
                      Text(tagline, style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                      const SizedBox(height: 6),
                      Text("🔥 58 Calories", style: TextStyle(fontSize: 16, color: HexColor("#fb3c54")),
                      ),
                      const SizedBox(height: 5),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: '\$', style: TextStyle(fontSize: 17, color: HexColor("#fb3c54"))),
                            TextSpan(text: '${price}', style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold)),
                          ]
                          ))
                    ],
                )),
              ),
            );
  }
}