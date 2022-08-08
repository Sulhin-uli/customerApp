import 'package:customer_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:customer_app/app/modules/login/controllers/auth_controller.dart';
import 'package:customer_app/app/modules/wishlist/views/widgets/header_wishlist_widget.dart';
import 'package:customer_app/app/modules/wishlist/views/widgets/item_wishlist_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/wishlist_controller.dart';

class WishlistView extends GetView<WishlistController> {
  WishlistController wishlistC = Get.put(WishlistController());
  final authC = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final _scrollController = TrackingScrollController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SmartRefresher(
            controller: wishlistC.refreshController,
            onRefresh: wishlistC.onRefresh,
            onLoading: wishlistC.onLoading,
            enablePullDown: false,
            enablePullUp: true,
            header: WaterDropMaterialHeader(),
            footer: ClassicFooter(),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 85,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 18, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => Text(
                            controller.wishlist.length.toString() +
                                " Barang Wishlist",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "",
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
                    () => wishlistC.isLoading.isTrue
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : controller.wishlist.isEmpty
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/empty-data.svg",
                                      height: 100,
                                      width: 100,
                                    ),
                                    Text(
                                      "Data Tidak Ada",
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                              )
                            : ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: wishlistC.wishlist.length,
                                itemBuilder: (context, i) {
                                  int length = wishlistC.wishlist.length;
                                  final data = wishlistC.wishlist[i];
                                  return ItemWishlist(data);
                                  // return ItemWishlist();
                                },
                              ),
                  ),
                ],
              ),
            ),
          ),
          HeaderWishlist(
              _scrollController, Get.find<CartController>().cart.length),
        ],
      ),
    );
  }
}
