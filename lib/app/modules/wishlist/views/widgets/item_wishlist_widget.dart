import 'package:customer_app/app/modules/wishlist/controllers/wishlist_controller.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemWishlist extends GetView<WishlistController> {
  ItemWishlist(this.data);
  final data;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Container(
        margin: EdgeInsets.fromLTRB(8, 0, 8, 8),
        child: Column(
          children: [
            Row(
              children: [
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
                      data.productId.name,
                      style: TextStyle(
                          color: Color(0xff919A92),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "5 Kg",
                      style: TextStyle(
                          color: Color(0xff919A92),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Rp ${formatCurrency.format(data.productId.price!)}',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
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
                    side: BorderSide(width: 2.0, color: Color(0xff16A085)),
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
    );
  }
}
