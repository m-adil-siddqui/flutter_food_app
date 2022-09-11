import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';

import '../../../../../size_config.dart';

class Tabs extends StatelessWidget {
  const Tabs({ Key? key, required this.pid, required this.name, required this.img, required this.index }) : super(key: key);
  final String img, name, pid;
  final int _current_tab = 0, index;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                  onTap: (){
                    Get.toNamed("/category-product/${pid}");
                  },
                  child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),  
                  padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color:  Colors.grey[200],
                    // color: _current_tab == index ? HexColor("#fb3c54"): Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    children: [
                      Image.asset(img, width: getScreenWidth(40)),
                      // Image.network(App.base_url+"/images"+img, width: getScreenWidth(40)),
                      const SizedBox(width: 10),
                      Text(name.toUpperCase(), style: const TextStyle(color: Colors.black ,fontSize: 16, fontWeight: FontWeight.bold))
                     
                    ]),
                )
                );
  }
}