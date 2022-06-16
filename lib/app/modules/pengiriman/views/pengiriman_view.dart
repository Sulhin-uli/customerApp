import 'package:customer_app/app/modules/alamat/controllers/alamat_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/app/utils/base_url.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pengiriman_controller.dart';

class PengirimanView extends GetView<PengirimanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        elevation: 0.5,
        title: Text(
          'Pengiriman',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Alamat Pengirim",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.ALAMAT);
                          },
                          child: Text(
                            "Pilih Alamat Lain",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff16A085),
                            ),
                          ))
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black.withOpacity(0.5),
                ),
                Container(
                  margin: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Obx(
                            () => controller.alamatController.address.isEmpty
                                ? CircularProgressIndicator()
                                : Expanded(
                                    child: Text(
                                      // "Politeknik Negeri Indramayu, jl. lohbener lama, Legok, Kabupaten Indramayu, Jawa Barat",
                                      controller.alamatController.address.first
                                          .completeAddress!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ),
                          ),
                          SizedBox(
                            height: 25, //height of button
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffE3BAC1), // background
                              ),
                              onPressed: () {},
                              child: Text(
                                'Utama',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.red),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Obx(
                        () => controller.alamatController.address.isEmpty
                            ? CircularProgressIndicator()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.alamatController.address.first
                                            .recipientsName! +
                                        " " +
                                        "(" +
                                        controller.alamatController.address
                                            .first.telp! +
                                        ")",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 12),
                                  ),
                                  Text(
                                    controller.alamatController.address.first
                                        .completeAddress!,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 12,
                  color: Color(0xffD1D1D1),
                ),
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 600,
                      color: Colors.white,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(24, 16, 16, 16),
                        child: Column(
                          children: [
                            ListView.builder(
                              scrollDirection: Axis.vertical,
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:
                                  controller.cartController.pengiriman.length,
                              itemBuilder: (context, i) {
                                int length =
                                    controller.cartController.pengiriman.length;
                                final data =
                                    controller.cartController.pengiriman[i];
                                return Column(
                                  children: [
                                    ListTile(
                                      leading: Icon(Icons.store),
                                      title:
                                          Text(data.productId!.userId!.name!),
                                    ),
                                    ListTile(
                                      title: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(7),
                                            height: 100,
                                            width: 100,
                                            child: Image.network(
                                              baseUrlFile +
                                                  "storage/produk/" +
                                                  data.productId!.image!,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                data.productId!.name!,
                                                style: TextStyle(
                                                    color: Color(0xff919A92),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              // Text(
                                              //   "Size Kg",
                                              //   style: TextStyle(
                                              //       color: Color(0xff919A92),
                                              //       fontSize: 12,
                                              //       fontWeight:
                                              //           FontWeight.w400),
                                              // ),
                                              Text(
                                                'Rp ${formatCurrency.format(data.productId!.price!)}',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            // ListTile(
                            //   title: Text('Nama Toko'),
                            //   subtitle: Text(
                            //     'Kabupaten Indramayu',
                            //     style: TextStyle(
                            //         color: Colors.black.withOpacity(0.6)),
                            //   ),
                            // ),
                            // ListTile(
                            //   title: Row(
                            //     children: [
                            //       Icon(
                            //         Icons.image,
                            //         size: 100,
                            //       ),
                            //       Column(
                            //         crossAxisAlignment:
                            //             CrossAxisAlignment.start,
                            //         children: [
                            //           Text(
                            //             "Name Product",
                            //             style: TextStyle(
                            //                 color: Color(0xff919A92),
                            //                 fontSize: 12,
                            //                 fontWeight: FontWeight.w400),
                            //           ),
                            //           Text(
                            //             "Size Kg",
                            //             style: TextStyle(
                            //                 color: Color(0xff919A92),
                            //                 fontSize: 12,
                            //                 fontWeight: FontWeight.w400),
                            //           ),
                            //           Text(
                            //             "Rp. 100.000",
                            //             style: TextStyle(
                            //                 color: Colors.black,
                            //                 fontWeight: FontWeight.bold),
                            //           )
                            //         ],
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              child: Container(
                                margin: EdgeInsets.all(16),
                                color: Colors.white,
                                width: double.infinity,
                                height: 70,
                                child: Column(
                                  children: [
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Reguler",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Ringkasan Belanja",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            "Rp115.000",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.black.withOpacity(0.5),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Ringkasan Belanja",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    "Rp115.000",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Harga ( 1 barang )",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    "Rp100.000",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total ongkos kirim",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    "Rp10.000",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 12,
                      color: Color(0xffD1D1D1),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: Container(
              width: double.infinity,
              height: 70,
              color: Colors.white,
              child: Container(
                child: Column(
                  children: [
                    Divider(
                      color: Color(0xff919A92),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 16, left: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Tagihan",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Rp${formatCurrency.format(controller.cartController.total.value)}',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Respond to button press
                            },
                            style: ElevatedButton.styleFrom(
                              // primary: Color(0xff16A085), // background
                              primary: Colors.grey, // background
                            ),
                            child: Text('Pilih Pembayaran'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
