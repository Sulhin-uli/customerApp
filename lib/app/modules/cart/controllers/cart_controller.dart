import 'package:customer_app/app/data/models/cart_model.dart';
import 'package:customer_app/app/data/models/category_product_model.dart';
import 'package:customer_app/app/data/models/product_model.dart';
import 'package:customer_app/app/data/models/user_model.dart';
import 'package:customer_app/app/data/providers/cart_provider.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  final box = GetStorage();
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
    // if (box.read('isAuth') == true) {
    //   getData();
    // }
    // getData();
    super.onInit();
  }

  void getData() async {
    final data = box.read("userData") as Map<String, dynamic>;
    try {
      CartProvider().getData(data["id"], data["token"]).then(
        (response) {
          try {
            response["data"].map((e) {
              final data = CartModel(
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
                    createdAt: e["product_id"]["category_product_id"]
                        ["created_at"],
                    updatedAt: e["product_id"]["category_product_id"]
                        ["updated_at"],
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
                productQty: e["product_qty"],
                sessionId: e["session_id"],
              );
              cart.add(data);
            }).toList();
          } catch (e) {
            Get.toNamed(Routes.ERROR, arguments: e.toString());
          }
        },
      );
    } catch (e) {
      print("catch");
    }
  }

  void postData(int? productId, int? productQty) {
    final data = box.read("userData") as Map<String, dynamic>;
    CartProvider()
        .postData(data["id"], productId, productQty, 1, data["token"])
        .then((response) {
      // final data = CartModel(
      //   id: response["id"],
      //   userId: response["user_id"],
      //   productQty: response["product_qty"],
      //   productId: response["product_id"],
      //   sessionId: response["session_id"],
      // );
      // cart.add(data);
      cart.clear();
      getData();
      dialogSuccess("Berhasil ditambahkan ke-keranjang");
    });
  }
}
