import 'package:customer_app/app/modules/riwayat_pemesanan/views/widgets/fetchAllData.dart';
import 'package:customer_app/app/modules/riwayat_pemesanan/views/widgets/fetchDibatalkanData.dart';
import 'package:customer_app/app/modules/riwayat_pemesanan/views/widgets/fetchDikemasData.dart';
import 'package:customer_app/app/modules/riwayat_pemesanan/views/widgets/fetchDikirimData.dart';
import 'package:customer_app/app/modules/riwayat_pemesanan/views/widgets/fetchSelesaiData.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
      body: NotificationListener<ScrollEndNotification>(
        onNotification: (scrollEnd) {
          final metrics = scrollEnd.metrics;
          if (metrics.atEdge) {
            bool isTop = metrics.pixels == 0;
            if (isTop) {
              // print('At the top');
            } else {
              // print('At the bottom');
              _tabx.addItems();
            }
          }
          return true;
        },
        child: SmartRefresher(
          controller: _tabx.refreshController,
          onRefresh: _tabx.onRefresh,
          onLoading: _tabx.onLoading,
          header: WaterDropMaterialHeader(),
          enablePullDown: true,
          enablePullUp: false,
          child: TabBarView(controller: _tabx.controller, children: [
            fecthAllData(_tabx),
            fecthDikemasData(_tabx),
            fecthDikirimData(_tabx),
            fecthSelesaiData(_tabx),
            fecthDibatalkanData(_tabx),
          ]),
        ),
      ),
    );
  }
}
