import 'dart:async';

import 'package:customer_app/app/data/models/cart_model.dart';
import 'package:customer_app/app/data/models/category_product_model.dart';
import 'package:customer_app/app/data/models/photo_product_model.dart';
import 'package:customer_app/app/data/models/product_model.dart';
import 'package:customer_app/app/data/models/user_model.dart';
import 'package:customer_app/app/data/providers/cart_provider.dart';
import 'package:customer_app/app/modules/produk/controllers/produk_controller.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CartController extends GetxController {
  final box = GetStorage();
  var isLoading = true.obs;
  var isAllMark = false.obs;
  var isMark = false.obs;
  var lengthMark = 0.obs;
  var total = 0.obs;
  var cart = List<CartModel>.empty().obs;
  var pengiriman = List<CartModel>.empty().obs;
  var photoProduct = List<PhotoProduct>.empty().obs;
  var photoProductByProductId = List<PhotoProduct>.empty().obs;

  ProdukController produkController = Get.put(ProdukController());
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  void onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    isAllMark.value = false;
    total.value = 0;
    isMark(false);
    isLoading(true);
    cart.clear();
    getData();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    print("tes");
    refreshController.refreshCompleted();
  }

  @override
  void onInit() {
    // getDataPhoto();
    // getData();
    super.onInit();

    // Timer.periodic(Duration(seconds: 3), (Timer t) => print(t));
  }

  void updateQty(int id, int qty) {
    final item = findByid(id);
    final data = box.read("userData") as Map<String, dynamic>;
    item.productQty = qty;
    cart.refresh();
    CartProvider().updateQty(id, qty, data["token"]).then((_) {
      addLengthMark();
      addTotal();
    });
  }

  addLengthMark() {
    lengthMark.value = 0;
    for (var item in cart) {
      if (item.isMark! == true) {
        lengthMark.value = lengthMark.value + item.productQty!;
      }
    }
  }

  addTotal() {
    total.value = 0;
    for (var item in cart) {
      if (item.isMark! == true) {
        total.value = total.value +
            (item.productId!.price! *
                int.parse(
                  item.productQty.toString(),
                ));
      }
    }
  }

  void allMark() {
    if (isAllMark == true) {
      for (var item in cart) {
        item.isMark = true;
        isMark.value = true;
        cart.refresh();
      }
      addLengthMark();
      addTotal();
    } else if (isAllMark == false) {
      for (var item in cart) {
        item.isMark = false;
        isMark.value = false;
        cart.refresh();
        lengthMark.value = 0;
        total.value = 0;
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
        // total.value = total.value - (item.productId!.price! * item.productQty!);
      }
    }
  }

  // void runPengiriman() {
  //   var result = cart.where((e) => e.isMark == true);
  //   result.map((e) {
  //     final data = CartModel(
  //       id: e.id!,
  //       userId: UserModel(
  //         id: e.userId!.id,
  //         name: e.userId!.name,
  //       ),
  //       isMark: e.isMark,
  //       productId: ProductModel(
  //         id: e.productId!.id,
  //         name: e.productId!.name,
  //         // slug: e.productId!.slug,
  //         image: e.productId!.image,
  //         // categoryProductId: CategoryProductModel(
  //         //   id: e.productId!.categoryProductId!.id,
  //         //   name: e.productId!.categoryProductId!.name,
  //         //   slug: e.productId!.categoryProductId!.slug,
  //         // ),
  //         // code: e.productId!.code,
  //         stoke: e.productId!.stoke,
  //         price: e.productId!.price,
  //         // desc: e.productId!.desc,
  //         userId: UserModel(
  //           id: e.productId!.userId!.id,
  //           name: e.productId!.userId!.name,
  //         ),
  //         // isActive: e.productId!.isActive!,
  //       ),
  //       productQty: e.productQty,
  //       // sessionId: e.sessionId,
  //     );
  //     pengiriman.add(data);
  //   }).toList();
  // }

  // void getDataPhoto() async {
  //   PhotoProductProvider().getData().then((response) {
  //     try {
  //       response["data"].map((e) {
  //         final data = PhotoProduct(
  //           id: e["id"],
  //           productId: ProductModel(
  //             id: e["product_id"]["id"],
  //             name: e["product_id"]["name"],
  //             slug: e["product_id"]["slug"],
  //             categoryProductId: CategoryProductModel(
  //               id: e["product_id"]["category_product_id"]["id"],
  //               name: e["product_id"]["category_product_id"]["name"],
  //               slug: e["product_id"]["category_product_id"]["slug"],
  //               createdAt: e["product_id"]["category_product_id"]["created_at"],
  //               updatedAt: e["product_id"]["category_product_id"]["updated_at"],
  //             ),
  //             code: e["product_id"]["code"],
  //             stoke: e["product_id"]["stoke"],
  //             price: e["product_id"]["price"],
  //             desc: e["product_id"]["desc"],
  //             userId: UserModel(
  //               id: e["product_id"]["user_id"]["id"],
  //               name: e["product_id"]["user_id"]["name"],
  //             ),
  //             isActive: e["product_id"]["is_active"],
  //           ),
  //           name: e["name"],
  //           createdAt: e["created_at"],
  //           updatedAt: e["updated_at"],
  //         );
  //         photoProduct.add(data);
  //       }).toList();
  //     } catch (e) {
  //       // print(e.toString());
  //       print("error di getPhoto : $e");
  //     }
  //   });
  // }

  // void getPhotoProductById(int productId) {
  //   for (var item in photoProduct) {
  //     if (item.productId!.id == productId) {
  //       final data = PhotoProduct(
  //         id: item.id,
  //         productId: ProductModel(
  //           id: item.productId!.id,
  //           name: item.productId!.name,
  //           slug: item.productId!.slug,
  //           categoryProductId: CategoryProductModel(
  //             id: item.productId!.categoryProductId!.id,
  //             name: item.productId!.categoryProductId!.name,
  //             slug: item.productId!.categoryProductId!.slug,
  //             createdAt: item.productId!.categoryProductId!.createdAt,
  //             updatedAt: item.productId!.categoryProductId!.updatedAt,
  //           ),
  //           code: item.productId!.code,
  //           stoke: item.productId!.stoke,
  //           price: item.productId!.price,
  //           desc: item.productId!.desc,
  //           userId: UserModel(
  //             id: item.productId!.userId!.id,
  //             name: item.productId!.userId!.name,
  //           ),
  //           isActive: item.productId!.isActive,
  //         ),
  //         name: item.name,
  //         createdAt: item.createdAt,
  //         updatedAt: item.updatedAt,
  //       );
  //       photoProductByProductId.insert(0, data);
  //     } else {
  //       print("not found");
  //     }
  //   }
  // }

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
            response["data"].map((e) {
              final data = CartModel.fromJson(e as Map<String, dynamic>);
              cart.add(data);
              // final data = CartModel(
              //   id: e["id"] as int,
              //   userId: UserModel(
              //     id: e["user_id"]["id"] as int,
              //     name: e["user_id"]["name"],
              //   ),
              //   isMark: false,
              //   productId: ProductModel(
              //     id: e["product_id"]["id"] as int,
              //     name: e["product_id"]["name"],
              //     slug: e["product_id"]["slug"],
              //     categoryProductId: CategoryProductModel(
              //       id: e["product_id"]["category_product_id"]["id"] as int,
              //       name: e["product_id"]["category_product_id"]["name"],
              //       slug: e["product_id"]["category_product_id"]["slug"],
              //       createdAt: e["product_id"]["category_product_id"]
              //           ["created_at"],
              //       updatedAt: e["product_id"]["category_product_id"]
              //           ["updated_at"],
              //     ),
              //     code: e["product_id"]["code"],
              //     stoke: e["product_id"]["stoke"] as int,
              //     price: e["product_id"]["price"] as int,
              //     desc: e["desc"],
              //     userId: UserModel(
              //       id: e["product_id"]["user_id"]["id"] as int,
              //       name: e["product_id"]["user_id"]["name"],
              //     ),
              //     isActive: e["is_active"],
              //   ),
              //   productQty: e["product_qty"] as int,
              //   sessionId: e["session_id"],
              // );
              // cart.add(data);
              // final item = findByid(e["id"]);
              // for (var itemPhoto in photoProduct) {
              //   if (itemPhoto.productId!.id == item.productId!.id) {
              //     item.productId!.image = itemPhoto.name;
              //     cart.refresh();
              //   }
              // }
            }).toList();
          },
        );
      } catch (e) {
        // print(e.toString());
        print("error di cart : $e");
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
      // print(response);
      // final data = CartModel(
      //   id: response["data"]["id"] as int,
      //   userId: UserModel(
      //     id: response["data"]["user_id"]["id"] as int,
      //     name: response["data"]["user_id"]["name"],
      //   ),
      //   isMark: false,
      //   productId: ProductModel(
      //     id: response["data"]["product_id"]["id"] as int,
      //     name: response["data"]["product_id"]["name"],
      //     slug: response["data"]["product_id"]["slug"],
      //     categoryProductId: CategoryProductModel(
      //       id: response["data"]["product_id"]["category_product_id"]["id"]
      //           as int,
      //       name: response["data"]["product_id"]["category_product_id"]["name"],
      //       slug: response["data"]["product_id"]["category_product_id"]["slug"],
      //       createdAt: response["data"]["product_id"]["category_product_id"]
      //           ["created_at"],
      //       updatedAt: response["data"]["product_id"]["category_product_id"]
      //           ["updated_at"],
      //     ),
      //     code: response["data"]["product_id"]["code"],
      //     stoke: response["data"]["product_id"]["stoke"] as int,
      //     price: response["data"]["product_id"]["price"] as int,
      //     desc: response["data"]["desc"],
      //     userId: UserModel(
      //       id: response["data"]["product_id"]["user_id"]["id"] as int,
      //       name: response["data"]["product_id"]["user_id"]["name"],
      //     ),
      //     isActive: response["data"]["isActive"],
      //   ),
      //   productQty: response["data"]["product_qty"] as int,
      //   sessionId: response["data"]["session_id"],
      // );
      final data = CartModel.fromJson(response["data"] as Map<String, dynamic>);
      cart.add(data);
      // final item = findByid(response["id"]);
      // for (var itemPhoto in photoProduct) {
      //   if (itemPhoto.productId!.id == item.productId!.id) {
      //     item.productId!.image = itemPhoto.name;
      //     cart.refresh();
      //   }
      // }
      // photoProduct.clear();
      // cart.clear();
      // getDataPhoto();
      // getData();
      dialogSuccess("Berhasil ditambahkan keranjang");
    });
  }

  void deleteData(int id) {
    final item = findByid(id);
    if (item.isMark == true) {
      total.value = total.value - (item.productId!.price! * item.productQty!);
    }

    final data = box.read("userData") as Map<String, dynamic>;

    CartProvider()
        .deleteData(id, data["token"])
        .then((_) => cart.removeWhere((element) => element.id == id));
    isAllMark.value = false;
    isMark.value = false;
  }
}
