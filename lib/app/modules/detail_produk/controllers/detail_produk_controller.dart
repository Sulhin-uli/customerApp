import 'package:customer_app/app/data/models/product_model.dart';
import 'package:customer_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DetailProdukController extends GetxController {
  var isLoading = false.obs;
  var isWishlist = false.obs;

  void changeWishlist() {
    if (isWishlist.value == false) {
      isWishlist.value = true;
    } else if (isWishlist.value == true) {
      isWishlist.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
