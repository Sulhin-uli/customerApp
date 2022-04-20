import 'package:customer_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:customer_app/app/modules/home/views/widgets/header_widget.dart';
import 'package:customer_app/app/modules/home/views/widgets/menu_widget.dart';
import 'package:customer_app/app/modules/home/views/widgets/product_widget.dart';
import 'package:customer_app/app/modules/home/views/widgets/rounded_widget.dart';
import 'package:customer_app/app/modules/home/views/widgets/time_widget.dart';
import 'package:customer_app/app/modules/produk/views/produk_view.dart';
import 'package:customer_app/app/modules/saya/views/saya_view.dart';
import 'package:customer_app/app/modules/wishlist/views/wishlist_view.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  // final _scrollController = TrackingScrollController();

  @override
  Widget build(BuildContext context) {
    // print(controller.getData());
    // Part Scrroll
    final _scrollController = TrackingScrollController();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        bottomNavigationBar: buildBottomNavigationMenu(context, controller),
        backgroundColor: Colors.white,
        body: Obx(
          () => IndexedStack(
            index: controller.tabIndex.value,
            children: [
              Stack(
                children: [
                  Rounded(),
                  SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            "Selamat Datang, Sulhin ",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        BannerSlider(),
                        const SizedBox(
                          height: 35,
                        ),
                        Menu(),
                        Container(
                          margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Produk Terbaru",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextButton(
                                  onPressed: () => Get.toNamed(Routes.PRODUK),
                                  child: Text(
                                    "Lihat Semua",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff16A085),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Product()
                      ],
                    ),
                  ),
                  Header(_scrollController,
                      Get.find<CartController>().cart.length),
                ],
              ),
              ProdukView(),
              WishlistView(),
              SayaView()
            ],
          ),
        ),
      ),
    );
  }

  // Tabbar Bottom
  final TextStyle unselectedLabelStyle = TextStyle(
    color: Colors.white.withOpacity(0.5),
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
  final TextStyle selectedLabelStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(
      () => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 54,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
            unselectedItemColor: Colors.grey,
            selectedItemColor: Color(0xff16A085),
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.home,
                    size: 20.0,
                  ),
                ),
                label: 'Home',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.search,
                    size: 20.0,
                  ),
                ),
                label: 'Cari',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.favorite,
                    size: 20.0,
                  ),
                ),
                label: 'Wishlist',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.person,
                    size: 20.0,
                  ),
                ),
                label: 'Saya',
                backgroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
