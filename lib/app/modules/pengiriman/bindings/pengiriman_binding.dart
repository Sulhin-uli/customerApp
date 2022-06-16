import 'package:customer_app/app/modules/alamat/controllers/alamat_controller.dart';
import 'package:customer_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:get/get.dart';

import '../controllers/pengiriman_controller.dart';

class PengirimanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengirimanController>(
      () => PengirimanController(),
    );
    Get.lazyPut<AlamatController>(
      () => AlamatController(),
    );
    Get.lazyPut<CartController>(
      () => CartController(),
    );
  }
}
