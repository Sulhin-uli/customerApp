import 'package:customer_app/app/modules/cart/views/widgets/item_cart_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: Text(
          'Keranjang',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 18, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(() => Checkbox(
                          value: controller.isAllMark.value,
                          onChanged: (e) {
                            controller.isAllMark.value = e!;
                            controller.allMark();
                          })),
                      Text("Pilih semua")
                    ],
                  ),
                  Obx(
                    () => controller.isMark.isTrue
                        ? TextButton(
                            onPressed: () {
                              controller.deleteMultiple();
                            },
                            child: Text(
                              "Hapus",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff16A085),
                              ),
                            ),
                          )
                        : Container(),
                  ),
                ],
              ),
            ),
            Obx(
              () => controller.isLoading.isTrue
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : controller.cart.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/icons/empty-data.png",
                                height: 100,
                                width: 100,
                              ),
                              Text(
                                "Data Tidak Ada",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.cart.length,
                          itemBuilder: (context, i) {
                            int length = controller.cart.length;
                            final data = controller.cart[i];
                            return ItemCart(data);
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
