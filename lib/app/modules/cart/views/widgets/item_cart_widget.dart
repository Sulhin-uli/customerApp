import 'package:customer_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemCart extends GetView<CartController> {
  ItemCart(this.data);
  final data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 230,
          color: Colors.white,
          child: Container(
            margin: EdgeInsets.fromLTRB(24, 16, 16, 16),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.crop_square_rounded),
                  title: Text('Gapoktan'),
                  subtitle: Text(
                    'Kabupaten Indramayu',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.crop_square_rounded),
                  title: Row(
                    children: [
                      // Icon(
                      //   Icons.image,
                      //   size: 100,
                      // ),
                      Container(
                        height: 100,
                        width: 100,
                        child: Image.network(
                            "https://tokoterserah.com/storage/produk/thumb/604045a76c15eBERAS%20FORTUNE%205%20KG.png",
                            fit: BoxFit.cover),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data!.productId.name,
                            style: TextStyle(
                                color: Color(0xff919A92),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "5k Kg",
                            style: TextStyle(
                                color: Color(0xff919A92),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Rp ${formatCurrency.format(data.productId.price!)}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 12,
          color: Color(0xffD1D1D1),
        ),
      ],
    );
  }
}
