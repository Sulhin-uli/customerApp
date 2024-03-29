import 'package:customer_app/app/modules/alamat/controllers/alamat_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/app/utils/base_url.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/pengiriman_controller.dart';

class PengirimanView extends GetView<PengirimanController> {
  var weightTotal = 0;
  var cityIdStore = 149;
  var cityIdCustomer = 149;
  // indramayu 149
  @override
  Widget build(BuildContext context) {
    controller.markProductId.clear();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        elevation: 0.5,
        title: Text(
          'Checkout',
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
                        "Alamat Pengiriman",
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
                      Row(
                        children: [
                          Obx(
                            () => controller.alamatController.address.isEmpty
                                ? Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/empty-data.svg",
                                          height: 50,
                                          width: 50,
                                        ),
                                      ],
                                    ),
                                  )
                                : (controller.alamatController.address
                                        .where((e) => e.mainAddress == 1)
                                        .isNotEmpty)
                                    ? Expanded(
                                        child: Text(
                                          // "Politeknik Negeri Indramayu, jl. lohbener lama, Legok, Kabupaten Indramayu, Jawa Barat",
                                          (controller.alamatController.address
                                                  .where((e) =>
                                                      e.mainAddress == 1))
                                              .first
                                              .addressLabel!,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      )
                                    : Expanded(
                                        child: Text(
                                          // "Politeknik Negeri Indramayu, jl. lohbener lama, Legok, Kabupaten Indramayu, Jawa Barat",
                                          "Alamat belum dipilih",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      ),
                          ),
                          Obx(
                            () => (controller.alamatController.address
                                    .where((e) => e.mainAddress == 1)).isEmpty
                                ? Container()
                                : SizedBox(
                                    height: 25, //height of button
                                    width: 70,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color(0xffE3BAC1), // background
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        'Utama',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.red),
                                      ),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Obx(
                        () => (controller.alamatController.address
                                .where((e) => e.mainAddress == 1)).isEmpty
                            ? Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [Container()],
                                ),
                              )
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
                  color: Color.fromARGB(255, 245, 245, 245),
                ),
                Column(
                  children: [
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.cartController.cart.length,
                      itemBuilder: (context, i) {
                        final data = controller.cartController.cart[i];

                        var dataImage;

                        try {
                          dataImage = controller
                              .cartController.produkController.photoProduct
                              .where(
                                  (e) => e.productId!.id == data.productId!.id)
                              .first
                              .name;
                        } catch (e) {
                          // print(e);
                          dataImage = false;
                        }
                        if (data.isMark == true) {
                          weightTotal = weightTotal +
                              (data.productId!.weight! * data.productQty!);
                          controller.markProductId.add(data.id!);
                          // print(data.id);
                          return Container(
                            padding: EdgeInsets.fromLTRB(24, 16, 16, 0),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            7, 0, 7, 0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.store,
                                              size: 12,
                                            ),
                                            SizedBox(width: 5),
                                            Text(data.productId!.userId!.name!,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ))
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          (dataImage == false)
                                              ? Container(
                                                  padding: EdgeInsets.all(7),
                                                  height: 100,
                                                  width: 100,
                                                  color: Colors.grey,
                                                  child: Center(
                                                      child: Text("No Image")))
                                              : Container(
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
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                data.productQty.toString() +
                                                    " Barang",
                                                style: TextStyle(
                                                    color: Color(0xff919A92),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                "Berat " +
                                                    (data.productId!.weight! *
                                                            data.productQty!)
                                                        .toString() +
                                                    " gram",
                                                style: TextStyle(
                                                    color: Color(0xff919A92),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              SizedBox(
                                                height: 3,
                                              ),
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                Obx(
                  () => controller.isChoice.isFalse
                      ? Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Card(
                            elevation: 5,
                            child: ListTile(
                              onTap: () {
                                Get.toNamed(Routes.CEK_ONGKIR, arguments: [
                                  cityIdStore,
                                  cityIdCustomer,
                                  weightTotal
                                ]);
                              },
                              leading: Icon(
                                Icons.local_shipping,
                                color: Color(0xff16A085),
                              ),
                              title: Text("Pilih Pengiriman"),
                              trailing: Icon(Icons.arrow_forward_ios_rounded),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Card(
                              elevation: 5,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      controller.ongkir.first["service"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    trailing:
                                        Icon(Icons.arrow_forward_ios_rounded),
                                    onTap: () {
                                      Get.toNamed(Routes.CEK_ONGKIR,
                                          arguments: [
                                            cityIdStore,
                                            cityIdCustomer,
                                            weightTotal
                                          ]);
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Divider(
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      controller.ongkir.first["name"] +
                                          " - (Rp ${formatCurrency.format(controller.ongkir.first['harga'])})",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                    subtitle: Text("Estimasi pengiriman : " +
                                        controller.ongkir.first["hari"]),
                                    trailing:
                                        Icon(Icons.arrow_forward_ios_rounded),
                                    onTap: () {
                                      // Get.toNamed(Routes.CEK_ONGKIR);
                                      Get.toNamed(Routes.CEK_ONGKIR,
                                          arguments: [
                                            cityIdStore,
                                            cityIdCustomer,
                                            weightTotal
                                          ]);
                                    },
                                  )
                                ],
                              )),
                        ),
                ),

                Divider(
                  color: Colors.black.withOpacity(0.5),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          // "Subtotal (0 Barang)",
                          "Subtotal (" +
                              // data.productQty.toString()
                              controller.cartController.lengthMark.toString() +
                              " Barang)",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          // "Rp 100.000",
                          "Rp ${formatCurrency.format(controller.totalHarga.value)}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 5,
                // ),
                // Container(
                //   width: double.infinity,
                //   height: 12,
                //   color: Color(0xffD1D1D1),
                // ),
                Container(
                  height: 70,
                ),
              ],
            ),
          ),
          Container(),
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
                      child: Column(
                        children: [
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
                                    Obx(
                                      () => Text(
                                        'Rp${formatCurrency.format(controller.totalHarga.value)}',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                                Obx(
                                  () =>
                                      // controller.isAllChoice.isFalse
                                      (controller.alamatController.address
                                              .where((e) =>
                                                  e.mainAddress == 1)).isEmpty
                                          ? ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                primary:
                                                    Colors.grey, // background
                                              ),
                                              child: Text('Buat Pesanan'),
                                            )
                                          : controller.isAllChoice.isFalse
                                              ? ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors
                                                        .grey, // background
                                                  ),
                                                  child: Text('Buat Pesanan'),
                                                )
                                              : ElevatedButton(
                                                  onPressed: () {
                                                    controller.checkout();
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(
                                                        0xff16A085), // background
                                                  ),
                                                  child: Text('Buat Pesanan'),
                                                ),
                                ),
                              ],
                            ),
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
