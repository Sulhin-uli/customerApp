import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RiwayatPemesananController extends GetxController
    with SingleGetTickerProviderMixin {
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

    controller = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    controller.dispose();

    super.onClose();
  }
}
