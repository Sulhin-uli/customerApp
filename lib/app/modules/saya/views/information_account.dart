import 'package:customer_app/app/modules/login/controllers/auth_controller.dart';
import 'package:customer_app/app/modules/saya/controllers/saya_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class InformationAccountView extends GetView<SayaController> {
  final authC = Get.find<AuthController>();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    final user = box.read("userData") as Map<String, dynamic>;
    final data = controller.customer.first;
    DateTime? datetime;
    if (data.birth != null) {
      datetime = DateTime.parse(data.birth.toString());
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Informasi Akun',
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
                  const Text(
                    "Jenis Kelamin",
                    style: TextStyle(color: Color(0xff919A92), fontSize: 12),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    data.gender != null ? data.gender : "-",
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Tanggal Lahir",
                    style: TextStyle(color: Color(0xff919A92), fontSize: 12),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    data.birth != null
                        ? DateFormat("EEEE, d MMMM yyyy", "id_ID")
                            .format(datetime!)
                        : "-",
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Telepon",
                    style: TextStyle(color: Color(0xff919A92), fontSize: 12),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    data.telp != null ? data.telp.toString() : "-",
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "*Untuk mmengubah data kunjungi TaniKula.com",
                    style: TextStyle(color: Color(0xff919A92), fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
