import 'package:customer_app/app/data/models/product_model.dart';
import 'package:customer_app/app/modules/home/controllers/home_controller.dart';
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
  // var product = List<ProductModel>.empty().obs;
  // final _homeController = HomeController();

  // @override
  // void onInit() {
  //   _homeController.getData();
  //   // print(_homeController.product
  //   //     .firstWhere((element) => element.slug == "beras-organik")
  //   //     .name);
  //   // TODO: implement onInit
  //   super.onInit();
  // }

  // ProductModel findBySlug(String slug) {
  //   return _homeController.product
  //       .firstWhere((element) => element.slug == slug);
  // }
}
