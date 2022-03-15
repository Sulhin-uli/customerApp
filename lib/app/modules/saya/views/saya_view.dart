import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/saya_controller.dart';

class SayaView extends GetView<SayaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Akun Saya',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(
                  Icons.account_circle_rounded,
                  size: 60,
                  color: Colors.blue,
                ),
                title: const Text(
                  "Name Account",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                child: Column(
                  children: [
                    Divider(
                      color: Color(0xff919A92),
                    ),
                    ListTile(
                      leading: Icon(Icons.home),
                      title: const Text('Kembali Ke Home'),
                    ),
                    Divider(
                      color: Color(0xff919A92),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 16,
                ),
                child: Text(
                  "Aktivitas Saya",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(Icons.insert_chart_rounded),
                title: const Text('Daftar Transaksi'),
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: const Text('Favorit'),
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: const Text('Keranjang'),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 16,
                ),
                child: Text(
                  "Pengaturan Akun",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: () => Get.toNamed(Routes.ALAMAT),
                child: ListTile(
                  leading: Icon(Icons.location_on),
                  title: const Text('Daftar Alamat'),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: const Text('Ubah Akun'),
              ),
              ListTile(
                leading: Icon(Icons.vpn_key),
                title: const Text('Ubah Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
