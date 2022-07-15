import 'dart:convert';

import 'package:customer_app/app/data/models/courier_model.dart';
import 'package:customer_app/app/data/models/order_model.dart';
import 'package:customer_app/app/data/providers/cart_provider.dart';
import 'package:customer_app/app/modules/alamat/controllers/alamat_controller.dart';
import 'package:customer_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PengirimanController extends GetxController {
  AlamatController alamatController = Get.find();
  CartController cartController = Get.find();
  var invoice = List<Order>.empty().obs;
  var isLoadingWeb = true.obs;
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

  void ongkosKirim(
      int kotaAsalId, int kotaTujuanId, int berat, String kurir) async {
    // jawa barat 9
    // indramayu 149
    Uri url = Uri.parse("https://api.rajaongkir.com/starter/cost");
    try {
      final response = await http.post(
        url,
        body: {
          "origin": "$kotaAsalId",
          "destination": "$kotaTujuanId",
          "weight": "$berat",
          "courier": kurir,
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
                (e) => ListTile(
                  title: Text("${e.service}"),
                  subtitle: Text("Rp ${e.cost![0].value}"),
                  trailing: Text(
                    courier.code == "pos"
                        ? "${e.cost![0].etd}"
                        : "${e.cost![0].etd} HARI",
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
  }

  void checkout() async {
    dialogLoading();
    await Future.delayed(const Duration(seconds: 4), () {
      Get.back();
      final data = box.read("userData") as Map<String, dynamic>;
      CartProvider().postDataOrder(data["id"], data["token"]).then((response) {
        final data = Order.fromJson(response["data"] as Map<String, dynamic>);
        invoice.add(data);
        Get.toNamed(Routes.INVOICE, arguments: data.id);
      });
    });
  }

  Order findByid(int id) {
    return invoice.firstWhere((element) => element.id == id);
  }
}
