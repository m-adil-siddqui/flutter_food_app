import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../components/loaders/horizontal_card_loader.dart';
import '../../../../../size_config.dart';
import '../../controllers/search_controller.dart';
import 'category_product_card.dart';

class BodyView extends StatelessWidget {
  BodyView({Key? key}) : super(key: key);
  final _searchController = Get.find<SearchController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getScreenHeight(10)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getScreenWidth(5)), 
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 0,
                      blurRadius: 6,
                      offset: const Offset(0,3)
                    )
                  ]
                ),
                child: TextField(
                  onChanged: (val){
                    _searchController.onChange(val);
                  },
                  cursorColor: Colors.black,
                  autofocus: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: getScreenWidth(20),
                      vertical: getScreenHeight(17)
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder:InputBorder.none,
                    hintText: "Find food",
                    prefixIcon: Icon(Icons.search_rounded, color: Colors.black)
                    // suffixIcon: const CustomSuffixIcon(img:"assets/images/search.png")
                  ),
                ),
              ),
            ),
            SizedBox(height: getScreenHeight(30)),
            Obx((){
              if(_searchController.isLoading.value == true && _searchController.searchProductList.length == 0){
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) => HorizontalCardLoader(),
                  separatorBuilder: (context, index) => const SizedBox(height: 20),
                  itemCount: 5);
              }else{
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: _searchController.searchProductList.length,
                  itemBuilder: (context, index){
                    return LimitedBox(
                      maxHeight: getScreenHeight(275), 
                      child: CategoryProductCard(product: _searchController.searchProductList[index]),
                    );
                });
              }
            })
            

          ],
        ),
      )),
    );
  }
}