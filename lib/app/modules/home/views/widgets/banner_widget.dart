import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:customer_app/app/modules/home/controllers/home_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerSlider extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 160,
          ),
          child: Obx(
            () => controller.banner.isEmpty
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.banner.length,
                    itemBuilder: (context, index) {
                      final data = controller.banner[index];
                      return GestureDetector(
                        onTap: () => Get.toNamed(Routes.DETAIL_PRODUK),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(15, 16, 5, 5),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  width: 300,
                                  height: 170,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        // "https://images.unsplash.com/photo-1515276427842-f85802d514a2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=876&q=80",
                                        data.image!,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                ),
                                flex: 75,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        )
      ],
    );
  }
}
