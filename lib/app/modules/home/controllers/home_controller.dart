import 'package:customer_app/app/data/models/banner_main_menu_model.dart';
import 'package:customer_app/app/data/models/hero_model.dart';
import 'package:customer_app/app/data/models/main_menu_model.dart';
import 'package:customer_app/app/data/models/photo_product_model.dart';
import 'package:customer_app/app/data/models/product_model.dart';
import 'package:customer_app/app/data/providers/hero_provider.dart';
import 'package:customer_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:customer_app/app/modules/notifikasi/controllers/notifikasi_controller.dart';
import 'package:customer_app/app/modules/produk/controllers/produk_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final box = GetStorage();
  var product = List<ProductModel>.empty().obs;
  var menu = List<MainMenuModel>.empty().obs;
  var banner = List<BannerMainMenuModel>.empty().obs;
  var hero = List<HeroModel>.empty().obs;
  var carouselIndex = 0.obs;
  // var product = List<ProductModel>.empty().obs;
  var photoProduct = List<PhotoProduct>.empty().obs;
  var photoProductByProductId = List<PhotoProduct>.empty().obs;
  var tabIndex = 0.obs;
  var countCart = 0.obs;
  ProdukController produkController = Get.put(ProdukController());
  CartController cartController = Get.put(CartController());
  NotifikasiController notifikasiController = Get.put(NotifikasiController());

  @override
  void onInit() {
    if (box.read('isAuth') == true) {
      cartController.cart.clear();
      cartController.getData();
    }
    mainMenu();
    // bannerHome();
    getDataHero();
    super.onInit();
  }

  void changeTabIndex(int index) {
    if (index == 0) {
      tabIndex.value = index;
    } else if (box.read('isAuth') == true && index == 1) {
      tabIndex.value = index;
    } else if (box.read('isAuth') == true && index == 2) {
      tabIndex.value = index;
    } else {
      Get.toNamed(Routes.LOGIN);
    }
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

  void getDataHero() async {
    try {
      HeroProvider().getData().then(
        (response) {
          // print(response);
          response["data"].map((e) {
            final data = HeroModel.fromJson(e as Map<String, dynamic>);
            hero.add(data);
          }).toList();
        },
      );
    } catch (e) {
      dialogError("hero error :  $e");
    }
  }
}
