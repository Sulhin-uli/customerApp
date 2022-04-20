// import 'package:customer_app/app/modules/cart/controllers/cart_controller.dart';
// import 'package:customer_app/app/modules/cart/views/widgets/item_cart_widget.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// class CartView extends GetView<CartController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: BackButton(color: Colors.black),
//         title: Text(
//           'Keranjang',
//           style: TextStyle(color: Colors.black, fontSize: 16),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.favorite_border,
//               size: 24,
//               color: Colors.black,
//             ),
//           ),
//         ],
//         elevation: 0.5,
//       ),
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   height: 60,
//                   width: double.infinity,
//                   color: Colors.white,
//                 ),
//                 Container(
//                   child: Obx(
//                     () => Padding(
//                       padding: const EdgeInsets.all(3.0),
//                       child: controller.cart.isEmpty
//                           ? Center(
//                               child: CircularProgressIndicator(),
//                             )
//                           : ListView.builder(
//                               itemCount: controller.cart.length,
//                               itemBuilder: (context, i) {
//                                 int length = controller.cart.length;
//                                 final data = controller.cart[length - 1 - i];
//                                 return ItemCart();
//                               },
//                             ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Column(
//             children: [
//               Container(
//                 height: 60,
//                 width: double.infinity,
//                 color: Colors.white,
//                 child: Container(
//                   margin: EdgeInsets.all(16),
//                   child: Row(
//                     children: [
//                       Icon(Icons.crop_square_rounded),
//                       const SizedBox(
//                         width: 7,
//                       ),
//                       Text(
//                         "Pilih Semua",
//                         style: TextStyle(
//                           color: Color(0xff919A92),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Divider(
//                 color: Color(0xff919A92),
//               ),
//             ],
//           ),
//           Positioned(
//             bottom: 0,
//             width: MediaQuery.of(context).size.width,
//             child: Container(
//               width: double.infinity,
//               height: 70,
//               color: Colors.white,
//               child: Container(
//                 child: Column(
//                   children: [
//                     Divider(
//                       color: Color(0xff919A92),
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(right: 16, left: 16),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Total",
//                                 style: TextStyle(
//                                   color: Color(0xff919A92),
//                                 ),
//                               ),
//                               Text("-")
//                             ],
//                           ),
//                           ElevatedButton(
//                             onPressed: () {
//                               // Respond to button press
//                             },
//                             style: ElevatedButton.styleFrom(
//                               primary: Color(0xff16A085), // background
//                             ),
//                             child: Text('Beli (0)'),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
