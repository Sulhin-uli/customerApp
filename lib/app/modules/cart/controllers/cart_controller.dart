import 'package:customer_app/app/data/models/cart_model.dart';
import 'package:customer_app/app/data/models/category_product_model.dart';
import 'package:customer_app/app/data/models/photo_product_model.dart';
import 'package:customer_app/app/data/models/product_model.dart';
import 'package:customer_app/app/data/models/user_model.dart';
import 'package:customer_app/app/data/providers/cart_provider.dart';
import 'package:customer_app/app/data/providers/photo_product_provider.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  final box = GetStorage();
  var isLoading = true.obs;
  var isAllMark = false.obs;
  var isMark = false.obs;
  var cart = List<CartModel>.empty().obs;
  var photoProduct = List<PhotoProduct>.empty().obs;
  var photoProductByProductId = List<PhotoProduct>.empty().obs;

  void allMark() {
    if (isAllMark == true) {
      for (var item in cart) {
        item.isMark = true;
        isMark.value = true;
        cart.refresh();
      }
    } else if (isAllMark == false) {
      for (var item in cart) {
        item.isMark = false;
        isMark.value = false;
        cart.refresh();
      }
    }
  }

  void checkMark() {
    int trueMark = 0;
    for (var item in cart) {
      if (item.isMark == true) {
        trueMark++;
      }
    }
    if (trueMark > 0) {
      isMark(true);
    } else {
      isMark(false);
    }
  }

  void checkAllMark() {
    int trueAllMark = 0;
    for (var item in cart) {
      if (item.isMark == true) {
        trueAllMark++;
      }
    }
    if (trueAllMark != cart.length) {
      isAllMark(false);
    } else {
      isAllMark(true);
    }
  }

  void deleteMultiple() {
    for (var item in cart) {
      if (item.isMark == true) {
        deleteData(item.id!);
      }
    }
  }

  void dialogSuccess(String msg) {
    Get.defaultDialog(
      title: "Berhasil",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            msg,
            textAlign: TextAlign.center,
          ),
          ElevatedButton(onPressed: () => Get.back(), child: Text("Tutup"))
          // IconButton(onPressed: () => Get.back(), icon: Icon(Icons.close)),
        ],
      ),
    );
  }

  @override
  void onInit() {
    getDataPhoto();
    getData();
    super.onInit();
  }

  void getDataPhoto() async {
    PhotoProductProvider().getData().then((response) {
      try {
        response["data"].map((e) {
          final data = PhotoProduct(
            id: e["id"],
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
              desc: e["product_id"]["desc"],
              userId: UserModel(
                id: e["product_id"]["user_id"]["id"],
                name: e["product_id"]["user_id"]["name"],
              ),
              isActive: e["product_id"]["isActive"],
            ),
            name: e["name"],
            createdAt: e["created_at"],
            updatedAt: e["updated_at"],
          );
          photoProduct.add(data);
        }).toList();
      } catch (e) {
        print(e.toString());
      }
    });
  }

  void getPhotoProductById(int productId) {
    for (var item in photoProduct) {
      if (item.productId!.id == productId) {
        final data = PhotoProduct(
          id: item.id,
          productId: ProductModel(
            id: item.productId!.id,
            name: item.productId!.name,
            slug: item.productId!.slug,
            categoryProductId: CategoryProductModel(
              id: item.productId!.categoryProductId!.id,
              name: item.productId!.categoryProductId!.name,
              slug: item.productId!.categoryProductId!.slug,
              createdAt: item.productId!.categoryProductId!.createdAt,
              updatedAt: item.productId!.categoryProductId!.updatedAt,
            ),
            code: item.productId!.code,
            stoke: item.productId!.stoke,
            price: item.productId!.price,
            desc: item.productId!.desc,
            userId: UserModel(
              id: item.productId!.userId!.id,
              name: item.productId!.userId!.name,
            ),
            isActive: item.productId!.isActive,
          ),
          name: item.name,
          createdAt: item.createdAt,
          updatedAt: item.updatedAt,
        );
        photoProductByProductId.insert(0, data);
      } else {
        print("not found");
      }
    }
  }

  // cari berdasarka id
  CartModel findByid(int id) {
    return cart.firstWhere((element) => element.id == id);
  }

  void getData() async {
    try {
      isLoading(true);
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
                  isMark: false,
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
                final item = findByid(e["id"]);
                for (var itemPhoto in photoProduct) {
                  if (itemPhoto.productId!.id == item.productId!.id) {
                    item.productId!.image = itemPhoto.name;
                    cart.refresh();
                  }
                }
              }).toList();
            } catch (e) {
              Get.toNamed(Routes.ERROR, arguments: e.toString());
            }
          },
        );
      } catch (e) {
        print("load cart gagal");
      }
    } finally {
      isLoading(false);
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
      photoProduct.clear();
      cart.clear();
      getDataPhoto();
      getData();
      dialogSuccess("Berhasil ditambahkan ke-keranjang");
    });
  }

  void deleteData(int id) {
    final data = box.read("userData") as Map<String, dynamic>;

    CartProvider()
        .deleteData(id, data["token"])
        .then((_) => cart.removeWhere((element) => element.id == id));
  }
}
