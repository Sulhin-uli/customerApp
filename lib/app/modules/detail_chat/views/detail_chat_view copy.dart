// import 'package:customer_app/app/routes/app_pages.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// import '../controllers/detail_chat_controller.dart';

// class DetailChatView extends GetView<DetailChatController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           leading: BackButton(color: Colors.black),
//           title: GestureDetector(
//             onTap: () => Get.toNamed(Routes.TOKO),
//             child: Row(
//               children: [
//                 Icon(
//                   Icons.account_circle_rounded,
//                   color: Colors.black,
//                 ),
//                 const SizedBox(
//                   width: 6,
//                 ),
//                 Text(
//                   'Gapoktan',
//                   style: TextStyle(color: Colors.black, fontSize: 16),
//                 ),
//               ],
//             ),
//           ),
//           actions: [
//             IconButton(
//                 onPressed: () {},
//                 icon: Icon(
//                   Icons.more_vert,
//                   color: Colors.black,
//                 ))
//           ],
//           elevation: 0.5,
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Center(
//                 child: Container(
//                   margin: EdgeInsets.all(16),
//                   child: Text(
//                     "Hari Ini",
//                     style: TextStyle(
//                         fontSize: 12, color: Colors.black.withOpacity(0.5)),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.fromLTRB(50, 16, 0, 16),
//                 height: 160.0,
//                 width: 240.0,
//                 color: Colors.transparent,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Color(0xffC8FEE0),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10.0),
//                     ),
//                   ),
//                   child: Container(
//                     margin: EdgeInsets.all(0),
//                     child: Column(
//                       children: [
//                         ListTile(
//                           leading: Icon(
//                             Icons.image,
//                             size: 80,
//                           ),
//                           title: Text(
//                             'Name Product',
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.black.withOpacity(0.6)),
//                           ),
//                           subtitle: Text(
//                             'Price',
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
