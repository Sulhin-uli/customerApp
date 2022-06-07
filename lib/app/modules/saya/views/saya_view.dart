import 'dart:io';

import 'package:customer_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:customer_app/app/modules/home/controllers/home_controller.dart';
import 'package:customer_app/app/modules/login/controllers/auth_controller.dart';
import 'package:customer_app/app/modules/login/controllers/login_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/app/utils/base_url.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/saya_controller.dart';

class SayaView extends GetView<SayaController> {
  final box = GetStorage();
  final homeC = Get.put(HomeController());
  final cartC = Get.put(CartController());
  final authC = Get.put(AuthController());
  final sayaC = Get.put(SayaController());

  @override
  Widget build(BuildContext context) {
    final user = box.read("userData") as Map<String, dynamic>;
    authC.getDataCustomer();
    final data = authC.findCustomer(user["id"]);
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
              Row(
                children: [
                  Stack(
                    children: <Widget>[
                      Obx(
                        () => Container(
                          margin: EdgeInsets.all(15),
                          width: 70,
                          height: 70,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(200),
                            child: sayaC.selectedImagePath.value.isImageFileName
                                ? Image.file(
                                    File(sayaC.selectedImagePath.value),
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  )
                                : data.image == null
                                    ? Image.asset(
                                        'assets/logo/noimage.png',
                                        height: 150,
                                        width: 150,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(
                                        baseUrlFile +
                                            "storage/profile/" +
                                            data.image!,
                                        height: 150,
                                        width: 150,
                                        fit: BoxFit.cover,
                                      ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 1,
                        right: 1,
                        child: InkWell(
                          onTap: () => sayaC.getImage(),
                          child: Container(
                            height: 30,
                            width: 30,
                            child: Icon(
                              Icons.add_a_photo,
                              color: Colors.white,
                              size: 10,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      data.userId!.name!,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
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
                      onTap: () {
                        homeC.changeTabIndex(0);
                      },
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
                title: const Text('Wishlist'),
                onTap: () {
                  homeC.changeTabIndex(2);
                },
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: const Text('Keranjang'),
                onTap: () {
                  Get.toNamed(Routes.CART);
                },
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
                onTap: () => Get.toNamed(Routes.EDIT_PROFILE),
              ),
              ListTile(
                leading: Icon(Icons.vpn_key),
                title: const Text('Ubah Password'),
                onTap: () => Get.toNamed(Routes.EDIT_PASSWORD),
              ),
              GestureDetector(
                onTap: () {
                  sayaC.dialogQuestion(context);
                },
                child: ListTile(
                  leading: Icon(Icons.vpn_key),
                  title: const Text('Logout'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
