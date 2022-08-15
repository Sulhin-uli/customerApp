import 'package:customer_app/app/modules/alamat/views/item_alamat_view.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/alamat_controller.dart';

class AlamatView extends GetView<AlamatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: Text(
          'Daftar Alamat',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: [
          TextButton(
              onPressed: () => Get.toNamed(Routes.ADD_ALAMAT),
              child: Text(
                "Tambah Alamat",
                style: TextStyle(color: Color(0xff16A085), fontSize: 16),
              ))
        ],
        elevation: 0.5,
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? Center(
                child: CircularProgressIndicator(),
              )
            : controller.address.isEmpty
                ? Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        SvgPicture.asset(
                          "assets/icons/empty-data.svg",
                          height: 100,
                          width: 100,
                        ),
                        Text(
                          "Alamat Tidak Ada",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  )
                : NotificationListener<ScrollEndNotification>(
                    onNotification: (scrollEnd) {
                      final metrics = scrollEnd.metrics;
                      if (metrics.atEdge) {
                        bool isTop = metrics.pixels == 0;
                        if (isTop) {
                          // print('At the top');
                        } else {
                          // print('At the bottom');
                          controller.addItems();
                        }
                      }
                      return true;
                    },
                    child: SmartRefresher(
                      controller: controller.refreshController,
                      onRefresh: controller.onRefresh,
                      header: WaterDropMaterialHeader(),
                      enablePullDown: true,
                      enablePullUp: false,
                      child: ListView.builder(
                        itemCount: controller.address.length,
                        itemBuilder: (context, i) {
                          int length = controller.address.length;
                          final data = controller.address[i];
                          return ItemAlamatView(data);
                        },
                      ),
                    ),
                  ),
      ),
    );
  }
}
