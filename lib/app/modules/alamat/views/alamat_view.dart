import 'package:customer_app/app/modules/alamat/views/item_alamat_view.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
        () => controller.address.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: controller.address.length,
                itemBuilder: (context, i) {
                  int length = controller.address.length;
                  final data = controller.address[i];
                  return ItemAlamatView(data);
                },
              ),
      ),
    );
  }
}
