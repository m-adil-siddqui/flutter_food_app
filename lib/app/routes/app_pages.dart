import 'package:get/get.dart';

import '../modules/cart/views/cart_view.dart';
import '../modules/category/bindings/category_binding.dart';
import '../modules/category/views/category_view.dart';
import '../modules/category_product/bindings/category_product_binding.dart';
import '../modules/category_product/views/category_product_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/product/bindings/product_binding.dart';
import '../modules/product/views/product_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/single_product/bindings/single_product_binding.dart';
import '../modules/single_product/views/single_product_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => HomeView(),
        binding: HomeBinding(),
        transition: Transition.leftToRight),
    GetPage(
        name: _Paths.LOGIN,
        page: () => LoginView(),
        // binding: LoginBinding(),
        transition: Transition.leftToRight),
    GetPage(
        name: _Paths.CART,
        page: () => CartView(),
        // binding: CartBinding(),
        transition: Transition.leftToRight),
    GetPage(
        name: _Paths.CATEGORY,
        page: () => CategoryView(),
        binding: CategoryBinding(),
        transition: Transition.leftToRight),
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
        transition: Transition.leftToRight),
    GetPage(
        name: _Paths.SINGLE_PRODUCT,
        page: () => SingleProductView(),
        binding: SingleProductBinding(),
        transition: Transition.leftToRight),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
        name: _Paths.PROFILE,
        page: () => const ProfileView(),
        binding: ProfileBinding(),
        transition: Transition.leftToRight),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
      transition: Transition.leftToRight
    ),
  ];
}
