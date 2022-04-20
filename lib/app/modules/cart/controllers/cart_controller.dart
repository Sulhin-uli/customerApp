import 'package:customer_app/app/data/models/cart_model.dart';
import 'package:customer_app/app/data/providers/cart_provider.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var isLoading = true.obs;
  var cart = List<CartModel>.empty().obs;

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
    CartProvider().getData(1).then((response) {
      try {
        // print(response["data"][0]["product_id"]["id"]);
        // print(response["data"][0]["product_id"]["category_product_id"]["id"]);
        // print(response["data"][0]["product_id"]["user_id"]["id"]);
        response["data"].map((e) {
          final data = CartModel(
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
            quantity: e["quantity"],
          );
          cart.add(data);
        }).toList();
      } catch (e) {
        Get.toNamed(Routes.ERROR, arguments: e.toString());
      }

      // print(product[0].categoryProductId!.id);
    });
  }

  void postData(int? userId, int? productId, int? quantity) {
    // if (name != '') {
    CartProvider().postData(userId, productId, quantity).then((response) {
      final data = CartModel(
        id: response["id"],
        userId: response["user_id"],
        productId: response["product_id"],
        quantity: response["quantity"],
      );
      cart.add(data);
      cart.clear();
      getData();
      // print(cart[0].productId!.name);
      dialogSuccess("Berhasil ditambahkan ke-keranjang");

      // Get.back();
    });
    // } else {
    // dialogError("Semua Input Harus Diisi");
    // }
  }
}
