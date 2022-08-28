// import 'dart:convert';
// import 'package:customer_app/app/data/models/city_model.dart';
// import 'package:customer_app/app/modules/ongkir/controllers/ongkir_controller.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class Kota extends GetView<OngkirController> {
//   const Kota({
//     Key? key,
//     required this.provId,
//     required this.tipe,
//   }) : super(key: key);

//   final int provId;
//   final String tipe;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 20),
//       child: DropdownSearch<City>(
//         label: tipe == "asal"
//             ? "Kota / Kabupaten Asal"
//             : "Kota / Kabupaten Tujuan",
//         showClearButton: true,
//         onFind: (String filter) async {
//           Uri url = Uri.parse(
//             "https://api.rajaongkir.com/starter/city?province=$provId",
//           );

//           try {
//             final response = await http.get(
//               url,
//               headers: {
//                 "key": "0ae702200724a396a933fa0ca4171a7e",
//               },
//             );

//             var data = json.decode(response.body) as Map<String, dynamic>;

//             var statusCode = data["rajaongkir"]["status"]["code"];

//             if (statusCode != 200) {
//               throw data["rajaongkir"]["status"]["description"];
//             }

//             var listAllCity = data["rajaongkir"]["results"] as List<dynamic>;

//             var models = City.fromJsonList(listAllCity);
//             return models;
//           } catch (err) {
//             print(err);
//             return List<City>.empty();
//           }
//         },
//         onChanged: (cityValue) {
//           if (cityValue != null) {
//             if (tipe == "asal") {
//               controller.kotaAsalId.value = int.parse(cityValue.cityId!);
//             } else {
//               controller.kotaTujuanId.value = int.parse(cityValue.cityId!);
//             }
//           } else {
//             if (tipe == "asal") {
//               print("Tidak memilih kota / kabupaten asal apapun");
//               controller.kotaAsalId.value = 0;
//             } else {
//               print("Tidak memilih kota / kabupaten tujuan apapun");
//               controller.kotaTujuanId.value = 0;
//             }
//           }
//           controller.showButton();
//         },
//         showSearchBox: true,
//         searchBoxDecoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(
//             vertical: 10,
//             horizontal: 25,
//           ),
//           hintText: "cari kota / kabupaten...",
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(50),
//           ),
//         ),
//         popupItemBuilder: (context, item, isSelected) {
//           return Container(
//             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             child: Text(
//               "${item.type} ${item.cityName}",
//               style: TextStyle(
//                 fontSize: 18,
//               ),
//             ),
//           );
//         },
//         itemAsString: (item) => "${item.type} ${item.cityName}",
//       ),
//     );
//   }
// }
