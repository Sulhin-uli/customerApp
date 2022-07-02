import 'package:customer_app/app/modules/pengiriman/controllers/pengiriman_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PembayaranView extends GetView<PengirimanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        elevation: 0.5,
        title: Text(
          'Pembayaran',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      body: new WebView(
        initialUrl:
            // "https://app.sandbox.midtrans.com/snap/v3/redirection/ffac2bd2-e18e-471a-b90d-ba7dfae42933",
            Get.arguments,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
