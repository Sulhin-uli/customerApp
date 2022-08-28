import 'dart:convert';

import 'package:customer_app/app/data/models/city_model.dart';
import 'package:customer_app/app/data/models/district_model.dart';
import 'package:customer_app/app/data/models/province.dart';
import 'package:customer_app/app/data/models/village_model.dart';
import 'package:customer_app/app/modules/alamat/controllers/alamat_controller.dart';
import 'package:customer_app/app/utils/base_url.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class EditAlamatView extends GetView<AlamatController> {
  @override
  Widget build(BuildContext context) {
    final data = controller.findByid(Get.arguments);
    controller.recipientsName.text = data.recipientsName!;
    controller.telp.text = data.telp!;
    controller.addressLabel.text = data.addressLabel!;
    // controller.city.text = data.city!;
    controller.postalCode.text = data.postalCode!.toString();
    controller.completeAddress.text = data.completeAddress!;
    controller.noteForCourier.text = data.noteForCourier!;
    controller.mainAddress.text = data.mainAddress!.toString();
    var main = controller.mainAddress.text;

    if (main == "1") {
      controller.isMain.value = true;
    } else {
      controller.isMain.value = false;
    }

    // print(data.recipientsName!);
    // print(data.telp!);
    // print(data.addressLabel!);
    // print(data.city!);
    // print(data.postalCode!.toString());
    // print(data.completeAddress!);
    // print(data.noteForCourier!);

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
                      Uri url = Uri.parse(baseUrl + "provinces");

                      try {
                        final response = await http.get(url);

                        var data = List<Map<String, dynamic>>.from(
                            json.decode(response.body));

                        var listAllProvince = data as List<dynamic>;

                        var models = Province.fromJsonList(listAllProvince);
                        return models;
                      } catch (err) {
                        print(err);
                        return List<Province>.empty();
                      }
                    },
                    onChanged: (prov) {
                      // print(prov!.name);
                      if (prov != null) {
                        controller.hiddenCity.value = false;
                        controller.provinceId.value = int.parse(prov.id!);
                      } else {
                        controller.hiddenCity.value = true;
                        controller.provinceId.value = 0;
                      }
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
                          "${item.name}",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      );
                    },
                    itemAsString: (item) => item.name!,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Obx(
                () => controller.hiddenCity.isTrue
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
                              Uri url = Uri.parse(baseUrl + "cities");

                              try {
                                Map<String, String> body = {
                                  'id': controller.provinceId.value.toString(),
                                };
                                final response =
                                    await http.post(url, body: body);

                                var data = List<Map<String, dynamic>>.from(
                                    json.decode(response.body)["cities"]);

                                var listCity = data as List<dynamic>;

                                var models = City.fromJsonList(listCity);
                                return models;
                              } catch (err) {
                                print(err);
                                return List<City>.empty();
                              }
                            },
                            onChanged: (prov) {
                              // print(prov!.name);
                              if (prov != null) {
                                controller.hiddenDistrict.value = false;
                                controller.cityId.value = int.parse(prov.id!);
                              } else {
                                controller.hiddenDistrict.value = true;
                                controller.cityId.value = 0;
                              }
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
                              hintText: "cari kota...",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            popupItemBuilder: (context, item, isSelected) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Text(
                                  "${item.name}",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              );
                            },
                            itemAsString: (item) => item.name!,
                          ),
                        ],
                      ),
              ),
              const SizedBox(height: 30),
              Obx(
                () => controller.hiddenDistrict.isTrue
                    ? SizedBox()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Kecamatan ",
                            style: TextStyle(
                              color: Color(0xff919A92),
                            ),
                          ),
                          DropdownSearch<District>(
                            showClearButton: true,
                            onFind: (String filter) async {
                              Uri url = Uri.parse(baseUrl + "districts");

                              try {
                                Map<String, String> body = {
                                  'id': controller.cityId.value.toString(),
                                };
                                final response =
                                    await http.post(url, body: body);

                                var data = List<Map<String, dynamic>>.from(
                                    json.decode(response.body)["districts"]);

                                var listCity = data as List<dynamic>;

                                var models = District.fromJsonList(listCity);
                                return models;
                              } catch (err) {
                                print(err);
                                return List<District>.empty();
                              }
                            },
                            onChanged: (prov) {
                              // print(prov!.name);
                              if (prov != null) {
                                controller.hiddenVillage.value = false;
                                controller.districtId.value =
                                    int.parse(prov.id!);
                              } else {
                                controller.hiddenVillage.value = true;
                                controller.districtId.value = 0;
                              }
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
                              hintText: "cari kecamatan...",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            popupItemBuilder: (context, item, isSelected) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Text(
                                  "${item.name}",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              );
                            },
                            itemAsString: (item) => item.name!,
                          ),
                        ],
                      ),
              ),
              const SizedBox(height: 30),
              Obx(
                () => controller.hiddenVillage.isTrue
                    ? SizedBox()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Desa ",
                            style: TextStyle(
                              color: Color(0xff919A92),
                            ),
                          ),
                          DropdownSearch<Village>(
                            showClearButton: true,
                            onFind: (String filter) async {
                              Uri url = Uri.parse(baseUrl + "villages");

                              try {
                                Map<String, String> body = {
                                  'id': controller.districtId.value.toString(),
                                };
                                final response =
                                    await http.post(url, body: body);

                                var data = List<Map<String, dynamic>>.from(
                                    json.decode(response.body)["villages"]);

                                var listVillage = data as List<dynamic>;

                                var models = Village.fromJsonList(listVillage);
                                return models;
                              } catch (err) {
                                print(err);
                                return List<Village>.empty();
                              }
                            },
                            onChanged: (prov) {
                              // print(prov!.name);
                              if (prov != null) {
                                controller.villageId.value =
                                    int.parse(prov.id!);
                              } else {
                                controller.villageId.value = 0;
                              }
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Text(
                                  "${item.name}",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              );
                            },
                            itemAsString: (item) => item.name!,
                          ),
                        ],
                      ),
              ),
              const SizedBox(height: 30),
              // const Text(
              //   "Provinsi",
              //   style: TextStyle(
              //     color: Color(0xff919A92),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 30),
              //   child: Container(
              //     child: DropdownSearch<Province>(
              //       showClearButton: true,
              //       onFind: (String filter) async {
              //         Uri url = Uri.parse(
              //             "https://api.rajaongkir.com/starter/province");

              //         try {
              //           final response = await http.get(
              //             url,
              //             headers: {
              //               "key": "0ae702200724a396a933fa0ca4171a7e",
              //             },
              //           );

              //           var data =
              //               json.decode(response.body) as Map<String, dynamic>;

              //           var statusCode = data["rajaongkir"]["status"]["code"];

              //           if (statusCode != 200) {
              //             throw data["rajaongkir"]["status"]["description"];
              //           }

              //           var listAllProvince =
              //               data["rajaongkir"]["results"] as List<dynamic>;

              //           var models = Province.fromJsonList(listAllProvince);
              //           return models;
              //         } catch (err) {
              //           print(err);
              //           return List<Province>.empty();
              //         }
              //       },
              //       onChanged: (prov) {
              //         if (prov != null) {
              //           controller.hiddenKota.value = false;
              //           controller.provinsiId.value =
              //               int.parse(prov.provinceId!);
              //         } else {
              //           controller.hiddenKota.value = true;
              //           controller.provinsiId.value = 0;
              //         }
              //         controller.showButton();
              //       },
              //       showSearchBox: true,
              //       dropdownSearchDecoration: const InputDecoration(
              //         labelText: "",
              //         contentPadding: EdgeInsets.symmetric(
              //           vertical: 10,
              //           horizontal: 15,
              //         ),
              //         enabledBorder: UnderlineInputBorder(
              //           borderSide: BorderSide(
              //             color: Color(0xff919A92),
              //           ),
              //         ),
              //         focusedBorder: UnderlineInputBorder(
              //           borderSide: BorderSide(
              //             color: Color(0xff16A085),
              //           ),
              //         ),
              //         // border: border,
              //       ),
              //       searchBoxDecoration: InputDecoration(
              //         contentPadding: EdgeInsets.symmetric(
              //           vertical: 10,
              //           horizontal: 25,
              //         ),
              //         hintText: "cari provinsi...",
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(50),
              //         ),
              //       ),
              //       popupItemBuilder: (context, item, isSelected) {
              //         return Container(
              //           padding:
              //               EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              //           child: Text(
              //             "${item.province}",
              //             style: TextStyle(
              //               fontSize: 18,
              //             ),
              //           ),
              //         );
              //       },
              //       itemAsString: (item) => item.province!,
              //     ),
              //   ),
              // ),
              // Obx(
              //   () => controller.hiddenKota.isTrue
              //       ? SizedBox()
              //       : Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             const Text(
              //               "Kota / Kabupaten ",
              //               style: TextStyle(
              //                 color: Color(0xff919A92),
              //               ),
              //             ),
              //             DropdownSearch<City>(
              //               showClearButton: true,
              //               onFind: (String filter) async {
              //                 int provId = controller.provinsiId.value;
              //                 Uri url = Uri.parse(
              //                   "https://api.rajaongkir.com/starter/city?province=$provId",
              //                 );

              //                 try {
              //                   final response = await http.get(
              //                     url,
              //                     headers: {
              //                       "key": "0ae702200724a396a933fa0ca4171a7e",
              //                     },
              //                   );

              //                   var data = json.decode(response.body)
              //                       as Map<String, dynamic>;

              //                   var statusCode =
              //                       data["rajaongkir"]["status"]["code"];

              //                   if (statusCode != 200) {
              //                     throw data["rajaongkir"]["status"]
              //                         ["description"];
              //                   }

              //                   var listAllCity = data["rajaongkir"]["results"]
              //                       as List<dynamic>;

              //                   var models = City.fromJsonList(listAllCity);
              //                   return models;
              //                 } catch (err) {
              //                   print(err);
              //                   return List<City>.empty();
              //                 }
              //               },
              //               onChanged: (cityValue) {
              //                 if (cityValue != null) {
              //                   controller.kotaId.value =
              //                       int.parse(cityValue.cityId!);
              //                 } else {
              //                   print(
              //                       "Tidak memilih kota / kabupaten asal apapun");
              //                   controller.kotaId.value = 0;
              //                 }
              //                 controller.showButton();
              //               },
              //               showSearchBox: true,
              //               dropdownSearchDecoration: const InputDecoration(
              //                 labelText: "",
              //                 contentPadding: EdgeInsets.symmetric(
              //                   vertical: 10,
              //                   horizontal: 15,
              //                 ),
              //                 enabledBorder: UnderlineInputBorder(
              //                   borderSide: BorderSide(
              //                     color: Color(0xff919A92),
              //                   ),
              //                 ),
              //                 focusedBorder: UnderlineInputBorder(
              //                   borderSide: BorderSide(
              //                     color: Color(0xff16A085),
              //                   ),
              //                 ),
              //                 // border: border,
              //               ),
              //               searchBoxDecoration: InputDecoration(
              //                 contentPadding: EdgeInsets.symmetric(
              //                   vertical: 10,
              //                   horizontal: 25,
              //                 ),
              //                 hintText: "cari kota / kabupaten...",
              //                 border: OutlineInputBorder(
              //                   borderRadius: BorderRadius.circular(50),
              //                 ),
              //               ),
              //               popupItemBuilder: (context, item, isSelected) {
              //                 return Container(
              //                   padding: EdgeInsets.symmetric(
              //                       horizontal: 20, vertical: 10),
              //                   child: Text(
              //                     "${item.type} ${item.cityName}",
              //                     style: TextStyle(
              //                       fontSize: 18,
              //                     ),
              //                   ),
              //                 );
              //               },
              //               itemAsString: (item) =>
              //                   "${item.type} ${item.cityName}",
              //             ),
              //           ],
              //         ),
              // ),
              // const SizedBox(height: 30),
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
                  helperText: 'Warna rumah, patokan, pesan khusu, dll.',
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
                    onPressed: () => controller.editData(
                      Get.arguments,
                      controller.recipientsName.text,
                      controller.telp.text,
                      controller.addressLabel.text,
                      controller.completeAddress.text,
                      controller.provinceId.value,
                      controller.cityId.value,
                      controller.districtId.value,
                      controller.villageId.value,
                      int.parse(controller.postalCode.text),
                      int.parse(controller.mainAddress.text),
                      controller.noteForCourier.text,
                    ),
                    child: const Text('Ubah'),
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
