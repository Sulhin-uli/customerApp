// ignore_for_file: avoid_unnecessary_containers

import 'dart:convert';

import 'package:customer_app/app/data/models/city_model.dart';
import 'package:customer_app/app/data/models/province.dart';
import 'package:customer_app/app/modules/alamat/controllers/alamat_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

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
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  FilteringTextInputFormatter.digitsOnly
                ],
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
                "Provinsi",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Container(
                  child: DropdownSearch<Province>(
                    showClearButton: true,
                    onFind: (String filter) async {
                      Uri url = Uri.parse(
                          "https://api.rajaongkir.com/starter/province");

                      try {
                        final response = await http.get(
                          url,
                          headers: {
                            "key": "0ae702200724a396a933fa0ca4171a7e",
                          },
                        );

                        var data =
                            json.decode(response.body) as Map<String, dynamic>;

                        var statusCode = data["rajaongkir"]["status"]["code"];

                        if (statusCode != 200) {
                          throw data["rajaongkir"]["status"]["description"];
                        }

                        var listAllProvince =
                            data["rajaongkir"]["results"] as List<dynamic>;

                        var models = Province.fromJsonList(listAllProvince);
                        return models;
                      } catch (err) {
                        print(err);
                        return List<Province>.empty();
                      }
                    },
                    onChanged: (prov) {
                      if (prov != null) {
                        controller.hiddenKota.value = false;
                        controller.provinsiId.value =
                            int.parse(prov.provinceId!);
                      } else {
                        controller.hiddenKota.value = true;
                        controller.provinsiId.value = 0;
                      }
                      controller.showButton();
                    },
                    showSearchBox: true,
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
                    searchBoxDecoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 25,
                      ),
                      hintText: "cari provinsi...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    popupItemBuilder: (context, item, isSelected) {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text(
                          "${item.province}",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      );
                    },
                    itemAsString: (item) => item.province!,
                  ),
                ),
              ),
              Obx(
                () => controller.hiddenKota.isTrue
                    ? SizedBox()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Kota / Kabupaten ",
                            style: TextStyle(
                              color: Color(0xff919A92),
                            ),
                          ),
                          DropdownSearch<City>(
                            showClearButton: true,
                            onFind: (String filter) async {
                              int provId = controller.provinsiId.value;
                              Uri url = Uri.parse(
                                "https://api.rajaongkir.com/starter/city?province=$provId",
                              );

                              try {
                                final response = await http.get(
                                  url,
                                  headers: {
                                    "key": "0ae702200724a396a933fa0ca4171a7e",
                                  },
                                );

                                var data = json.decode(response.body)
                                    as Map<String, dynamic>;

                                var statusCode =
                                    data["rajaongkir"]["status"]["code"];

                                if (statusCode != 200) {
                                  throw data["rajaongkir"]["status"]
                                      ["description"];
                                }

                                var listAllCity = data["rajaongkir"]["results"]
                                    as List<dynamic>;

                                var models = City.fromJsonList(listAllCity);
                                return models;
                              } catch (err) {
                                print(err);
                                return List<City>.empty();
                              }
                            },
                            onChanged: (cityValue) {
                              if (cityValue != null) {
                                controller.kotaId.value =
                                    int.parse(cityValue.cityId!);
                              } else {
                                print(
                                    "Tidak memilih kota / kabupaten asal apapun");
                                controller.kotaId.value = 0;
                              }
                              controller.showButton();
                            },
                            showSearchBox: true,
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
                            searchBoxDecoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 25,
                              ),
                              hintText: "cari kota / kabupaten...",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            popupItemBuilder: (context, item, isSelected) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Text(
                                  "${item.type} ${item.cityName}",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              );
                            },
                            itemAsString: (item) =>
                                "${item.type} ${item.cityName}",
                          ),
                        ],
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
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  FilteringTextInputFormatter.digitsOnly
                ],
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
