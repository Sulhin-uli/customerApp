// import 'package:customer_app/app/routes/app_pages.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// import '../controllers/produk_controller.dart';

// class ProdukView extends GetView<ProdukController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 children: [
//                   Container(
//                     height: 60,
//                     width: double.infinity,
//                     color: Colors.white,
//                   ),
//                   GridView.builder(
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2, childAspectRatio: 1 / 1.2),
//                     itemCount: 11,
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemBuilder: (context, index) {
//                       // final product = productList[index];
//                       return GestureDetector(
//                         // onTap: () => Get.toNamed(Routes.DETAIL_EDUKASI),
//                         onTap: () {},
//                         child: Card(
//                           clipBehavior: Clip.antiAlias,
//                           child: Column(
//                             children: [
//                               Expanded(
//                                 child: Hero(
//                                     tag: 'judul',
//                                     child: Center(
//                                       child: Image.network(
//                                         "https://tokoterserah.com/storage/produk/thumb/604045a76c15eBERAS%20FORTUNE%205%20KG.png",
//                                         // fit: BoxFit.cover,
//                                       ),
//                                     )),
//                               ),
//                               ListTile(
//                                 title: Text(
//                                   "Name Product",
//                                   style: TextStyle(
//                                       color: Color(0xff919A92),
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w400),
//                                 ),
//                                 subtitle: Text(
//                                   "Rp. 100.000",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                       ;
//                     },
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             color: Colors.white,
//             margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
//             child: SafeArea(
//               child: Row(
//                 children: [
//                   _buildInputSearch(),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // fuction widget
//   // Input
//   _buildInputSearch() {
//     final sizeIcon = BoxConstraints(minWidth: 35, minHeight: 35);
//     final border = OutlineInputBorder(
//       borderSide: const BorderSide(
//         color: Colors.transparent,
//         width: 0,
//       ),
//       borderRadius: const BorderRadius.all(
//         const Radius.circular(4.0),
//       ),
//     );
//     return Expanded(
//       child: Container(
//         margin: EdgeInsets.all(16),
//         child: TextField(
//           cursorColor: Colors.black,
//           decoration: InputDecoration(
//               contentPadding: EdgeInsets.all(4),
//               isDense: true,
//               enabledBorder: border,
//               focusedBorder: border,
//               hintText: "Cari di TaniApp",
//               hintStyle: TextStyle(fontSize: 14, color: Color(0xff919A92)),
//               prefixIcon: Icon(
//                 Icons.search,
//                 color: Color(0xff919A92),
//               ),
//               prefixIconConstraints: sizeIcon,
//               suffixIconConstraints: sizeIcon,
//               filled: true,
//               fillColor: Color(0xffF0F3F8)),
//         ),
//       ),
//     );
//   }
// }
