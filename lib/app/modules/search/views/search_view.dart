import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../size_config.dart';
import '../controllers/search_controller.dart';
import 'components/body_view.dart';

class SearchView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Food", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const  EdgeInsets.only(right:20, top:10, bottom: 10),
            child:InkWell(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => SingleItem()));
              },
              child: SizedBox(
                width: getScreenWidth(40),
                child: const Icon(Icons.shopping_bag_outlined),
              ),
            )
          )
        ],
      ),
      body: BodyView(),
    );
  }
}
