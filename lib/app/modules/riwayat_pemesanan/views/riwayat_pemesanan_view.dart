import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/riwayat_pemesanan_controller.dart';

class RiwayatPemesananView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RiwayatPemesananController _tabx =
        Get.put(RiwayatPemesananController());

    // ↑ init tab controller

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Pesanan Saya',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        elevation: 0.5,
        bottom: TabBar(
          labelColor: Colors.black,
          controller: _tabx.controller,
          tabs: _tabx.myTabs,
          isScrollable: true,
        ),
      ),
      body: TabBarView(
        controller: _tabx.controller,
        children: _tabx.myTabs.map((Tab tab) {
          final String label = tab.text!.toLowerCase();

          return Center(
            child: Text(
              'This is the $label tab',
              style: const TextStyle(fontSize: 36),
            ),
          );
        }).toList(),
      ),
    );
  }
}
