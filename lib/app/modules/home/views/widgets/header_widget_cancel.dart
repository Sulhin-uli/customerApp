// import 'package:customer_app/app/modules/home/controllers/header_controller.dart';
// import 'package:customer_app/app/modules/home/controllers/home_controller.dart';
// import 'package:customer_app/app/routes/app_pages.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// class Header extends GetView<HomeController> {
//   Header(this.scrollController, this.countCart, this.auth);
//   final countCart, auth;
//   final TrackingScrollController scrollController;

//   // final headerC = Get.put(HeaderController());

//   // Color? _backgroundColor;
//   // Color? _backgroundColorSearch;
//   // Color? _colorIcon;
//   // double? _opacity;
//   // double? _offset;
//   // final _opacityMax = 0.01;

//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   _backgroundColor = Colors.transparent;
//   //   _backgroundColorSearch = Colors.white;
//   //   _colorIcon = Colors.white;
//   //   _opacity = 0.0;
//   //   _offset = 0.0;

//   //   widget.scrollController.addListener(_onScroll);
//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
//     // headerC.scrollControllerFunc(scrollController);
//     return Container(
//       color: headerC.backgroundColor,
//       padding: EdgeInsets.all(8),
//       child: SafeArea(
//         child: Row(
//           children: [
//             _buildInputSearch(),
//             _buildIconButton(
//               onPressed: () => Get.toNamed(Routes.CHAT),
//               icon: Icons.mail,
//               notification: 9,
//             ),
//             _buildIconButton(
//               onPressed: () {
//                 if (auth == true) {
//                   Get.toNamed(Routes.CART);
//                 } else {
//                   Get.toNamed(Routes.LOGIN);
//                 }
//               },
//               icon: Icons.shopping_cart,
//               notification: countCart,
//             ),
//             _buildIconButton(
//               onPressed: () => Get.toNamed(Routes.NOTIFIKASI),
//               icon: Icons.notifications,
//               notification: 3,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // fuction widget
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
//       child: TextField(
//         cursorColor: Colors.black,
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.all(4),
//           isDense: true,
//           enabledBorder: border,
//           focusedBorder: border,
//           hintText: "Cari di TaniKula",
//           hintStyle: TextStyle(fontSize: 14, color: Color(0xff919A92)),
//           prefixIcon: Icon(
//             Icons.search,
//             color: Color(0xff919A92),
//           ),
//           prefixIconConstraints: sizeIcon,
//           suffixIconConstraints: sizeIcon,
//           filled: true,
//           fillColor: headerC.backgroundColorSearch,
//         ),
//       ),
//     );
//   }

//   // Icon
//   _buildIconButton({
//     VoidCallback? onPressed,
//     IconData? icon,
//     int notification = 0,
//   }) =>
//       Stack(
//         children: [
//           IconButton(
//             onPressed: onPressed,
//             icon: Icon(icon),
//             color: headerC.colorIcon,
//             iconSize: 21,
//           ),
//           notification == 0
//               ? SizedBox()
//               : Positioned(
//                   right: 0,
//                   child: Container(
//                     padding: EdgeInsets.all(2),
//                     decoration: BoxDecoration(
//                       color: Colors.red,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: Colors.red),
//                     ),
//                     constraints: BoxConstraints(minWidth: 22, minHeight: 22),
//                     child: Text(
//                       "$notification",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 11,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 )
//         ],
//       );
// }
