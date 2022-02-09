import 'package:customer_app/app/modules/home/views/widgets/banner_slider.dart';
import 'package:customer_app/app/modules/home/views/widgets/header.dart';
import 'package:customer_app/app/modules/home/views/widgets/main_menu.dart';
import 'package:customer_app/app/modules/home/views/widgets/product_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final _scrollController = TrackingScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  BannerSilder(),
                  // Expanded(child: MainMenu()),
                  MainMenu(),
                  // Container(
                  //   margin: EdgeInsets.only(top: 50),
                  //   color: Color(0xff16A085),
                  //   child: Text("xxxx"),
                  //   height: 1500,
                  //   width: double.infinity,
                  // ),
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
        ));
  }
}
