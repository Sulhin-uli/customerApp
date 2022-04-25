import 'package:customer_app/app/data/models/wishlist_model.dart';
import 'package:customer_app/app/data/providers/wishlist_provider.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  var isLoading = true.obs;
  var wishlist = List<WishlistModel>.empty().obs;
  var isWishlist = false.obs;

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
    getData();
    super.onInit();
  }

  void getData() async {
    WishlistProvider().getData(1).then((response) {
      try {
        // print(response["data"][0]["product_id"]["id"]);
        // print(response["data"][0]["product_id"]["category_product_id"]["id"]);
        // print(response["data"][0]["product_id"]["user_id"]["id"]);
        response["data"].map((e) {
          final data = WishlistModel(
            id: e["id"],
            userId: UserId(
              id: e["user_id"]["id"],
              name: e["user_id"]["name"],
            ),
            productId: ProductId(
              id: e["product_id"]["id"],
              name: e["product_id"]["name"],
              slug: e["product_id"]["slug"],
              categoryProductId: CategoryProductId(
                id: e["product_id"]["category_product_id"]["id"],
                name: e["product_id"]["category_product_id"]["name"],
                slug: e["product_id"]["category_product_id"]["slug"],
                createdAt: e["product_id"]["category_product_id"]["created_at"],
                updatedAt: e["product_id"]["category_product_id"]["updated_at"],
              ),
              code: e["product_id"]["code"],
              stoke: e["product_id"]["stoke"],
              price: e["product_id"]["price"],
              desc: e["desc"],
              userId: UserId(
                id: e["product_id"]["user_id"]["id"],
                name: e["product_id"]["user_id"]["name"],
              ),
              isActive: e["isActive"],
            ),
          );
          wishlist.add(data);
        }).toList();
      } catch (e) {
        Get.toNamed(Routes.ERROR, arguments: e.toString());
      }

      // print(product[0].categoryProductId!.id);
    });
  }

  void postData(int? userId, int? productId) {
    // if (name != '') {
    WishlistProvider()
        .postData(
      userId,
      productId,
    )
        .then((response) {
      final data = WishlistModel(
        id: response["id"],
        userId: response["user_id"],
        productId: response["product_id"],
      );
      wishlist.add(data);
      wishlist.clear();
      getData();
      // print(wishlist[0].productId!.name);
      // dialogSuccess("Berhasil ditambahkan ke-keranjang");

      // Get.back();
    });
    // } else {
    // dialogError("Semua Input Harus Diisi");
    // }
  }

  void deleteData(int id) {
    WishlistProvider()
        .deleteData(id)
        .then((_) => wishlist.removeWhere((element) => element.id == id));
  }

  void foundWishlist(int id) {
    final found = wishlist.where((e) => e.id == id);
    if (found.isNotEmpty) {
      isWishlist.value = true;
    }
  }
}
