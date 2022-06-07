// import 'package:customer_app/app/data/models/main_menu_model.dart';
// import 'package:customer_app/app/data/viewmodels/main_menu_viewmodels.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class MainMenu extends StatelessWidget {
//   final List<MainMenuModel> _menus = MainMenuViewModel().getMainMenu();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 220,
//       margin: EdgeInsets.only(top: 35),
//       child: GridView.builder(
//         padding: EdgeInsets.symmetric(horizontal: 12),
//         scrollDirection: Axis.horizontal,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2, childAspectRatio: 1.25),
//         itemBuilder: (context, index) {
//           final MainMenuModel menu = _menus[index];
//           return Column(
//             children: [
//               Container(
//                 // color: index % 2 == 0 ? Colors.amber : Colors.red,
//                 width: 45,
//                 height: 45,
//                 child: FlatButton(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(14),
//                       side: BorderSide(color: Colors.black12)),
//                   padding: EdgeInsets.all(8),
//                   color: Colors.white,
//                   onPressed: () {},
//                   child: Image.network(
//                     menu.image!,
//                     color: menu.color!,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 11,
//               ),
//               Text(
//                 menu.title!,
//                 maxLines: 2,
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           );
//         },
//         itemCount: _menus.length,
//       ),
//     );
//   }
// }
