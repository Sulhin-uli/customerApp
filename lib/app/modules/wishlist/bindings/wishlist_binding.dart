import 'package:customer_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:get/get.dart';

import '../controllers/wishlist_controller.dart';

class WishlistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WishlistController>(
      () => WishlistController(),
    );
    Get.lazyPut<CartController>(
      () => CartController(),
    );
  }
}
