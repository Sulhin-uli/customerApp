import 'package:customer_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:customer_app/app/modules/home/controllers/home_controller.dart';
import 'package:customer_app/app/modules/wishlist/controllers/wishlist_controller.dart';
import 'package:get/get.dart';

import '../controllers/detail_produk_controller.dart';

class DetailProdukBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailProdukController>(
      () => DetailProdukController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<CartController>(
      () => CartController(),
    );
    Get.lazyPut<WishlistController>(
      () => WishlistController(),
    );
  }
}
