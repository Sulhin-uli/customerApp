import 'package:customer_app/app/data/models/category_product_model.dart';
import 'package:customer_app/app/data/models/product_model.dart';
import 'package:customer_app/app/data/models/user_model.dart';
import 'package:customer_app/app/data/models/wishlist_model.dart';
import 'package:customer_app/app/data/providers/wishlist_provider.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class WishlistController extends GetxController {
  var isLoading = true.obs;
  var wishlist = List<WishlistModel>.empty().obs;
  var isWishlist = false.obs;
  final box = GetStorage();

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
    // print("object");\
    super.onInit();
  }

  void getData() async {
    final data = box.read("userData") as Map<String, dynamic>;
    var userId = data["id"];
    WishlistProvider().getData(userId).then((response) {
      try {
        // print(response["data"][0]["product_id"]["id"]);
        // print(response["data"][0]["product_id"]["category_product_id"]["id"]);
        // print(response["data"][0]["product_id"]["user_id"]["id"]);
        response["data"].map((e) {
          final data = WishlistModel(
            id: e["id"],
            userId: UserModel(
              id: e["user_id"]["id"],
              name: e["user_id"]["name"],
            ),
            productId: ProductModel(
              id: e["product_id"]["id"],
              name: e["product_id"]["name"],
              slug: e["product_id"]["slug"],
              categoryProductId: CategoryProductModel(
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
              userId: UserModel(
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

  void postData(int? productId) {
    // if (name != '') {
    final data = box.read("userData") as Map<String, dynamic>;
    var userId = data["id"];
    WishlistProvider()
        .postData(
      userId,
      productId,
    )
        .then((response) {
      // }).toList();
      // final data = WishlistModel(
      //   id: response["id"],
      //   userId: response["user_id"],
      //   productId: response["product_id"],
      // );
      // wishlist.add(data);
      wishlist.clear();
      getData();
    });
  }

  void deleteData(int id) {
    final index = wishlist.indexWhere((e) => e.productId!.id == id);
    // print(wishlist[index].id);
    int idWsihlist = wishlist[index].id!;
    WishlistProvider().deleteData(idWsihlist).then(
        (_) => wishlist.removeWhere((element) => element.id == idWsihlist));
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
