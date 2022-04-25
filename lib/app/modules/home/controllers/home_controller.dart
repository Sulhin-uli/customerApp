import 'package:customer_app/app/data/models/banner_main_menu_model.dart';
import 'package:customer_app/app/data/models/main_menu_model.dart';
import 'package:customer_app/app/data/models/product_model.dart';
import 'package:customer_app/app/data/providers/product_provider.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var product = List<ProductModel>.empty().obs;
  var menu = List<MainMenuModel>.empty().obs;
  var banner = List<BannerMainMenuModel>.empty().obs;
  var tabIndex = 0.obs;

  @override
  void onInit() {
    getData();
    mainMenu();
    bannerHome();
    super.onInit();
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  void getData() async {
    ProductProvider().getData().then((response) {
      try {
        response["data"].map((e) {
          final data = ProductModel(
            id: e["id"],
            name: e["name"],
            slug: e["slug"],
            categoryProductId: CategoryProductId(
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
            userId: UserId(
              id: e["category_product_id"]["id"],
              name: e["category_product_id"]["name"],
            ),
            isActive: e["isActive"],
          );
          product.add(data);
        }).toList();
      } catch (e) {
        Get.toNamed(Routes.ERROR, arguments: e.toString());
      }

      // print(product[0].categoryProductId!.id);
    });
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
        image:
            "https://cdn2.iconfinder.com/data/icons/maps-navigation-linear-black/614/3683_-_Marker_I-512.png",
        title: "Beras",
        color: Colors.red,
      ),
      MainMenuModel(
          image:
              "https://cdn2.iconfinder.com/data/icons/maps-navigation-linear-black/614/3683_-_Marker_I-512.png",
          title: "Buah",
          color: Colors.yellow),
      MainMenuModel(
        image:
            "https://cdn2.iconfinder.com/data/icons/maps-navigation-linear-black/614/3683_-_Marker_I-512.png",
        title: "Olahan Buah",
        color: Colors.green,
      ),
      MainMenuModel(
        image:
            "https://cdn2.iconfinder.com/data/icons/maps-navigation-linear-black/614/3683_-_Marker_I-512.png",
        title: "Bibit Sayuran",
        color: Colors.purple,
      ),
      MainMenuModel(
        image:
            "https://cdn2.iconfinder.com/data/icons/maps-navigation-linear-black/614/3683_-_Marker_I-512.png",
        title: "Sayuran",
        color: Colors.cyan,
      ),
      MainMenuModel(
        image:
            "https://cdn2.iconfinder.com/data/icons/maps-navigation-linear-black/614/3683_-_Marker_I-512.png",
        title: "Roti",
        color: Colors.lightBlue,
      ),
      MainMenuModel(
        image:
            "https://cdn2.iconfinder.com/data/icons/maps-navigation-linear-black/614/3683_-_Marker_I-512.png",
        title: "Jamu Herbal",
        color: Colors.pinkAccent,
      ),
      MainMenuModel(
        image:
            "https://cdn2.iconfinder.com/data/icons/maps-navigation-linear-black/614/3683_-_Marker_I-512.png",
        title: "Susu Kedelai",
        color: Colors.pinkAccent,
      ),
    ];

    for (var i = 0; i < data.length; i++) {
      menu.add(data[i]);
    }
  }
}
