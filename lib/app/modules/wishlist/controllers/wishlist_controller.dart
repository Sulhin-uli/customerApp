import 'package:customer_app/app/data/models/category_product_model.dart';
import 'package:customer_app/app/data/models/photo_product_model.dart';
import 'package:customer_app/app/data/models/product_model.dart';
import 'package:customer_app/app/data/models/user_model.dart';
import 'package:customer_app/app/data/models/wishlist_model.dart';
import 'package:customer_app/app/data/providers/photo_product_provider.dart';
import 'package:customer_app/app/data/providers/wishlist_provider.dart';
import 'package:customer_app/app/modules/login/controllers/auth_controller.dart';
import 'package:customer_app/app/modules/produk/controllers/produk_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class WishlistController extends GetxController {
  var isLoading = true.obs;
  var wishlist = List<WishlistModel>.empty().obs;
  var isWishlist = false.obs;
  final box = GetStorage();
  var photoProduct = List<PhotoProduct>.empty().obs;
  var photoProductByProductId = List<PhotoProduct>.empty().obs;
  final authC = Get.put(AuthController(), permanent: true);
  ProdukController produkController = Get.put(ProdukController());
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  void onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    isLoading(true);
    wishlist.clear();
    getData();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    print("tes");
    refreshController.refreshCompleted();
  }

  void dialogSuccess(String msg) {
    Get.defaultDialog(
      title: "Peringatan",
      content: Text(
        msg,
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  void onInit() {
    // if (authC.isAuth.isTrue) {
    //   // getDataPhoto();
    // }
    getData();
    super.onInit();
  }

  void getData() async {
    try {
      isLoading(true);
      final data = box.read("userData") as Map<String, dynamic>;
      var userId = data["id"];
      WishlistProvider().getData(userId, data["token"]).then((response) {
        try {
          response["data"].map((e) {
            final data = WishlistModel.fromJson(e as Map<String, dynamic>);
            wishlist.add(data);
            // final data = WishlistModel(
            //   id: e["id"],
            //   userId: UserModel(
            //     id: e["user_id"]["id"],
            //     name: e["user_id"]["name"],
            //   ),
            //   productId: ProductModel(
            //     id: e["product_id"]["id"],
            //     name: e["product_id"]["name"],
            //     slug: e["product_id"]["slug"],
            //     categoryProductId: CategoryProductModel(
            //       id: e["product_id"]["category_product_id"]["id"],
            //       name: e["product_id"]["category_product_id"]["name"],
            //       slug: e["product_id"]["category_product_id"]["slug"],
            //       createdAt: e["product_id"]["category_product_id"]
            //           ["created_at"],
            //       updatedAt: e["product_id"]["category_product_id"]
            //           ["updated_at"],
            //     ),
            //     code: e["product_id"]["code"],
            //     stoke: e["product_id"]["stoke"],
            //     price: e["product_id"]["price"],
            //     desc: e["desc"],
            //     userId: UserModel(
            //       id: e["product_id"]["user_id"]["id"],
            //       name: e["product_id"]["user_id"]["name"],
            //     ),
            //     isActive: e["isActive"],
            //   ),
            // );
            // wishlist.add(data);

            // final item = findByid(e["id"]);
            // for (var itemPhoto in photoProduct) {
            //   if (itemPhoto.productId!.id == item.productId!.id) {
            //     item.productId!.image = itemPhoto.name;
            //     wishlist.refresh();
            //   }
            // }
          }).toList();
        } catch (e) {
          Get.toNamed(Routes.ERROR, arguments: e.toString());
        }

        // print(product[0].categoryProductId!.id);
      });
    } finally {
      isLoading(false);
    }
  }

  void postData(int? productId) {
    // if (name != '') {
    final data = box.read("userData") as Map<String, dynamic>;
    var userId = data["id"];
    WishlistProvider()
        .postData(userId, productId, data["token"])
        .then((response) {
      final data =
          WishlistModel.fromJson(response["data"] as Map<String, dynamic>);
      wishlist.add(data);
      // }).toList();
      // final data = WishlistModel(
      //   id: response["id"],
      //   userId: response["user_id"],
      //   productId: response["product_id"],
      // );
      // wishlist.add(data);
      // wishlist.clear();
      // getData();
    });
  }

  void deleteData(int id) {
    final data = box.read("userData") as Map<String, dynamic>;

    // print(id);
    // final index = wishlist.indexWhere((e) => e.productId!.id == id);
    // print(wishlist[index].id);
    // int idWsihlist = wishlist[index].id!;
    WishlistProvider()
        .deleteData(id, data["token"])
        .then((_) => wishlist.removeWhere((element) => element.id == id));
  }

  void deleteDatabyIdProduct(int id) {
    final data = box.read("userData") as Map<String, dynamic>;
    WishlistModel find(int idProduct) =>
        wishlist.firstWhere((e) => e.productId!.id == id);
    WishlistProvider().deleteData(find(id).id, data["token"]).then(
        (_) => wishlist.removeWhere((element) => element.productId!.id == id));
  }

  // cari berdasarka id
  WishlistModel findByid(int id) {
    return wishlist.firstWhere((element) => element.id == id);
  }

  void foundWishlist(int id) {
    final found = wishlist.where((e) => e.productId!.id == id);
    if (found.isNotEmpty) {
      isWishlist.value = true;
    } else {
      isWishlist.value = false;
    }
  }
}
