import 'package:customer_app/app/modules/pengiriman/controllers/pengiriman_controller.dart';
import 'package:customer_app/app/modules/riwayat_pemesanan/controllers/riwayat_pemesanan_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RincianPembatalanView extends GetView<RiwayatPemesananController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: BackButton(color: Colors.black),
          elevation: 0.5,
          title: Text(
            'Rincian Pembatalan',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        backgroundColor: Colors.white,
        body: Card(
          elevation: 3,
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rincian Pembatalan",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Dibatalkan Oleh",
                  style: TextStyle(color: Color(0xff919A92), fontSize: 12),
                ),
                const SizedBox(height: 5),
                Text(
                  Get.arguments[0],
                  style: TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Dibatalkan Pada",
                  style: TextStyle(color: Color(0xff919A92), fontSize: 12),
                ),
                const SizedBox(height: 5),
                Text(
                  DateFormat("EEEE, d MMMM yyyy", "id_ID").format(
                      DateTime.fromMillisecondsSinceEpoch(
                          Get.arguments[1] * 1000)),
                  style: TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Alasan Pembatalan",
                  style: TextStyle(color: Color(0xff919A92), fontSize: 12),
                ),
                const SizedBox(height: 5),
                Text(
                  Get.arguments[2],
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
        ));
  }
}
