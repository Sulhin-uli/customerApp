import 'package:customer_app/app/modules/home/views/widgets_old/banner_slider.dart';
import 'package:customer_app/app/modules/home/views/widgets_old/header.dart';
import 'package:customer_app/app/modules/home/views/widgets_old/main_menu.dart';
import 'package:customer_app/app/modules/home/views/widgets_old/product_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final _scrollController = TrackingScrollController();
  final TextStyle unselectedLabelStyle = TextStyle(
    color: Colors.white.withOpacity(0.5),
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
  final TextStyle selectedLabelStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
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
                label: 'Home',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.location_history,
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
                    Icons.settings,
                    size: 20.0,
                  ),
                ),
                label: 'Home',
                backgroundColor: Colors.white,
              ),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: buildBottomNavigationMenu(context, controller),
      // body: Stack(
      //   children: [
      //     SingleChildScrollView(
      //       controller: _scrollController,
      //       child: Column(
      //         children: [
      //           BannerSilder(),
      //           MainMenu(),
      //           Container(
      //             margin: EdgeInsets.only(bottom: 20),
      //             height: 10,
      //             color: Colors.grey[100],
      //           ),
      //           ProductSlider(),
      //         ],
      //       ),
      //     ),
      //     Header(_scrollController),
      //   ],
      // ));
      body: Obx(
        () => IndexedStack(
          index: controller.tabIndex.value,
          children: [
            Stack(
              children: [
                SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      BannerSilder(),
                      MainMenu(),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        height: 10,
                        color: Colors.grey[100],
                      ),
                      ProductSlider(),
                    ],
                  ),
                ),
                Header(_scrollController),
              ],
            ),
            // PlacesPage(),
            // SettingsPage(),
          ],
        ),
      ),
    );
  }
}
