import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/wishlist_controller.dart';

class WishlistView extends GetView<WishlistController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  height: 60,
                  width: double.infinity,
                  color: Colors.white,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "1 Barang Wishlist",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Atur",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff16A085),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    margin: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.image,
                              size: 100,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name Product",
                                  style: TextStyle(
                                      color: Color(0xff919A92),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "Size Kg",
                                  style: TextStyle(
                                      color: Color(0xff919A92),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "Rp. 100.000",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              // color: index % 2 == 0 ? Colors.amber : Colors.red,
                              width: 45,
                              height: 45,
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                    side: BorderSide(color: Colors.black12)),
                                padding: EdgeInsets.all(8),
                                color: Colors.white,
                                onPressed: () {},
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                    width: 2.0, color: Color(0xff16A085)),
                              ),
                              child: Text(
                                '        Beli Langsung      ',
                                style: TextStyle(
                                  color: Color(0xff16A085),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            Container(
              color: Colors.white,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: SafeArea(
                child: Row(
                  children: [
                    _buildInputSearch(),
                    _buildIconButton(
                      onPressed: () {},
                      icon: Icons.mail,
                      notification: 9,
                    ),
                    _buildIconButton(
                      onPressed: () {},
                      icon: Icons.shopping_cart,
                      notification: 20,
                    ),
                    _buildIconButton(
                      onPressed: () {},
                      icon: Icons.notifications,
                      notification: 3,
                    ),
                  ],
                ),
              ),
            ),
            // Divider(
            //   color: Color(0xff919A92),
            // ),
          ],
        ),
      ],
    ));
  }

  // fuction widget
  // Input
  _buildInputSearch() {
    final sizeIcon = BoxConstraints(minWidth: 35, minHeight: 35);
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent,
        width: 0,
      ),
      borderRadius: const BorderRadius.all(
        const Radius.circular(4.0),
      ),
    );
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 8),
        child: TextField(
          cursorColor: Colors.black,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(4),
              isDense: true,
              enabledBorder: border,
              focusedBorder: border,
              hintText: "Cari di TaniKula",
              hintStyle: TextStyle(fontSize: 14, color: Color(0xff919A92)),
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xff919A92),
              ),
              prefixIconConstraints: sizeIcon,
              suffixIconConstraints: sizeIcon,
              filled: true,
              fillColor: Color(0xffF0F3F8)),
        ),
      ),
    );
  }

  // Icon
  _buildIconButton({
    VoidCallback? onPressed,
    IconData? icon,
    int notification = 0,
  }) =>
      Stack(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(icon),
            color: Colors.black,
            iconSize: 24,
          ),
          notification == 0
              ? SizedBox()
              : Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Color(0xff16A085),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white),
                    ),
                    constraints: BoxConstraints(minWidth: 22, minHeight: 22),
                    child: Text(
                      "$notification",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
        ],
      );
}
