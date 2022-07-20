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
                        // ? Center(
                        //     child: Column(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         SvgPicture.asset(
                        //           "assets/icons/empty-data.svg",
                        //           height: 100,
                        //           width: 100,
                        //         ),
                        //         Text(
                        //           "Data Tidak Ada",
                        //           style: TextStyle(color: Colors.grey),
                        //         )
                        //       ],
                        //     ),
                        //   )
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Container(
                            margin: EdgeInsets.only(top: 10),
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
                                                      data.orderDate.toString(),
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
                                                  data.totalPrice.toString(),
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
                                              child: SizedBox(
                                                height: 46, //height of button
                                                width: 300,
                                                child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
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
        ),
        Container(),
        Container(),
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
                            margin: EdgeInsets.only(top: 10),
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: _tabx.riwayatPemesanan.length,
                              itemBuilder: (context, i) {
                                int length = _tabx.riwayatPemesanan.length;
                                final data = _tabx.riwayatPemesanan[i];
                                if (data.paymentStatus == "paid" &&
                                    data.status == "completed") {
                                  return Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 16),
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
                                                        data.orderDate
                                                            .toString(),
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
                                                    data.totalPrice.toString(),
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
                                                    data.paymentStatus
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Center(
                                                child: SizedBox(
                                                  height: 46, //height of button
                                                  width: 300,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
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
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return SizedBox();
                                }
                              },
                            ),
                          ),
              ),
            ],
          ),
        ),
        Container(),
      ]),
    );
  }
}
