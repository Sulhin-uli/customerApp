import 'dart:convert';

import 'package:customer_app/app/data/models/detail_transaksi_model.dart';
import 'package:customer_app/app/data/models/transaction_list.dart';
import 'package:customer_app/app/data/providers/transaction_list_provider.dart';
import 'package:customer_app/app/modules/produk/controllers/produk_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RiwayatPemesananController extends GetxController
    with SingleGetTickerProviderMixin {
  var isLoading = true.obs;
  final box = GetStorage();
  var riwayatPemesanan = List<TransactionList>.empty().obs;
  var detailRiwayatPemesanan = List<DetailTransaksi>.empty().obs;
  ProdukController produkController = Get.put(ProdukController());

// infinity
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  var page = 1.obs;

  void onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    isLoading(true);
    riwayatPemesanan.clear();
    page.value = 1;
    getData();
    refreshController.refreshCompleted();
  }

  void onLoading() async {}

  void addItems() {
    getData();
  }

  void getData() async {
    final data = box.read("userData") as Map<String, dynamic>;
    var userId = data["id"];
    try {
      isLoading(true);
      TransactionProvider()
          .getData(userId, page.value, data['token'])
          .then((response) {
        // print(response);
        if (response["data"].length != 0) {
          response["data"].map((e) {
            for (var e in response["data"]) {
              final data = TransactionList.fromJson(e as Map<String, dynamic>);
              riwayatPemesanan.add(data);
            }
          }).toList();
          page.value = page.value + 1;
        } else {}
      });
    } finally {
      isLoading(false);
    }
  }

  void getDataDetail(int id) async {
    final data = box.read("userData") as Map<String, dynamic>;
    var userId = data["id"];
    try {
      isLoading(true);
      TransactionProvider()
          .getDataDetail(id, userId, data['token'])
          .then((response) {
        // print(response);
        detailRiwayatPemesanan.clear();
        final data =
            DetailTransaksi.fromJson(response["data"] as Map<String, dynamic>);
        detailRiwayatPemesanan.add(data);
        Get.toNamed(Routes.DETAIL_TRANSAKSI, arguments: data.id);
      });
    } finally {
      isLoading(false);
    }
  }

  DetailTransaksi findByid(int id) {
    return detailRiwayatPemesanan.firstWhere((element) => element.id == id);
  }

  final List<Tab> myTabs = const <Tab>[
    Tab(
      text: 'Semua',
    ),
    Tab(text: 'Dikemas'),
    Tab(text: 'Dikirim'),
    Tab(text: 'Selesai'),
    Tab(text: 'Dibatalkan'),
  ];

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    riwayatPemesanan.clear();
    getData();

    controller = TabController(vsync: this, length: myTabs.length);
    controllerCountdownTimer =
        CountdownTimerController(endTime: endTime, onEnd: onEnd);
  }

  @override
  void onClose() {
    controller.dispose();

    super.onClose();
  }

  late CountdownTimerController controllerCountdownTimer;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 40;
  void onEnd() {
    print('onEnd');
  }
}
