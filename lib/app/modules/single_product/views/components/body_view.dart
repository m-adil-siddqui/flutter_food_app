import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:food_delivery_app/app/modules/single_product/controllers/single_product_controller.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../../components/default_button.dart';
import '../../../../../constants.dart';
import '../../../../../size_config.dart';


class BodyView extends StatefulWidget {
  const BodyView({ Key? key }) : super(key: key);

  @override
  State<BodyView> createState() => _BodyViewState();
}

class _BodyViewState extends State<BodyView> {

  final _singleProductController = Get.find<SingleProductController>();
  final _cartController = Get.find<CartController>();
  final String? id = Get.parameters['id'];
  

  @override
  void initState() {
    Future.delayed(Duration.zero, (){
      _singleProductController.fetchSingleProduct(id);
    });
    super.initState();
  }
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx((){
        if(_singleProductController.isLoading.value == true){
          return const Center(child: CircularProgressIndicator());
        }else{
          return SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(height: getScreenHeight(5)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getScreenWidth(10)),
                  child:
                    Align(
                      alignment: Alignment.topCenter,
                      child:  Obx((){
                        if(_singleProductController.product.value?.images == null){
                          return const Center(child: CircularProgressIndicator());
                        }else{
                          return Column(
                            children: [
                              AspectRatio(
                                aspectRatio: 3/2,
                                child: PageView.builder(
                                  onPageChanged: (value) {
                                    setState(() {
                                      _currentPage = value;  
                                    });
                                  },
                                  itemCount: _singleProductController.product.value?.images?.length,
                                  itemBuilder: (context, index) => Card(
                                    margin: EdgeInsets.symmetric(horizontal: getScreenWidth(8)),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)
                                    ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(base_url+"/images"+_singleProductController.product.value?.images![index] , fit:BoxFit.cover),
                                        // child: Image.asset(itemImgs[index]['img'].toString(), fit:BoxFit.cover),
                                    ),
                                    ) 
                                  ),
                              ),
                              SizedBox(height: getScreenHeight(20)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  _singleProductController.product.value!.images!.length,
                                  (index) => AnimatedContainer(
                                    duration: const Duration(microseconds: 200),
                                    margin: const EdgeInsets.only(right: 5),
                                    width: _currentPage == index ? 20 : 6,
                                    height: 6,
                                    decoration: BoxDecoration(
                                      color: _currentPage == index ? HexColor("#fb3c54") : Colors.grey,
                                      borderRadius: BorderRadius.circular(3)
                                    )
                                  )),
                              )
                            ]);
                        }
                      })
                    )
                  ),
                const SizedBox(height: 40),
                Align(
                    alignment: Alignment.topLeft,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: getScreenWidth(40)),
                          width: double.infinity,
                          // height: 400,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(60),
                            )
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: getScreenWidth(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text:  TextSpan(
                                    children: [
                                      TextSpan(text: "${_singleProductController.product.value?.title} \n", style: TextStyle(fontSize: 20, fontFamily: 'Nunito-Bold', color: Colors.black)),
                                      TextSpan(text: "${_singleProductController.product.value?.tagline}", style: TextStyle(fontSize: 14, fontFamily: 'Nunito-Regular', color: Colors.grey))
                                    ] 
                                    )
                                ),
                                const SizedBox(height: 20),
                                Text("${_singleProductController.product.value?.desc}", style: TextStyle(fontFamily: 'Nunito-Medium')),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Standard Delivery", style: TextStyle(fontSize: 16, fontFamily: 'Nunito-Medium')),
                                    Text("You save ${_singleProductController.product.value?.discount}%", style: TextStyle(fontSize: 13, fontFamily: 'Nunito-Medium'))
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Obx(() { 
                                      var cartItems = _cartController.cartItems;
                                  return Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        ElevatedButton(
                                          onPressed: (){
                                            _cartController.incrementToCart(_singleProductController.product.value);
                                          },
                                          child: const Icon(Icons.add, color: Colors.black),
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.grey[200],
                                            shape: const CircleBorder(),
                                            padding: const EdgeInsets.all(5)
                                          ),
                                        ),
                                        Text("${cartItems.length != 0 && cartItems.contains(_singleProductController.product.value) ? cartItems[cartItems.indexWhere((element) => element.id == _singleProductController.product.value?.id)].qty : 0}", style: const TextStyle(fontSize: 16)),
                                        ElevatedButton(
                                          onPressed: (){
                                            _cartController.decrementToCart(_singleProductController.product.value);
                                          },
                                          child: const Icon(Icons.remove, color: Colors.black),
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.grey[200],
                                            shape: const CircleBorder(),
                                            padding: const EdgeInsets.all(5)
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                              alignment: Alignment.topRight,
                                              child:Text("Rs${_singleProductController.product.value?.price}", style: TextStyle(fontSize: 20, fontFamily: 'Nunito-Bold')),
                                            )
                                        )
                                      ]);}),
                                const SizedBox(height: 30),
                                DefaultButton(press: (){
                                  _cartController.addToCart(_singleProductController.product.value!);
                                }, text: "Add To Cart"),
                                const SizedBox(height: 20),
                              ],
                            )
                          ),
                        ),
                        Positioned(
                          right: 40,
                          top: -15,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: HexColor("#fb3c54"),
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: const Icon(Icons.favorite, color: Colors.white, size: 20),
                          ) 
                        )
                      ],
                    ),
                  )
              ],
            ),
          );
        }
      }),      
    );
  }
}








// class Body extends StatelessWidget {
//   const Body({ Key? key }) : super(key: key);
  

 