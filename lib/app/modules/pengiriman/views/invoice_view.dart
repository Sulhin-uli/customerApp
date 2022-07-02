import 'package:customer_app/app/modules/pengiriman/controllers/pengiriman_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InvoiceView extends GetView<PengirimanController> {
  @override
  Widget build(BuildContext context) {
    // final data = controller.invoice.first;
    // print(data.code);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(16),
              child: Card(
                child: ListTile(
                  title: Text(
                    "Pesanan Anda telah dibuat, Silahkan melanjutkan pembayaran!",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                color: Color(0xff16A085),
              ),
            ),
            Divider(
              color: Colors.black.withOpacity(0.5),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text("Invoice"),
                  Obx(() => controller.invoice.isEmpty
                      ? CircularProgressIndicator()
                      : Text(controller.invoice.first.code!)),
                  // Text(data.code!),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 16, 16),
              child: Text(
                "Pesanan Anda",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                    child: Text(
                      "Alamat Tagihan",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
                  Obx(
                    () => controller.alamatController.address.isEmpty
                        ? CircularProgressIndicator()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.alamatController.address.first
                                        .recipientsName! +
                                    " " +
                                    "(" +
                                    controller
                                        .alamatController.address.first.telp! +
                                    ")",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 12),
                              ),
                              Text(
                                controller.alamatController.address.first
                                    .completeAddress!,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 12),
                              ),
                            ],
                          ),
                  ),
                  Container(
                    margin: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 80,
                              child: Text(
                                "Invoice ID",
                                style: TextStyle(
                                  color: Color(0xff919A92),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: 50,
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: Text(
                                "-",
                                // "INV/20220630/VI/XXX/00001",
                                style: const TextStyle(
                                  color: Color(0xff919A92),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Color(0xff919A92),
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 80,
                              child: Text(
                                "Tanggal Pemesanan",
                                style: TextStyle(
                                  color: Color(0xff919A92),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: 50,
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: Text(
                                "-",
                                style: const TextStyle(
                                  color: Color(0xff919A92),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Color(0xff919A92),
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 80,
                              child: Text(
                                "Status Pemesanan",
                                style: TextStyle(
                                  color: Color(0xff919A92),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: 50,
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: Text(
                                "-",
                                style: const TextStyle(
                                  color: Color(0xff919A92),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Color(0xff919A92),
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 80,
                              child: Text(
                                "Status Pembayaran",
                                style: TextStyle(
                                  color: Color(0xff919A92),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: 50,
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: Text(
                                "-",
                                style: const TextStyle(
                                  color: Color(0xff919A92),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Color(0xff919A92),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: Card(
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Pembayaran",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Obx(
                            () => controller.invoice.isEmpty
                                ? CircularProgressIndicator()
                                : Text(
                                    'RP' + // 'Rp${formatCurrency.format(
                                        //   'Rp${formatCurrency.format(data.totalPrice)}',
                                        // )}',
                                        // 'Rp${formatCurrency.format(data.totalPrice)}',
                                        controller.invoice.first.totalPrice!
                                            .toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          controller.invoice.isEmpty
                              ? print("empty url")
                              : Get.toNamed(Routes.PEMBAYARAN,
                                  arguments:
                                      controller.invoice.first.paymentUrl);
                        },
                        style: ElevatedButton.styleFrom(
                          // primary: Color(0xff16A085), // background
                          primary: Colors.white, // background
                        ),
                        // child: Text('Pilih Pembayaran'),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                'Lanjutkan',
                                style: TextStyle(color: Color(0xff16A085)),
                              ),
                              Text(
                                'Pembayaran',
                                style: TextStyle(color: Color(0xff16A085)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                color: Color(0xff16A085),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
