import 'dart:convert';

import 'package:customer_app/app/data/models/detail_transaksi_model.dart';
import 'package:customer_app/app/data/models/transaction_list.dart';
import 'package:customer_app/app/data/providers/review_provider.dart';
import 'package:customer_app/app/data/providers/transaction_list_provider.dart';
import 'package:customer_app/app/modules/produk/controllers/produk_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/app/utils/constant.dart';
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

  void upRefresh() async {
    // monitor network fetch
    riwayatPemesanan.clear();
    page.value = 1;
    getData();
  }

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
            final data = TransactionList.fromJson(e as Map<String, dynamic>);
            riwayatPemesanan.add(data);
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

  void multipleUlas(int id) async {
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
        lengthProdukOrder.value =
            detailRiwayatPemesanan.first.orderItems!.length;
        Get.toNamed(Routes.MULTIPLE_ULASAN, arguments: data.id);
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
      text: 'Belum Bayar',
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
  }

  @override
  void onClose() {
    controller.dispose();

    super.onClose();
  }

  var isExpired = false.obs;
  runCountDown(int endTime) {
    controllerCountdownTimer =
        CountdownTimerController(endTime: endTime, onEnd: onEnd);
  }

  late CountdownTimerController controllerCountdownTimer;
  // int endTime = DateTime.parse('2022-08-18 02:15:31').millisecondsSinceEpoch;
  void onEnd() {
    isExpired(true);
  }

  void dialogQuestion(BuildContext context, int id) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Info"),
        content: Text("Pesanan Diterima?"),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Batal'),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Ya');
              orderCompleted(id);
            },
            child: const Text('Ya'),
          ),
        ],
      ),
    );
  }

  void orderCompleted(int id) {
    final data = box.read("userData") as Map<String, dynamic>;
    var userId = data["id"];
    try {
      isLoading(true);
      TransactionProvider().orderCompleted(id, data['token']).then((response) {
        print("Berhasil");
        upRefresh();
        Get.back();
        dialogSuccess("Pesanan Diterima");
      });
    } finally {
      isLoading(false);
    }
  }

  void dialogQuestionCancelOrder(BuildContext context, int id) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Info"),
        content: Text("Batalkan Pesanan?"),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Batal'),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Ya');
              orderCompleted(id);
            },
            child: const Text('Ya'),
          ),
        ],
      ),
    );
  }

  // Pembatalan
  var selectRadio = 1.obs;
  var cancellationNote = "".obs;
  void orderCancel(int id, int select) {
    switch (select) {
      case 1:
        {
          cancellationNote.value = "Ingin mengubah alamat pengiriman";
        }
        break;

      case 2:
        {
          cancellationNote.value = "Ingin membuat pesanan baru";
        }
        break;
      default:
        {
          cancellationNote.value = "Lainnya/berubah pikiran";
        }
        break;
    }

    final data = box.read("userData") as Map<String, dynamic>;
    var userId = data["id"];
    try {
      isLoading(true);
      TransactionProvider()
          .cancelOrder(id, userId, cancellationNote.value, data['token'])
          .then((response) {
        Get.back();
        Get.back();
        upRefresh();
        dialogSuccess("Pesanan Berhasil Dibatalkan");
      });
    } finally {
      isLoading(false);
    }
  }

  // multiple ulas
  var productIdUlas = List<int>.empty().obs; // v
  var orderIdUlas = List<int>.empty().obs; // v
  var starRatedUlas = List<int>.empty().obs; //
  var reviewUlas = List<String>.empty().obs; //
  late List<TextEditingController> ulasanController;
  var lengthProdukOrder = 0.obs;

  void runTextEditingController() {
    ulasanController = List.generate(
        lengthProdukOrder.value, (index) => TextEditingController());
  }

  // controller.markProductId.add(data.id!);

  void multipleUlasPost() {
    final data = box.read("userData") as Map<String, dynamic>;
    var userId = data["id"];
    reviewUlas.clear();
    for (var item in ulasanController) {
      reviewUlas.add(item.text);
    }
    // print("jumlah produk " + productIdUlas.length.toString());
    // print("jmlh ulas " + orderIdUlas.length.toString());
    // print("jmlh bintang " + starRatedUlas.length.toString());
    // print("jmlh review " + reviewUlas.length.toString());

    ReviewProvider()
        .postDataMultipleReview(userId, productIdUlas, orderIdUlas,
            starRatedUlas, reviewUlas, data['token'])
        .then((response) {
      print(response);
      Get.back();
      upRefresh();
      dialogSuccess("Produk Berhasil Diulas");
    });
  }
}
