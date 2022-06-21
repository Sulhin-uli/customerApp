import 'package:customer_app/app/data/models/banner_main_menu_model.dart';
import 'package:customer_app/app/data/models/category_product_model.dart';
import 'package:customer_app/app/data/models/main_menu_model.dart';
import 'package:customer_app/app/data/models/photo_product_model.dart';
import 'package:customer_app/app/data/models/product_model.dart';
import 'package:customer_app/app/data/models/user_model.dart';
import 'package:customer_app/app/data/providers/photo_product_provider.dart';
import 'package:customer_app/app/data/providers/product_provider.dart';
import 'package:customer_app/app/modules/produk/controllers/produk_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final box = GetStorage();
  var product = List<ProductModel>.empty().obs;
  var menu = List<MainMenuModel>.empty().obs;
  var banner = List<BannerMainMenuModel>.empty().obs;
  var carouselIndex = 0.obs;
  // var product = List<ProductModel>.empty().obs;
  var photoProduct = List<PhotoProduct>.empty().obs;
  var photoProductByProductId = List<PhotoProduct>.empty().obs;
  var tabIndex = 0.obs;
  ProdukController produkController = Get.put(ProdukController());

  @override
  void onInit() {
    // getDataPhoto();
    // getData();
    mainMenu();
    bannerHome();
    super.onInit();
  }

  void changeTabIndex(int index) {
    if (box.read('isAuth') == true) {
      tabIndex.value = index;
    } else if (box.read('isAuth') == false) {
      if (index != 1 && index != 2) {
        tabIndex.value = index;
      } else {
        Get.toNamed(Routes.LOGIN);
      }
    }
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

  void getData() async {
    ProductProvider().getData().then((response) {
      try {
        response["data"].map((e) {
          final data = ProductModel(
            id: e["id"],
            name: e["name"],
            slug: e["slug"],
            categoryProductId: CategoryProductModel(
              id: e["category_product_id"]["id"],
              name: e["category_product_id"]["name"],
              slug: e["category_product_id"]["slug"],
              createdAt: e["category_product_id"]["created_at"],
              updatedAt: e["category_product_id"]["updated_at"],
            ),
            code: e["code"],
            stoke: e["stoke"],
            price: e["price"],
            desc: e["desc"],
            userId: UserModel(
              id: e["category_product_id"]["id"],
              name: e["category_product_id"]["name"],
            ),
            isActive: e["isActive"],
          );
          product.add(data);
          final item = findByid(e["id"]);
          // print(item.id);
          // print(photoProduct.length);
          for (var itemPhoto in photoProduct) {
            if (itemPhoto.productId!.id == item.id) {
              item.image = itemPhoto.name;
              product.refresh();
            }
          }
        }).toList();
      } catch (e) {
        Get.toNamed(Routes.ERROR, arguments: e.toString());
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

  void bannerHome() {
    List<BannerMainMenuModel> data = [
      BannerMainMenuModel(
        image:
            "https://images.unsplash.com/photo-1515276427842-f85802d514a2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=876&q=80",
        title: "banner1",
      ),
      BannerMainMenuModel(
        image:
            "https://images.unsplash.com/photo-1624806992928-9c7a04a8383d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
        title: "banner2",
      ),
    ];

    for (var i = 0; i < data.length; i++) {
      banner.add(data[i]);
    }
  }

  void mainMenu() {
    List<MainMenuModel> data = [
      MainMenuModel(
        image: "assets/icons/beras.png",
        // title: "Beras",
        color: Colors.red,
      ),
      MainMenuModel(
        image: "assets/icons/buah.png",
        // title: "Buah",
        color: Colors.yellow,
      ),
      MainMenuModel(
        image: "assets/icons/olahan-buah.png",
        // title: "Olahan Buah",
        color: Colors.green,
      ),
      MainMenuModel(
        image: "assets/icons/bibit-sayuran.png",
        // title: "Bibit Sayuran",
        color: Colors.purple,
      ),
      MainMenuModel(
        image: "assets/icons/sayuran.png",
        // title: "Sayuran",
        color: Colors.cyan,
      ),
      MainMenuModel(
        image: "assets/icons/roti.png",
        // title: "Roti",
        color: Colors.lightBlue,
      ),
      MainMenuModel(
        image: "assets/icons/jamu.png",
        // title: "Jamu Herbal",
        color: Colors.pinkAccent,
      ),
      MainMenuModel(
        image: "assets/icons/susu-kedelai.png",
        // title: "Susu Kedelai",
        color: Colors.pinkAccent,
      ),
    ];

    for (var i = 0; i < data.length; i++) {
      menu.add(data[i]);
    }
  }
}
