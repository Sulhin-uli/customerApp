import 'package:customer_app/app/modules/pengiriman/controllers/pengiriman_controller.dart';
import 'package:customer_app/app/modules/riwayat_pemesanan/controllers/riwayat_pemesanan_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PembatalanView extends GetView<RiwayatPemesananController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        elevation: 0.5,
        title: Text(
          'Pembatalan',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                'Pilih Alasan Pembatalan',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Card(
                child: ListTile(
                  title: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          "Silahkan pilih alasan pembatalan. Pesananmu akan langsung dibatalkan setelah alasan pembatalan diajukan.",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                color: Colors.red,
              ),
            ),
            Obx(
              () => Column(
                children: <Widget>[
                  ListTile(
                    title: const Text('Ingin mengubah alamat pengiriman'),
                    leading: Radio(
                      value: 1,
                      groupValue: controller.selectRadio.value,
                      onChanged: (e) {
                        controller.selectRadio.value = 1;
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Ingin membuat pesanan baru'),
                    leading: Radio(
                      value: 2,
                      groupValue: controller.selectRadio.value,
                      onChanged: (e) {
                        controller.selectRadio.value = 2;
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Lainnya/berubah pikiran'),
                    leading: Radio(
                      value: 3,
                      groupValue: controller.selectRadio.value,
                      onChanged: (e) {
                        controller.selectRadio.value = 3;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  controller.orderCancel(
                      Get.arguments, controller.selectRadio.value);
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff16A085), // / background
                ),
                child: Text(
                  'Konfirmasi',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
