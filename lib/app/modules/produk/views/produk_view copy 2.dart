// import 'package:customer_app/app/modules/cart/controllers/cart_controller.dart';
// import 'package:customer_app/app/modules/home/controllers/home_controller.dart';
// import 'package:customer_app/app/modules/produk/views/widgets/item_product_widget.dart';
// import 'package:customer_app/app/modules/wishlist/views/widgets/header_wishlist_widget.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// import '../controllers/produk_controller.dart';

// class ProdukView extends GetView<ProdukController> {
//   final _scrollController = TrackingScrollController();

//   final productC = Get.find<HomeController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             controller: _scrollController,
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 50,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Obx(
//                     () => productC.product.isEmpty
//                         ? Center(
//                             child: CircularProgressIndicator(),
//                           )
//                         : GridView.builder(
//                             gridDelegate:
//                                 const SliverGridDelegateWithFixedCrossAxisCount(
//                                     crossAxisCount: 2,
//                                     childAspectRatio: 1 / 1.2),
//                             itemCount: productC.product.length,
//                             shrinkWrap: true,
//                             physics: const NeverScrollableScrollPhysics(),
//                             itemBuilder: (context, i) {
//                               // final product = productList[index];
//                               int length = productC.product.length;
//                               final data = productC.product[i];
//                               return ItemProduct(data);
//                             },
//                           ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           HeaderWishlist(
//               _scrollController, Get.find<CartController>().cart.length),
//         ],
//       ),
//     );
//   }
// }
