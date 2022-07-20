import 'package:customer_app/app/modules/cart/views/widgets/item_cart_widget.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    controller.isAllMark.value = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: Text(
          'Keranjang',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: [
          TextButton(
              onPressed: () => Get.toNamed(Routes.RIWAYAT_PEMESANAN),
              child: Text(
                "Pesanan Saya",
                style: TextStyle(color: Color(0xff16A085), fontSize: 16),
              ))
        ],
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 18, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => controller.cart.isEmpty
                        ? Container()
                        : Row(
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 25,
                              ),
                              SvgPicture.asset(
                                "assets/icons/empty-data.svg",
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
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.white,
        child: Column(
          children: [
            Divider(
              color: Color(0xff919A92),
            ),
            Obx(
              () => Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 200,
                      height: 45,
                      child: Column(
                        children: [
                          Text(
                            "Total Harga ",
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            'Rp${formatCurrency.format(controller.total())}',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                  Obx(() => controller.isMark.isFalse
                      ? ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey, // background
                          ),
                          child: Text(
                            '     Beli (0)     ',
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            Get.toNamed(Routes.PENGIRIMAN);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff16A085), // background
                          ),
                          child: Text(
                            '     Beli (' +
                                controller.lengthMark.value.toString() +
                                ')     ',
                          ),
                        )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
