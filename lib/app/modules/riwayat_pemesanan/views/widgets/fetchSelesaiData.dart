import 'package:customer_app/app/modules/riwayat_pemesanan/controllers/riwayat_pemesanan_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

SingleChildScrollView fecthSelesaiData(RiwayatPemesananController _tabx) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Obx(
          () => _tabx.isLoading.isTrue
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : _tabx.riwayatPemesanan
                      .where((e) => e.status == "completed")
                      .isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 7,
                          ),
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
                      margin: EdgeInsets.only(top: 10),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _tabx.riwayatPemesanan
                            .where((e) => e.status == "completed")
                            .length,
                        itemBuilder: (context, i) {
                          int length = _tabx.riwayatPemesanan.length;
                          final data = _tabx.riwayatPemesanan
                              .where((e) => e.status == "completed")
                              .toList()[i];
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            child: Card(
                              elevation: 5,
                              clipBehavior: Clip.antiAlias,
                              child: ListTile(
                                title: Column(
                                  children: [
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: 80,
                                          child: Text(
                                            "ID Pesanan",
                                            style: TextStyle(
                                              fontSize: 9,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: 10,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              width: 200,
                                              child: Text(
                                                data.code.toString(),
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 200,
                                              child: Text(
                                                DateFormat("EEEE, d MMMM yyyy",
                                                        "id_ID")
                                                    .format(data.orderDate!),
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      color: Color(0xff919A92),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: 80,
                                          child: Text(
                                            "Total Bayar",
                                            style: TextStyle(
                                              fontSize: 9,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: 10,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: Text(
                                            'Rp ${formatCurrency.format(data.totalPrice)}',
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      color: Color(0xff919A92),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: 80,
                                          child: Text(
                                            "Nama Pemesan",
                                            style: TextStyle(
                                              fontSize: 9,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: 10,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: Text(
                                            data.nameBilling!,
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      color: Color(0xff919A92),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: 80,
                                          child: Text(
                                            "Status Pesanan",
                                            style: TextStyle(
                                              fontSize: 9,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: 10,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: Text(
                                            data.status.toString(),
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      color: Color(0xff919A92),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: 80,
                                          child: Text(
                                            "Status Pembayaran",
                                            style: TextStyle(
                                              fontSize: 9,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: 10,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: Text(
                                            data.paymentStatus.toString(),
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 46, //height of button
                                              width: 300,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: const Color(
                                                        0xff16A085), // background
                                                  ),
                                                  onPressed: () {
                                                    _tabx.getDataDetail(
                                                        data.id!);
                                                  },
                                                  child: const Text(
                                                      'Detail Pesanan')),
                                            ),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            (data.review == "reviewed")
                                                ? Container()
                                                : SizedBox(
                                                    height:
                                                        46, //height of button
                                                    width: 300,
                                                    child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          primary: const Color(
                                                              0xff16A085), // background
                                                        ),
                                                        onPressed: () {
                                                          _tabx.multipleUlas(
                                                              data.id!);
                                                        },
                                                        child: const Text(
                                                            'Beri Ulasan')),
                                                  )
                                          ],
                                        ),
                                      ),
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
  );
}
