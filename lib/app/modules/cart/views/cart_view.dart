import 'package:customer_app/app/modules/cart/views/widgets/item_cart_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: Text(
          'Keranjang',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(
        //       Icons.favorite_border,
        //       size: 24,
        //       color: Colors.black,
        //     ),
        //   ),
        // ],
        elevation: 0.5,
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(3.0),
          child: controller.cart.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: controller.cart.length,
                  itemBuilder: (context, i) {
                    int length = controller.cart.length;
                    final data = controller.cart[i];
                    return ItemCart(data);
                  },
                ),
        ),
      ),
    );
  }
}
