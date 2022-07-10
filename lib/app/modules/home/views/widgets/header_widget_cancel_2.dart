// import 'package:customer_app/app/modules/cart/controllers/cart_controller.dart';
// import 'package:customer_app/app/modules/home/controllers/header_controller.dart';
// import 'package:customer_app/app/routes/app_pages.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// class Header extends GetView<HeaderController> {
//   Header(this.scrollController, this.countCart, this.auth);
//   final TrackingScrollController scrollController;
//   final countCart, auth;

//   @override
//   Widget build(BuildContext context) {
//     controller.onScroll(scrollController);
//     return Container(
//       color: controller.backgroundColor,
//       padding: EdgeInsets.all(8),
//       child: SafeArea(
//         child: Row(
//           children: [
//             controller.buildInputSearch(),
//             controller.buildIconButton(
//               onPressed: () => Get.toNamed(Routes.CHAT),
//               icon: Icons.mail,
//               notification: 0,
//             ),
//             controller.buildIconButton(
//               onPressed: () => {
//                 if (auth == true)
//                   {Get.toNamed(Routes.CART)}
//                 else
//                   {Get.offAllNamed(Routes.LOGIN)}
//               },
//               icon: Icons.shopping_cart,
//               notification: (auth == true) ? countCart : 0,
//             ),
//             controller.buildIconButton(
//               onPressed: () => Get.toNamed(Routes.NOTIFIKASI),
//               icon: Icons.notifications,
//               notification: 0,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
