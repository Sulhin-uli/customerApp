import 'package:customer_app/app/modules/pengiriman/controllers/pengiriman_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InvoiceView extends GetView<PengirimanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff16A085),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
              ),
              Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(16),
                child: Card(
                  child: ListTile(
                    title: Text(
                      "Pesanan Anda telah dibuat, Silahkan melanjutkan pembayaran!",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.offAll(Routes.HOME);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // background
                    ),
                    child: Text(
                      'Ke Home',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.offAll(Routes.RIWAYAT_PEMESANAN);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // / background
                    ),
                    child: Text(
                      'Ke Pesanan Saya',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
