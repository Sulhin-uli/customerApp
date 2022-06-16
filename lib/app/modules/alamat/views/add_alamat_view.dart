import 'package:customer_app/app/modules/alamat/controllers/alamat_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AddAlamatView extends GetView<AlamatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Tambah Alamat',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Nama Penerima",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              TextFormField(
                controller: controller.recipientsName,
                cursorColor: const Color(0xff16A085),
                decoration: const InputDecoration(
                  // helperText: 'Contoh: Label',
                  // fillColor: Color(0xff919A92),
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
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Telepon",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              TextFormField(
                controller: controller.telp,
                cursorColor: const Color(0xff16A085),
                decoration: const InputDecoration(
                  // helperText: 'Contoh: Label',
                  // fillColor: Color(0xff919A92),
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
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Label Alamat",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              TextFormField(
                controller: controller.addressLabel,
                cursorColor: const Color(0xff16A085),
                decoration: const InputDecoration(
                  helperText: 'Contoh: Rumah/Apartemen/Kantor/Kos',
                  // fillColor: Color(0xff919A92),
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
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Kota & Kecamatan",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              TextFormField(
                controller: controller.city,
                cursorColor: const Color(0xff16A085),
                decoration: const InputDecoration(
                  helperText: 'Contoh: Jawa Barat, Kab. Indramayu, Balongan',
                  // fillColor: Color(0xff919A92),
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
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Kode Pos",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              TextFormField(
                controller: controller.postalCode,
                cursorColor: const Color(0xff16A085),
                decoration: const InputDecoration(
                  helperText: 'Contoh: 45216',
                  // fillColor: Color(0xff919A92),
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
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Alamat Lengkap",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              TextFormField(
                maxLines: 5,
                controller: controller.completeAddress,
                cursorColor: const Color(0xff16A085),
                decoration: InputDecoration(
                  // helperText: 'Contoh: Label',
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
              const SizedBox(height: 30),
              const Text(
                "Catatan untuk kurir",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              TextFormField(
                controller: controller.noteForCourier,
                cursorColor: const Color(0xff16A085),
                decoration: const InputDecoration(
                  helperText: 'Warna rumah, patokan, pesan khusus, dll.',
                  // fillColor: Color(0xff919A92),
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
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Obx(() => Checkbox(
                      value: controller.isMain.value,
                      onChanged: (e) {
                        controller.isMain.value = e!;
                        if (controller.isMain.value == true) {
                          controller.mainAddress.text = 1.toString();
                        } else {
                          controller.mainAddress.text = 0.toString();
                        }
                      })),
                  const Text(
                    "Jadikan Alamat Utama",
                    style: TextStyle(
                      color: Color(0xff919A92),
                    ),
                  ),
                ],
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
                    onPressed: () => controller.postData(
                      controller.recipientsName.text,
                      controller.telp.text,
                      controller.addressLabel.text,
                      controller.completeAddress.text,
                      controller.city.text,
                      int.parse(controller.postalCode.text),
                      int.parse(controller.mainAddress.text),
                      controller.noteForCourier.text,
                    ),
                    child: const Text('Tambah'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
