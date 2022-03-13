import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_produk_controller.dart';

class DetailProdukView extends GetView<DetailProdukController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailProdukView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailProdukView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
