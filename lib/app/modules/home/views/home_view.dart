import 'package:customer_app/app/modules/home/views/widgets/banner_slider.dart';
import 'package:customer_app/app/modules/home/views/widgets/header.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // Part Carousell
    int _currentIndex = 0;
    List<String> imgCarousellList = [
      // "assets/images/banner_1.jpg",
      "assets/images/banner_2.jpg",
      // "assets/images/banner_3.jpg",
      "assets/images/banner_4.jpg",
      // "assets/images/banner_5.jpg",
      // "assets/images/banner_6.jpg",
      // "assets/images/banner_7.jpg",
    ];

    // Part Scrroll
    final _scrollController = TrackingScrollController();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 150.0,
            decoration: new BoxDecoration(
              color: Color(0xff16A085),
              borderRadius: new BorderRadius.vertical(
                bottom: new Radius.elliptical(
                    MediaQuery.of(context).size.width, 100.0),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: SafeArea(
              child: Row(
                children: [
                  _buildInputSearch(),
                  _buildIconButton(
                    onPressed: () => Get.toNamed(Routes.LOGIN),
                    icon: Icons.mail,
                    notification: 9,
                  ),
                  _buildIconButton(
                    onPressed: () {},
                    icon: Icons.shopping_cart,
                    notification: 20,
                  ),
                  _buildIconButton(
                    onPressed: () {},
                    icon: Icons.notifications,
                    notification: 3,
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                ),
                Container(
                  child: Text("data"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // fuction widget
  // Input
  _buildInputSearch() {
    final sizeIcon = BoxConstraints(minWidth: 35, minHeight: 35);
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent,
        width: 0,
      ),
      borderRadius: const BorderRadius.all(
        const Radius.circular(4.0),
      ),
    );
    return Expanded(
      child: TextField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(4),
            isDense: true,
            enabledBorder: border,
            focusedBorder: border,
            hintText: "Cari di TaniKula",
            hintStyle: TextStyle(fontSize: 14, color: Color(0xff919A92)),
            prefixIcon: Icon(
              Icons.search,
              color: Color(0xff919A92),
            ),
            prefixIconConstraints: sizeIcon,
            suffixIconConstraints: sizeIcon,
            filled: true,
            fillColor: Colors.white),
      ),
    );
  }

  // Icon
  _buildIconButton({
    VoidCallback? onPressed,
    IconData? icon,
    int notification = 0,
  }) =>
      Stack(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(icon),
            color: Colors.white,
            iconSize: 24,
          ),
          notification == 0
              ? SizedBox()
              : Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Color(0xff16A085),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white),
                    ),
                    constraints: BoxConstraints(minWidth: 22, minHeight: 22),
                    child: Text(
                      "$notification",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
        ],
      );
}
