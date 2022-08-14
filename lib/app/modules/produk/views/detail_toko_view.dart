import 'package:customer_app/app/modules/login/controllers/auth_controller.dart';
import 'package:customer_app/app/modules/produk/controllers/produk_controller.dart';
import 'package:customer_app/app/modules/saya/controllers/saya_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class DetailTokoView extends GetView<ProdukController> {
  @override
  Widget build(BuildContext context) {
    final data = controller.toko.first;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Detail Toko',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Card(
            elevation: 3,
            child: Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const Text(
                  //   "Nama Gabungan Kelompok Tani",
                  //   style: TextStyle(color: Color(0xff919A92), fontSize: 12),
                  // ),
                  // const SizedBox(height: 5),
                  // Text(
                  //   Get.arguments,
                  //   style: TextStyle(fontSize: 15),
                  // ),
                  // const SizedBox(height: 30),
                  const Text(
                    "Ketua",
                    style: TextStyle(color: Color(0xff919A92), fontSize: 12),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    data.chairman!,
                    style: TextStyle(fontSize: 15),
                  ),
                  // const SizedBox(height: 30),
                  // const Text(
                  //   "Kabupaten/Kota",
                  //   style: TextStyle(color: Color(0xff919A92), fontSize: 12),
                  // ),
                  // const SizedBox(height: 5),
                  // Text(
                  //   data.city!,
                  //   style: TextStyle(fontSize: 15),
                  // ),
                  // const SizedBox(height: 30),
                  // const Text(
                  //   "Alamat",
                  //   style: TextStyle(color: Color(0xff919A92), fontSize: 12),
                  // ),
                  // const SizedBox(height: 5),
                  // Text(
                  //   data.address!,
                  //   style: TextStyle(fontSize: 15),
                  // ),
                  // const SizedBox(height: 30),
                  // const Text(
                  //   "Telepon",
                  //   style: TextStyle(color: Color(0xff919A92), fontSize: 12),
                  // ),
                  // const SizedBox(height: 5),
                  // Text(
                  //   data.telp!.toString(),
                  //   style: TextStyle(fontSize: 15),
                  // ),
                  // const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
