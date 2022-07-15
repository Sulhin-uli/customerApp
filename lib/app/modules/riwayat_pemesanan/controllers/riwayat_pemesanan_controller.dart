import 'dart:convert';

import 'package:customer_app/app/data/models/transaction_list.dart';
import 'package:customer_app/app/data/providers/transaction_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RiwayatPemesananController extends GetxController
    with SingleGetTickerProviderMixin {
  var isLoading = true.obs;
  final box = GetStorage();
  var riwayatPemesanan = List<TransactionList>.empty().obs;

  void getData() async {
    final data = box.read("userData") as Map<String, dynamic>;
    var userId = data["id"];
    try {
      isLoading(true);
      TransactionProvider().getData(userId, data['token']).then((response) {
        for (var e in response["data"]) {
          final data = TransactionList.fromJson(e as Map<String, dynamic>);
          riwayatPemesanan.add(data);
        }
      });
    } finally {
      isLoading(false);
    }
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
    getData();

    controller = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    controller.dispose();

    super.onClose();
  }
}
