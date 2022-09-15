import 'package:get/get.dart';

import 'package:food_delivery_app/app/modules/cart/views/cart_view.dart';
import 'package:food_delivery_app/app/modules/category/bindings/category_binding.dart';
import 'package:food_delivery_app/app/modules/category/views/category_view.dart';
import 'package:food_delivery_app/app/modules/category_product/bindings/category_product_binding.dart';
import 'package:food_delivery_app/app/modules/category_product/views/category_product_view.dart';
import 'package:food_delivery_app/app/modules/home/bindings/home_binding.dart';
import 'package:food_delivery_app/app/modules/home/views/home_view.dart';
import 'package:food_delivery_app/app/modules/login/bindings/login_binding.dart';
import 'package:food_delivery_app/app/modules/login/views/login_view.dart';
import 'package:food_delivery_app/app/modules/product/bindings/product_binding.dart';
import 'package:food_delivery_app/app/modules/product/views/product_view.dart';
import 'package:food_delivery_app/app/modules/search/bindings/search_binding.dart';
import 'package:food_delivery_app/app/modules/search/views/search_view.dart';
import 'package:food_delivery_app/app/modules/single_product/bindings/single_product_binding.dart';
import 'package:food_delivery_app/app/modules/single_product/views/single_product_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      // binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => CategoryView(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
        name: _Paths.SEARCH,
        page: () => SearchView(),
        binding: SearchBinding(),
        transition: Transition.leftToRight),
    GetPage(
      name: _Paths.CATEGORY_PRODUCT,
      page: () => CategoryProductView(),
      binding: CategoryProductBinding(),
    ),
    GetPage(
      name: _Paths.SINGLE_PRODUCT,
      page: () => SingleProductView(),
      binding: SingleProductBinding(),
    ),
  ];
}
