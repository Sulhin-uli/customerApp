import 'package:customer_app/app/modules/riwayat_pemesanan/controllers/riwayat_pemesanan_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/app/utils/base_url.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailRiwayatPemesananView extends GetView<RiwayatPemesananController> {
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
  @override
  Widget build(BuildContext context) {
    final dataDetail = controller.findByid(Get.arguments);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        elevation: 0.5,
        title: Text(
          'Detail Pemesanan',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 3,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Alamat Pengiriman",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Container()
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Divider(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dataDetail.address!.recipientsName! +
                                      " " +
                                      "(" +
                                      dataDetail.address!.telp! +
                                      ")",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 12),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  dataDetail.address!.completeAddress!,
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Container(
                      //   width: double.infinity,
                      //   height: 12,
                      //   color: Color.fromARGB(255, 245, 245, 245),
                      // ),
                    ]),
              ),
            ),

            // Column(
            //   children: [
            //     ListView.builder(
            //       scrollDirection: Axis.vertical,
            //       padding: EdgeInsets.zero,
            //       shrinkWrap: true,
            //       physics: NeverScrollableScrollPhysics(),
            //       itemCount: dataDetail.orderItems!.length,
            //       itemBuilder: (context, i) {
            //         final data = dataDetail.orderItems![i];
            //         final dataImage = controller.produkController.photoProduct
            //             .where((e) =>
            //                 e.productId!.id == int.parse(data.productId!))
            //             .first
            //             .name;
            //         return Container(
            //           padding: EdgeInsets.fromLTRB(24, 16, 16, 0),
            //           child: Column(
            //             children: [
            //               ListTile(
            //                 title: Column(
            //                   children: [
            //                     Padding(
            //                       padding:
            //                           const EdgeInsets.fromLTRB(7, 0, 7, 0),
            //                       child: Row(
            //                         children: [
            //                           Icon(
            //                             Icons.store,
            //                             size: 12,
            //                           ),
            //                           SizedBox(width: 5),
            //                           Text(
            //                             controller.produkController.product
            //                                 .firstWhere((e) =>
            //                                     e.id ==
            //                                     int.parse(data.productId!))
            //                                 .userId!
            //                                 .name!,
            //                             style: TextStyle(
            //                               fontSize: 12,
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                     Row(
            //                       children: [
            //                         Container(
            //                           padding: EdgeInsets.all(7),
            //                           height: 100,
            //                           width: 100,
            //                           child: Image.network(
            //                             baseUrlFile +
            //                                 "storage/produk/" +
            //                                 dataImage!,
            //                             fit: BoxFit.cover,
            //                           ),
            //                         ),
            //                         Column(
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             Text(
            //                               controller.produkController.product
            //                                   .firstWhere((e) =>
            //                                       e.id ==
            //                                       int.parse(data.productId!))
            //                                   .name!,
            //                               style: TextStyle(
            //                                   color: Color(0xff919A92),
            //                                   fontSize: 12,
            //                                   fontWeight: FontWeight.w400),
            //                             ),
            //                             Text(
            //                               data.qty.toString() + " Barang",
            //                               style: TextStyle(
            //                                   color: Color(0xff919A92),
            //                                   fontSize: 12,
            //                                   fontWeight: FontWeight.w400),
            //                             ),
            //                             Text(
            //                               'Rp ${formatCurrency.format(controller.produkController.product.firstWhere((e) => e.id == int.parse(data.productId!)).price!)}',
            //                               style: TextStyle(
            //                                   color: Colors.black,
            //                                   fontWeight: FontWeight.bold),
            //                             ),
            //                             (dataDetail.status == "completed" &&
            //                                     dataDetail.paymentStatus ==
            //                                         "paid")
            //                                 ? ElevatedButton(
            //                                     onPressed: () {
            //                                       Get.toNamed(Routes.ULASAN,
            //                                           arguments: [
            //                                             Get.arguments,
            //                                             data.id
            //                                           ]);
            //                                     },
            //                                     style: ElevatedButton.styleFrom(
            //                                       primary: Color(
            //                                           0xff16A085), // background
            //                                     ),
            //                                     child: Text('Beri Ulasan'),
            //                                   )
            //                                 : Container(),
            //                           ],
            //                         ),
            //                       ],
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ],
            //           ),
            //         );
            //       },
            //     ),
            //   ],
            // ),

            // Divider(
            //   color: Colors.black.withOpacity(0.5),
            // ),

            Card(
              elevation: 3,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rincian Pemesanan",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Invoice ID",
                      style: TextStyle(color: Color(0xff919A92), fontSize: 12),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      dataDetail.code!,
                      style: TextStyle(fontSize: 13),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Tanggal Pemesanan",
                      style: TextStyle(color: Color(0xff919A92), fontSize: 12),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      DateFormat("EEEE, d MMMM yyyy", "id_ID")
                          .format(dataDetail.orderDate!),
                      style: TextStyle(fontSize: 13),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Status Pesanan",
                      style: TextStyle(color: Color(0xff919A92), fontSize: 12),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      dataDetail.status!,
                      style: TextStyle(fontSize: 13),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Status Pembayaran",
                      style: TextStyle(color: Color(0xff919A92), fontSize: 12),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      dataDetail.paymentStatus!,
                      style: TextStyle(fontSize: 13),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),

            Card(
              elevation: 3,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
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
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Rp${formatCurrency.format(dataDetail.totalPrice)}',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Waktu Pembayaran",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              CountdownTimer(
                                controller: controller.controllerCountdownTimer,
                                // onEnd: controller.onEnd,
                                // endTime: controller.endTime,
                                textStyle: TextStyle(fontSize: 12),
                              ),
                              // Text(
                              //   "",
                              //   style: TextStyle(
                              //       color: Colors.red,
                              //       fontWeight: FontWeight.bold),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    (dataDetail.status != "completed")
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Center(
                                  child: SizedBox(
                                    height: 46, //height of button
                                    width: 300,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Get.toNamed(Routes.PEMBAYARAN,
                                        //     arguments: dataDetail.paymentUrl);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.red, // background
                                      ),
                                      child: Text('Batalkan Pemesanan'),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Center(
                                  child: SizedBox(
                                    height: 46, //height of button
                                    width: 300,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Get.toNamed(Routes.PEMBAYARAN,
                                            arguments: dataDetail.paymentUrl);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color(0xff16A085), // background
                                      ),
                                      child: Text('Lanjutkan Pembayaran'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
