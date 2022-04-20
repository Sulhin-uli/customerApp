import 'package:customer_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:customer_app/app/modules/wishlist/views/widgets/header_wishlist_widget.dart';
import 'package:customer_app/app/modules/wishlist/views/widgets/item_wishlist_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/wishlist_controller.dart';

class WishlistView extends GetView<WishlistController> {
  final wishlistC = Get.find<WishlistController>();

  @override
  Widget build(BuildContext context) {
    final _scrollController = TrackingScrollController();

    return Scaffold(
      body: Column(
        children: [
          HeaderWishlist(
              _scrollController, Get.find<CartController>().cart.length),
          Container(
            margin: EdgeInsets.only(left: 8, right: 8),
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
          Obx(
            () => wishlistC.wishlist.isEmpty
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, i) {
                      int length = wishlistC.wishlist.length;
                      final data = wishlistC.wishlist[i];
                      return ItemWishlist(data);
                    },
                  ),
          )
        ],
      ),
    );
  }
}
