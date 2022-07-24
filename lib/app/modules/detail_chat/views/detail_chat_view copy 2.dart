// import 'package:customer_app/app/modules/detail_chat/controllers/detail_chat_controller.dart';
// import 'package:customer_app/app/modules/login/controllers/auth_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:intl/intl.dart';

// class DetailChatView extends GetView<DetailChatController> {
//   final box = GetStorage();
//   AuthController authController = Get.put(AuthController());

//   @override
//   Widget build(BuildContext context) {
//     // final user = box.read("userData") as Map<String, dynamic>;

//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0.5,
//         backgroundColor: Color(0xff16A085),
//         leadingWidth: 100,
//         leading: InkWell(
//           onTap: () {},
//           borderRadius: BorderRadius.circular(100),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               SizedBox(width: 5),
//               InkWell(
//                 onTap: () => Get.back(),
//                 child: Icon(Icons.arrow_back),
//               ),
//               SizedBox(width: 5),
//               // CircleAvatar(
//               //   radius: 25,
//               //   backgroundColor: Colors.grey,
//               //   child: Image.asset("assets/logo/noimage.png"),
//               // )
//             ],
//           ),
//         ),
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Obx(() => Text(
//             //       controller.storeName.value,
//             //       style: TextStyle(
//             //         fontSize: 18,
//             //         fontWeight: FontWeight.w600,
//             //       ),
//             //     )),
//             Text(
//               "Lorem Ipsum",
//               style: TextStyle(
//                 fontSize: 14,
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Container(
//               child: ItemChat(
//                 isSender: true,
//                 // data: data,
//               ),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(bottom: context.mediaQueryPadding.bottom),
//             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             width: Get.width,
//             height: 100,
//             color: Colors.white,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: Container(
//                     child: TextField(
//                       controller: controller.chatC,
//                       decoration: InputDecoration(
//                         // prefix: IconButton(
//                         //   onPressed: () {},
//                         //   icon: Icon(Icons.emoji_emotions_outlined),
//                         // ),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(100)),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Material(
//                   borderRadius: BorderRadius.circular(100),
//                   color: Color(0xff16A085),
//                   child: InkWell(
//                     borderRadius: BorderRadius.circular(100),
//                     onTap: () {
//                       // controller.postData(Get.arguments, controller.text.text);
//                       controller.newChat(
//                         authController.user.value.email!,
//                         Get.arguments as Map<String, dynamic>,
//                         controller.chatC.text,
//                       );
//                     },
//                     child: Padding(
//                       padding: EdgeInsets.all(16),
//                       child: Icon(
//                         Icons.send,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class ItemChat extends StatelessWidget {
//   const ItemChat({
//     Key? key,
//     required this.isSender,
//     // required this.data,
//   }) : super(key: key);
//   // final data;
//   final bool isSender;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//       child: Column(
//         crossAxisAlignment:
//             isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//                 borderRadius: isSender
//                     ? BorderRadius.only(
//                         topLeft: Radius.circular(15),
//                         topRight: Radius.circular(15),
//                         bottomLeft: Radius.circular(15))
//                     : BorderRadius.only(
//                         topLeft: Radius.circular(15),
//                         topRight: Radius.circular(15),
//                         bottomRight: Radius.circular(15)),
//                 color: isSender ? Color(0xff16A085) : Colors.grey),
//             padding: EdgeInsets.all(
//               15,
//             ),
//             child: Text(
//               // data!.text!,
//               "Lorem Ipsum",
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Text(
//             // Waktu(datetime).yMMMMEEEEd(),
//             // datetime.toString(),
//             // DateFormat("EEEE, d MMMM yyyy", "id_ID")
//             //     .format(DateTime.tryParse(data.createdAt!)!),
//             "10.00",
//           ),
//           Text("Belum dibaca",
//               style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey))
//         ],
//       ),
//       alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
//     );
//   }
// }

// // import 'package:customer_app/app/routes/app_pages.dart';
// // import 'package:flutter/material.dart';

// // import 'package:get/get.dart';

// // import '../controllers/detail_chat_controller.dart';

// // class DetailChatView extends GetView<DetailChatController> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           backgroundColor: Colors.white,
// //           leading: BackButton(color: Colors.black),
// //           title: GestureDetector(
// //             onTap: () => Get.toNamed(Routes.TOKO),
// //             child: Row(
// //               children: [
// //                 Icon(
// //                   Icons.account_circle_rounded,
// //                   color: Colors.black,
// //                 ),
// //                 const SizedBox(
// //                   width: 6,
// //                 ),
// //                 Text(
// //                   'Gapoktan',
// //                   style: TextStyle(color: Colors.black, fontSize: 16),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           actions: [
// //             IconButton(
// //                 onPressed: () {},
// //                 icon: Icon(
// //                   Icons.more_vert,
// //                   color: Colors.black,
// //                 ))
// //           ],
// //           elevation: 0.5,
// //         ),
// //         body: SingleChildScrollView(
// //           child: Column(
// //             children: [
// //               Center(
// //                 child: Container(
// //                   margin: EdgeInsets.all(16),
// //                   child: Text(
// //                     "Hari Ini",
// //                     style: TextStyle(
// //                         fontSize: 12, color: Colors.black.withOpacity(0.5)),
// //                   ),
// //                 ),
// //               ),
// //               Container(
// //                 margin: EdgeInsets.fromLTRB(50, 16, 0, 16),
// //                 height: 160.0,
// //                 width: 240.0,
// //                 color: Colors.transparent,
// //                 child: Container(
// //                   decoration: BoxDecoration(
// //                     color: Color(0xffC8FEE0),
// //                     borderRadius: BorderRadius.all(
// //                       Radius.circular(10.0),
// //                     ),
// //                   ),
// //                   child: Container(
// //                     margin: EdgeInsets.all(0),
// //                     child: Column(
// //                       children: [
// //                         ListTile(
// //                           leading: Icon(
// //                             Icons.image,
// //                             size: 80,
// //                           ),
// //                           title: Text(
// //                             'Name Product',
// //                             style: TextStyle(
// //                                 fontSize: 14,
// //                                 color: Colors.black.withOpacity(0.6)),
// //                           ),
// //                           subtitle: Text(
// //                             'Price',
// //                             style: TextStyle(
// //                                 color: Colors.black,
// //                                 fontWeight: FontWeight.bold),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ));
// //   }
// // }
