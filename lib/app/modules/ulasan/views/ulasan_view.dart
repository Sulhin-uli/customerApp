import 'package:customer_app/app/utils/base_url.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ulasan_controller.dart';
import 'package:givestarreviews/givestarreviews.dart';

class UlasanView extends GetView<UlasanController> {
  const UlasanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var arg = Get.arguments;
    final data = controller.riwayatPemesananController
        .findByid(arg[0])
        .orderItems!
        .firstWhere((e) => e.id == arg[1]);

    final dataImage = controller
        .riwayatPemesananController.produkController.photoProduct
        .where((e) => e.productId!.id == data.productId!.id)
        .first
        .name;
    // print(
    //   data.productId!.userId!.name!,
    // );
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: BackButton(color: Colors.black),
          elevation: 0.5,
          title: Text(
            'Beri Ulasan',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(24, 16, 16, 0),
                  child: Column(
                    children: [
                      ListTile(
                        title: Column(
                          children: [
                            // Padding(
                            //   padding: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                            //   child: Row(
                            //     children: [
                            //       Icon(
                            //         Icons.store,
                            //         size: 12,
                            //       ),
                            //       SizedBox(width: 5),
                            //       Text(
                            //         controller.riwayatPemesananController
                            //             .detailRiwayatPemesanan
                            //             .firstWhere(
                            //                 (e) => e.id == data.productId!.id!)
                            //             .userId!,
                            //         style: TextStyle(
                            //           fontSize: 12,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(7),
                                  height: 100,
                                  width: 100,
                                  child: Image.network(
                                    baseUrlFile +
                                        "storage/produk/" +
                                        dataImage!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.productId!.name!,
                                      style: TextStyle(
                                          color: Color(0xff919A92),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      data.qty.toString() + " Barang",
                                      style: TextStyle(
                                          color: Color(0xff919A92),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'Rp ${formatCurrency.format(data.productId!.price!)}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      StarRating(onChanged: (rate) {
                        // print(rate);
                        controller.starsRated.value = rate;
                      }),
                      const SizedBox(height: 30),
                      const Text(
                        "Ulasan",
                        style: TextStyle(
                          color: Color(0xff919A92),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        maxLines: 5,
                        controller: controller.ulasanController,
                        cursorColor: const Color(0xff16A085),
                        decoration: InputDecoration(
                          // helperText: 'Contoh: Isi ulasan',
                          // fillColor: Color(0xff919A92),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff919A92),
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff16A085),
                            ),
                          ),
                          fillColor: Colors.grey[100],
                          filled: true,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: SizedBox(
                    height: 46, //height of button
                    width: 300,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff16A085), // background
                      ),
                      // onPressed: () => authC.login(
                      //     controller.email.text, controller.password.text),
                      onPressed: () {
                        // print(controller.ulasanController.text);
                        controller.addData(
                            Get.arguments[0],
                            data.productId!.id!,
                            controller.starsRated.value.toString(),
                            controller.ulasanController.text);
                      },
                      child: const Text('Kirim'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
