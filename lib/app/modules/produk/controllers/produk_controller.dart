import 'package:customer_app/app/data/models/category_product_model.dart';
import 'package:customer_app/app/data/models/photo_product_model.dart';
import 'package:customer_app/app/data/models/product_model.dart';
import 'package:customer_app/app/data/models/toko_modal.dart';
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
  var photoProduct = List<PhotoProduct>.empty().obs;
  var photoProductByProductId = List<PhotoProduct>.empty().obs;
  var isExpensive = true.obs;
  var isHideButtonPrice = true.obs;
  var isFound = true.obs;
  var isAddLengthProduct = false.obs;
  var page = 1.obs;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  ScrollController controller = ScrollController();

  void onLoading() async {}

  @override
  void onInit() {
    super.onInit();
    getDataCategory();
    getDataPhoto();
    getDataForHome();
    seacrh = TextEditingController();
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
  // ProductModel findByid(int id) {
  //   return product.firstWhere((element) => element.id == id);
  // }

  ProductModel findBySlug(String slug, String isData) {
    if (isData == "search") {
      return productSearch.firstWhere((element) => element.slug == slug);
    } else if (isData == "category") {
      return productByCategory.firstWhere((element) => element.slug == slug);
    } else if (isData == "home") {
      return productHome.firstWhere((element) => element.slug == slug);
    } else {
      return productDetail.firstWhere((element) => element.slug == slug);
    }
  }

// searching
  late TextEditingController seacrh;
  var searchText = "".obs;
  var pageSearch = 1.obs;
  var productSearch = List<ProductModel>.empty().obs;

  void runSearch(String searchType) {
    if (searchType == "") {
      dialog("Peringatan", "Kolom tidak boleh kosong");
    } else {
      productSearch.clear();
      // print(productSearch.length);
      pageSearch.value = 1;
      searchText.value = searchType;
      Get.toNamed(Routes.PRODUK);
      getDataSearch();
    }
  }

  void getDataSearch() async {
    try {
      ProductProvider()
          .getDataSearch(pageSearch.value, searchText.value)
          .then((response) {
        if (response["data"].length != 0) {
          response["data"].map((e) {
            final data = ProductModel.fromJson(e as Map<String, dynamic>);
            productSearch.add(data);
          }).toList();
          pageSearch.value = pageSearch.value + 1;
        } else {}
      });
    } catch (e) {
      dialogError(e.toString());
    }
  }

  void onRefreshSearch() async {
    productSearch.clear();
    await Future.delayed(Duration(milliseconds: 1000));
    pageSearch.value = 1;
    getDataSearch();
    refreshController.refreshCompleted();
  }

  void addItemsSearch() {
    getDataSearch();
  }

// Category
  var idCategory = 0.obs;
  var pageCategory = 1.obs;
  var productByCategory = List<ProductModel>.empty().obs;

  void runCategory(int idCategoryText, String nameCategory) {
    productByCategory.clear();
    // print(idCategoryText);
    pageCategory.value = 1;
    idCategory.value = idCategoryText;
    Get.toNamed(Routes.KATEGORI_VIEW, arguments: nameCategory);
    getDataByCategory();
  }

  void getDataByCategory() async {
    try {
      ProductProvider()
          .getDataCategory(pageCategory.value, idCategory.value)
          .then((response) {
        if (response["data"].length != 0) {
          response["data"].map((e) {
            final data = ProductModel.fromJson(e as Map<String, dynamic>);
            productByCategory.add(data);
          }).toList();
          pageCategory.value = pageCategory.value + 1;
        } else {}
      });
    } catch (e) {
      dialogError(e.toString());
    }
  }

  void onRefreshCategory() async {
    productByCategory.clear();
    await Future.delayed(Duration(milliseconds: 1000));
    pageCategory.value = 1;
    getDataByCategory();
    refreshController.refreshCompleted();
  }

  void addItemsCategory() {
    getDataByCategory();
  }

  // detail produk
  var productDetail = List<ProductModel>.empty().obs;

  void runDetail(String slug) async {
    productDetail.clear();
    getDataDetail(slug);
    await Future.delayed(Duration(milliseconds: 1000));

    Get.toNamed(
      Routes.DETAIL_PRODUK,
      arguments: [slug, "detail"],
    );
  }

  void getDataDetail(String slug) async {
    try {
      ProductProvider().findBySlug(slug).then((response) {
        final data =
            ProductModel.fromJson(response["data"] as Map<String, dynamic>);
        productDetail.add(data);
      });
    } catch (e) {
      dialogError(e.toString());
    }
  }

// get data for home
  var productHome = List<ProductModel>.empty().obs;

  void getDataForHome() {
    try {
      ProductProvider().getData(1).then((response) {
        if (response["data"].length != 0) {
          response["data"].map((e) {
            final data = ProductModel.fromJson(e as Map<String, dynamic>);
            productHome.add(data);
          }).toList();
        } else {}
      });
    } catch (e) {
      dialogError(e.toString());
    }
  }

  // get data toko
  runDetailToko(int id, String name) async {
    toko.clear();
    getDataTokoById(id);
    await Future.delayed(Duration(milliseconds: 1000));

    Get.toNamed(Routes.DETAIL_TOKO, arguments: name);
  }

  var toko = List<Toko>.empty().obs;

  void getDataTokoById(int id) {
    try {
      ProductProvider().tokoById(id).then((response) {
        final data = Toko.fromJson(response["data"] as Map<String, dynamic>);
        toko.add(data);
      });
    } catch (e) {
      dialogError(e.toString());
    }
  }
}
