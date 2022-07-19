import 'package:customer_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:customer_app/app/modules/ongkir/views/widget/berat.dart';
import 'package:customer_app/app/modules/ongkir/views/widget/city.dart';
import 'package:customer_app/app/modules/ongkir/views/widget/province.dart';
import 'package:customer_app/app/modules/pengiriman/controllers/pengiriman_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CekOngkirView extends GetView<PengirimanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        elevation: 0.5,
        title: Text(
          'Cek Ongkir',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: DropdownSearch<Map<String, dynamic>>(
                mode: Mode.MENU,
                dropdownSearchDecoration: const InputDecoration(
                  labelText: "",
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff919A92),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff16A085),
                    ),
                  ),
                  // border: border,
                ),
                showClearButton: true,
                items: [
                  {
                    "code": "jne",
                    "name": "Jalur Nugraha Ekakurir (JNE)",
                  },
                  {
                    "code": "tiki",
                    "name": "Titipan Kilat (TIKI)",
                  },
                  {
                    "code": "pos",
                    "name": "Perusahaan Opsional Surat (POS)",
                  },
                ],
                label: "Tipe Kurir",
                hint: "pilih tipe kurir...",
                onChanged: (value) {
                  if (value != null) {
                    controller.kurir.value = value["code"];
                    controller.showButton();
                  } else {
                    controller.hiddenButton.value = true;
                    controller.kurir.value = "";
                  }
                },
                itemAsString: (item) => "${item['name']}",
                popupItemBuilder: (context, item, isSelected) => Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "${item['name']}",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => controller.hiddenButton.isTrue
                  ? SizedBox()
                  : Center(
                      child: SizedBox(
                        height: 46, //height of button
                        width: 300,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff16A085), // background
                          ),
                          onPressed: () =>
                              controller.ongkosKirim(149, 148, 250),
                          child: Obx(
                            () => controller.isLoading.isTrue
                                ? const CircularProgressIndicator()
                                : Text(
                                    'Cek ongkos kirim',
                                  ),
                          ),
                        ),
                      ),
                    ),
            ),
            SizedBox(
              height: 2,
            ),
            // Center(
            //   child: SizedBox(
            //     height: 46, //height of button
            //     width: 300,
            //     child: ElevatedButton(
            //       style: ElevatedButton.styleFrom(
            //         primary: const Color(0xff16A085), // background
            //       ),
            //       onPressed: () {
            //         Get.toNamed(Routes.ONGKIR);
            //       },
            //       child: Text('Cek Ongkir'),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
