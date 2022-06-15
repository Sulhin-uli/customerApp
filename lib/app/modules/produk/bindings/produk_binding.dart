import 'package:customer_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:customer_app/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../controllers/produk_controller.dart';

class ProdukBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProdukController>(
      () => ProdukController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<CartController>(
      () => CartController(),
    );
  }
}
