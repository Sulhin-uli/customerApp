import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_produk_controller.dart';

class DetailProdukView extends GetView<DetailProdukController> {
  // Part Scrroll
  final _scrollController = TrackingScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero(
                //   tag: "data.slug!",
                //   child: Center(
                //     child: Image.network(
                //       "https://tokoterserah.com/storage/produk/thumb/604045a76c15eBERAS%20FORTUNE%205%20KG.png",
                //       width: 300,
                //       height: 300,
                //     ),
                //   ),
                // ),
                Container(
                  width: double.infinity,
                  height: 400,
                  color: Colors.grey,
                  child: Icon(
                    Icons.image,
                    size: 200,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  margin: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rp100.000",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.favorite_border,
                        size: 30,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(16, 10, 16, 20),
                  child: Text(
                    "Name Product",
                    style: TextStyle(
                        color: Color(0xff919A92),
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 12,
                  color: Color(0xffD1D1D1),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Text(
                    "Detail Product",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Column",
                            style: TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Text(
                            "Value",
                            style: TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Color(0xff919A92),
                      ),
                      Row(
                        children: [
                          Text(
                            "Column",
                            style: TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Text(
                            "Value",
                            style: TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Color(0xff919A92),
                      ),
                      Row(
                        children: [
                          Text(
                            "Column",
                            style: TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Text(
                            "Value",
                            style: TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Color(0xff919A92),
                      ),
                      Container(
                        height: 200,
                      )
                    ],
                  ),
                )
              ],
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
                        onPressed: () => Get.toNamed(Routes.KERANJANG),
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
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: Container(
              width: double.infinity,
              height: 70,
              color: Colors.white,
              child: Container(
                child: Column(
                  children: [
                    Divider(
                      color: Color(0xff919A92),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              Icons.message,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () => Get.toNamed(Routes.PENGIRIMAN),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                width: 2.0, color: Color(0xff16A085)),
                          ),
                          child: Text(
                            'Beli Langsung',
                            style: TextStyle(
                              color: Color(0xff16A085),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Respond to button press
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff16A085), // background
                          ),
                          child: Text('Keranjang'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
              hintText: "Cari di TaniApp",
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
