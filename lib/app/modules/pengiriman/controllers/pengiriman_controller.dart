import 'dart:async';
import 'dart:convert';

import 'package:customer_app/app/data/models/courier_model.dart';
import 'package:customer_app/app/data/models/order_model.dart';
import 'package:customer_app/app/data/providers/cart_provider.dart';
import 'package:customer_app/app/modules/alamat/controllers/alamat_controller.dart';
import 'package:customer_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:customer_app/app/modules/login/controllers/auth_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PengirimanController extends GetxController {
  AlamatController alamatController = Get.find();
  var hiddenButton = true.obs;
  var hiddenForm = true.obs;
  CartController cartController = Get.find();
  var invoice = List<Order>.empty().obs;
  var markProductId = List<int>.empty().obs;
  var isLoadingWeb = true.obs;
  var isLoading = false.obs;
  var isAllChoice = false.obs;
  var kurir = "".obs;
  var totalBarang = 0.obs;
  var totalHarga = 0.obs;
  var ongkir = <Map<String, dynamic>>[
    {"harga": 0}
  ].obs;
  var isChoice = false.obs;
  final Completer<WebViewController> controllerWeb =
      Completer<WebViewController>();

  // List<int> productId = [];

  //
  // var kotaAsalId = 0.obs;
  // var kotaTujuanId = 0.obs;
  // var kurir = "".obs;
  // double berat = 0.0;

  final box = GetStorage();

  void dialogLoading() {
    Get.defaultDialog(
      barrierDismissible: false,
      title: " ",
      content: CircularProgressIndicator(),
    );
  }

  void dialogSuccess(String msg) {
    Get.defaultDialog(
      barrierDismissible: false,
      title: " ",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            msg,
            textAlign: TextAlign.center,
          ),
          TextButton(
              onPressed: () {
                Get.back();
                Get.toNamed(Routes.RIWAYAT_PEMESANAN);
              },
              child: Text("Ke Pesanan Saya"))
        ],
      ),
    );
  }

  @override
  void onInit() {
    addTotalHarga(0);
  }

  void ongkosKirim(int kotaAsalId, int kotaTujuanId, int berat) async {
    // jawa barat 9
    // indramayu 149

    try {
      isLoading(true);
      Uri url = Uri.parse("https://api.rajaongkir.com/starter/cost");
      try {
        final response = await http.post(
          url,
          body: {
            "origin": "$kotaAsalId",
            "destination": "$kotaTujuanId",
            "weight": "$berat",
            "courier": "$kurir",
          },
          headers: {
            "key": "b8c861f1ec74f5d14adfcda89caf5566",
            "content-type": "application/x-www-form-urlencoded",
          },
        );

        var data = json.decode(response.body) as Map<String, dynamic>;
        var results = data["rajaongkir"]["results"] as List<dynamic>;

        var listAllCourier = Courier.fromJsonList(results);
        var courier = listAllCourier[0];

        Get.defaultDialog(
          title: courier.name!,
          content: Column(
            children: courier.costs!
                .map(
                  (e) => GestureDetector(
                    onTap: () {
                      ongkir.value = [
                        {
                          "code": courier.code,
                          "name": courier.name,
                          "service": e.service,
                          "harga": e.cost![0].value,
                          "hari": courier.code == "pos"
                              ? e.cost![0].etd
                              : "${e.cost![0].etd} HARI"
                        }
                      ];
                      // print(ongkir);
                      totalHarga.value = 0;
                      isAllChoice.value = true;
                      addTotalHarga(0);
                      addTotalHarga(ongkir.first["harga"]);
                      isChoice.value = true;
                      Get.back();
                      Get.back();
                    },
                    child: Card(
                      child: ListTile(
                        title: Text("${e.service}"),
                        subtitle: Text("Rp ${e.cost![0].value}"),
                        trailing: Text(
                          courier.code == "pos"
                              ? "${e.cost![0].etd}"
                              : "${e.cost![0].etd} HARI",
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        );
      } catch (err) {
        print(err);
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: err.toString(),
        );
      }
    } finally {
      isLoading(false);
    }
  }

  void showButton() {
    if (kurir != "") {
      hiddenButton.value = false;
    } else {
      hiddenButton.value = true;
    }
  }

  void checkout() async {
    dialogLoading();
    await Future.delayed(const Duration(seconds: 6), () {
      Get.back();
      final data = box.read("userData") as Map<String, dynamic>;

      CartProvider()
          .postDataOrder(
              data["id"], totalHarga.value, markProductId, data["token"])
          .then((response) {
        final data = Order.fromJson(response["data"] as Map<String, dynamic>);
        invoice.add(data);
        CartController cartController = Get.put(CartController());
        cartController.cart.clear();
        cartController.getData();
        cartController.isAllMark.value = false;
        cartController.isMark.value = false;
        cartController.lengthMark.value = 0;
        cartController.total.value = 0;
        Get.back();
        dialogSuccess(
            "Pesanan Anda telah dibuat, Silahkan melanjutkan pembayaran!");
      });
    });
  }

  Order findByid(int id) {
    return invoice.firstWhere((element) => element.id == id);
  }

  void addTotalHarga(int harga) {
    totalHarga.value = cartController.total.value + harga;
  }
}
