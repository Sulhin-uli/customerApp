import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      backgroundColor: Colors.white,
      body: TabBarView(controller: _tabx.controller, children: [
        // Container(
        //   child: Text("1"),
        // ),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => _tabx.isLoading.isTrue
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : _tabx.riwayatPemesanan.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/empty-data.svg",
                                  height: 100,
                                  width: 100,
                                ),
                                Text(
                                  "Data Tidak Ada",
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.only(top: 5),
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: _tabx.riwayatPemesanan.length,
                              itemBuilder: (context, i) {
                                int length = _tabx.riwayatPemesanan.length;
                                final data = _tabx.riwayatPemesanan[i];
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 16),
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    child: ListTile(
                                      title: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(data.code.toString(),
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                  ))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                                // return ItemWishlist();
                              },
                            ),
                          ),
              ),
            ],
          ),
        ),
        Container(),
        Container(),
        Container(),
        Container(),
      ]),
    );
  }
}
