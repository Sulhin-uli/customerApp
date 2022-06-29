import 'package:customer_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:customer_app/app/modules/home/controllers/header_controller.dart';
import 'package:customer_app/app/modules/login/controllers/auth_controller.dart';
import 'package:customer_app/app/modules/produk/controllers/produk_controller.dart';
import 'package:customer_app/app/modules/saya/controllers/saya_controller.dart';
import 'package:customer_app/app/modules/wishlist/controllers/wishlist_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<CartController>(
      () => CartController(),
    );
    Get.lazyPut<WishlistController>(
      () => WishlistController(),
    );
    Get.lazyPut<ProdukController>(
      () => ProdukController(),
    );
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
    Get.lazyPut<HeaderController>(
      () => HeaderController(),
    );
    Get.lazyPut<SayaController>(
      () => SayaController(),
    );
  }
}
