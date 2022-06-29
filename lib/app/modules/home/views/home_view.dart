import 'package:customer_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:customer_app/app/modules/home/views/widgets/header_widget.dart';
import 'package:customer_app/app/modules/home/views/widgets/menu_widget.dart';
import 'package:customer_app/app/modules/home/views/widgets/product_widget.dart';
import 'package:customer_app/app/modules/home/views/widgets/rounded_widget.dart';
import 'package:customer_app/app/modules/home/views/widgets/banner_widget.dart';
import 'package:customer_app/app/modules/login/controllers/auth_controller.dart';
import 'package:customer_app/app/modules/produk/controllers/produk_controller.dart';
import 'package:customer_app/app/modules/produk/views/produk_view.dart';
import 'package:customer_app/app/modules/saya/views/saya_view.dart';
import 'package:customer_app/app/modules/wishlist/views/wishlist_view.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final box = GetStorage();
  final authC = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    var data = {};
    try {
      data = box.read("userData") as Map<String, dynamic>;
    } catch (e) {}
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
                  SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Rounded(),
                            // const SizedBox(
                            //   height: 100,
                            // ),
                            Positioned(
                              top: 100,
                              child: Container(
                                padding: EdgeInsets.only(left: 15),
                                child: (data["name"] != null)
                                    ? Text(
                                        "Selamat Datang, " + data["name"],
                                        style: TextStyle(color: Colors.white),
                                      )
                                    : Text(
                                        "Selamat Datang",
                                        style: TextStyle(color: Colors.white),
                                      ),
                              ),
                            ),
                          ],
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
                                onPressed: () => Get.toNamed(Routes.SEARCH),
                                child: Text(
                                  "Cari Kebutuhanmu",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff16A085),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Product()
                      ],
                    ),
                  ),
                  Header(
                    _scrollController,
                    Get.find<CartController>().cart.length,
                    // authC.isAuth.value,
                    box.read('isAuth'),
                  )
                ],
              ),
              // ProdukView(),
              (box.read('isAuth') == true) ? WishlistView() : Container(),
              (box.read('isAuth') == true) ? SayaView() : Container(),
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
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Color(0xff16A085),
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    bottom: 7,
                  ),
                  child: Image.asset(
                    "assets/icons/home.png",
                    width: 20,
                    height: 20,
                  ),
                ),
                label: 'Home',
                backgroundColor: Colors.white,
              ),
              // BottomNavigationBarItem(
              //   icon: Container(
              //     margin: EdgeInsets.only(bottom: 7),
              //     child: Image.asset(
              //       "assets/icons/cari.png",
              //       width: 20,
              //       height: 20,
              //     ),
              //   ),
              //   label: 'Cari',
              //   backgroundColor: Colors.white,
              // ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Image.asset(
                    "assets/icons/wishlist.png",
                    width: 20,
                    height: 20,
                  ),
                ),
                label: 'Wishlist',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Image.asset(
                    "assets/icons/saya.png",
                    width: 20,
                    height: 20,
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
