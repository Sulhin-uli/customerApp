import 'package:customer_app/app/data/models/category_product_model.dart';
import 'package:customer_app/app/data/models/photo_product_model.dart';
import 'package:customer_app/app/data/models/product_model.dart';
import 'package:customer_app/app/data/models/user_model.dart';
import 'package:customer_app/app/data/providers/category_product_provider.dart';
import 'package:customer_app/app/data/providers/photo_product_provider.dart';
import 'package:customer_app/app/data/providers/product_provider.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProdukController extends GetxController {
  var carouselIndex = 0.obs;
  var resultSearch = false.obs;
  var product = List<ProductModel>.empty().obs;
  var productCategory = List<CategoryProductModel>.empty().obs;
  var productSearch = List<ProductModel>.empty().obs;
  var photoProduct = List<PhotoProduct>.empty().obs;
  var photoProductByProductId = List<PhotoProduct>.empty().obs;
  late TextEditingController seacrh;
  var isExpensive = true.obs;
  var isHideButtonPrice = true.obs;
  var isFound = true.obs;
  var isAddLengthProduct = false.obs;
  var page = 1.obs;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  ScrollController controller = ScrollController();

  void onRefresh() async {
    // monitor network fetch
    product.clear();
    await Future.delayed(Duration(milliseconds: 1000));
    // isLoading(true);
    // wishlist.clear();
    // getData();
    page.value = 1;
    // product.clear;
    // print("tes scroll");
    getData();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    // await Future.delayed(Duration(milliseconds: 3000));
    // page.value = page.value + 1;
    // getData();

    // // print("scroll bawah");
    // // dialog("title", "msg");
    // refreshController.refreshCompleted();
  }

  @override
  void onInit() {
    super.onInit();
    getDataCategory();
    getDataPhoto();
    getData();
    seacrh = TextEditingController();
  }

  void addItems() {
    print(page);
    if (isAddLengthProduct.value == true) {
      page.value = page.value + 1;
      getData();
      isAddLengthProduct(false);
    }
  }

  void produkNotFound() async {
    await Future.delayed(const Duration(seconds: 0), () {
      isFound(false);
    });
  }

  void produkFound() async {
    await Future.delayed(const Duration(seconds: 0), () {
      isFound(true);
    });
  }

  void productExpensive() {
    product.sort((a, b) => b.price!.compareTo(a.price!));
  }

  void productCheap() {
    product.sort((a, b) => a.price!.compareTo(b.price!));
  }

  void runSearch(String search) {
    if (search == "") {
      dialog("Peringatan", "Kolom tidak boleh kosong");
    } else {
      Get.toNamed(Routes.PRODUK);
    }
  }

  void getDataPhoto() async {
    PhotoProductProvider().getData().then((response) {
      try {
        response["data"].map((e) {
          final data = PhotoProduct.fromJson(e as Map<String, dynamic>);
          photoProduct.add(data);
        }).toList();
      } catch (e) {
        print(e.toString());
      }
    });
  }

  // void getPhotoProductById(int productId) {
  //   for (var item in photoProduct) {
  //     print(photoProduct);
  //     // if (item.productId!.id == productId) {
  //     //   final data = PhotoProduct(
  //     //     id: item.id,
  //     //     productId: ProductModel(
  //     //       id: item.productId!.id,
  //     //       name: item.productId!.name,
  //     //       slug: item.productId!.slug,
  //     //       categoryProductId: CategoryProductModel(
  //     //         id: item.productId!.categoryProductId!.id,
  //     //         name: item.productId!.categoryProductId!.name,
  //     //         slug: item.productId!.categoryProductId!.slug,
  //     //         createdAt: item.productId!.categoryProductId!.createdAt,
  //     //         updatedAt: item.productId!.categoryProductId!.updatedAt,
  //     //       ),
  //     //       code: item.productId!.code,
  //     //       stoke: item.productId!.stoke,
  //     //       price: item.productId!.price,
  //     //       desc: item.productId!.desc,
  //     //       userId: UserModel(
  //     //         id: item.productId!.userId!.id,
  //     //         name: item.productId!.userId!.name,
  //     //       ),
  //     //       isActive: item.productId!.isActive,
  //     //     ),
  //     //     name: item.name,
  //     //     createdAt: item.createdAt,
  //     //     updatedAt: item.updatedAt,
  //     //   );
  //     //   photoProductByProductId.insert(0, data);
  //     // } else {
  //     //   print("not found");
  //     // }
  //   }
  // }

  void getData() async {
    ProductProvider().getData(page.value).then((response) {
      try {
        if (response["data"].length != 0) {
          response["data"].map((e) {
            final data = ProductModel.fromJson(e as Map<String, dynamic>);
            product.add(data);
          }).toList();
          isAddLengthProduct(true);
        }
      } catch (e) {
        // Get.toNamed(Routes.ERROR, arguments: e.toString());
      }
    });
  }

  void getDataCategory() async {
    CategoryProductProvider().getData().then((response) {
      try {
        response["data"].map((e) {
          final data = CategoryProductModel(
            id: e["id"],
            name: e["name"],
            slug: e["slug"],
            isActive: e["is_active"],
            createdAt: e["created_at"],
            updatedAt: e["updated_at"],
          );
          productCategory.add(data);
        }).toList();
      } catch (e) {
        // Get.toNamed(Routes.ERROR, arguments: e.toString());
      }
    });
  }

// cari berdasarka id
  ProductModel findByid(int id) {
    return product.firstWhere((element) => element.id == id);
  }

  ProductModel findBySlug(String slug) {
    return product.firstWhere((element) => element.slug == slug);
  }
}
