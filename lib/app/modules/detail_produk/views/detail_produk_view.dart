import 'package:customer_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:customer_app/app/modules/detail_produk/views/widgets/header_widget.dart';
import 'package:customer_app/app/modules/home/controllers/home_controller.dart';
import 'package:customer_app/app/modules/wishlist/controllers/wishlist_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_produk_controller.dart';

class DetailProdukView extends GetView<DetailProdukController> {
  // Part Scrroll
  @override
  Widget build(BuildContext context) {
    final _scrollController = TrackingScrollController();
    final homeC = Get.find<HomeController>();
    final cartC = Get.find<CartController>();
    final wishlistC = Get.find<WishlistController>();
    final data = homeC.findBySlug(Get.arguments);
    return Scaffold(
      body: Column(
        children: [
          Obx(() => HeaderDetailProduk(_scrollController, cartC.cart.length)),
          Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: "data.slug!",
                        child: Center(
                          child: Image.network(
                            "https://tokoterserah.com/storage/produk/thumb/604045a76c15eBERAS%20FORTUNE%205%20KG.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Container(
                      //   width: double.infinity,
                      //   height: 400,
                      //   color: Colors.grey,
                      //   child: Icon(
                      //     Icons.image,
                      //     size: 200,
                      //   ),
                      // ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        margin: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Rp ${formatCurrency.format(data.price!)}',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            // Icon(
                            //   Icons.favorite_border,
                            //   size: 30,
                            // )
                            Obx(
                              () => controller.isWishlist.isFalse
                                  ? InkWell(
                                      onTap: () {
                                        wishlistC.postData(1, data.id);
                                        controller.changeWishlist();
                                      },
                                      child: Icon(
                                        Icons.favorite_border,
                                        size: 30,
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        controller.changeWishlist();
                                      },
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                        size: 30,
                                      ),
                                    ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(16, 10, 16, 20),
                        child: Text(
                          data.name!,
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
                                  cartC.postData(1, data.id, 1);
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
