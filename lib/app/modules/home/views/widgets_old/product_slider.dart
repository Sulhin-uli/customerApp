// import 'dart:ui';

// import 'package:customer_app/app/data/models/product_model.dart';
// import 'package:customer_app/app/data/viewmodels/product_viewmodels.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class ProductSlider extends StatelessWidget {
//   final List<ProductModel> _product = ProductViewModel().getMainProduct();
//   @override
//   Widget build(BuildContext context) {
//     return ConstrainedBox(
//       constraints: BoxConstraints(maxHeight: 200),
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           final ProductModel product = _product[index];
//           double leftMargin = 0;
//           double rightMargin = 0;
//           if (index != _product.length - 1) {
//             leftMargin = 10;
//           } else {
//             leftMargin = 10;
//             rightMargin = 10;
//           }
//           return Container(
//             margin: EdgeInsets.only(left: leftMargin, right: rightMargin),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(8))),
//             child: Column(
//               children: <Widget>[
//                 Expanded(
//                   child: Container(
//                     width: 100,
//                     height: 200,
//                     decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: NetworkImage(product.image!),
//                         ),
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(8),
//                             topRight: Radius.circular(8))),
//                   ),
//                   flex: 75,
//                 ),
//                 Expanded(
//                   flex: 25,
//                   child: Container(
//                     padding:
//                         EdgeInsets.only(left: leftMargin, right: rightMargin),
//                     width: 100,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           product.title!,
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w400),
//                         ),
//                         SizedBox(
//                           height: 4,
//                         ),
//                         Text(
//                           "Rp. " + product.price!,
//                           style: TextStyle(
//                               color: Colors.red, fontWeight: FontWeight.bold),
//                         )
//                       ],
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(8),
//                         bottomRight: Radius.circular(8),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           );
//         },
//         itemCount: _product.length,
//       ),
//     );
//   }
// }
