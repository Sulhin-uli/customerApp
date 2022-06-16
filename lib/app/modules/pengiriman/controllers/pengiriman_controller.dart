import 'package:customer_app/app/data/models/cart_model.dart';
import 'package:customer_app/app/modules/alamat/controllers/alamat_controller.dart';
import 'package:customer_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:get/get.dart';

class PengirimanController extends GetxController {
  AlamatController alamatController = Get.find();
  CartController cartController = Get.find();

  @override
  void onInit() {
    super.onInit();
  }
}
