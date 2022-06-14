import 'package:carousel_slider/carousel_slider.dart';
import 'package:customer_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:customer_app/app/modules/detail_produk/views/widgets/header_widget.dart';
import 'package:customer_app/app/modules/home/controllers/home_controller.dart';
import 'package:customer_app/app/modules/produk/controllers/produk_controller.dart';
import 'package:customer_app/app/modules/wishlist/controllers/wishlist_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:customer_app/app/utils/base_url.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/detail_produk_controller.dart';

class DetailProdukView extends GetView<DetailProdukController> {
  final box = GetStorage();
  final _scrollController = TrackingScrollController();
  final homeC = Get.find<HomeController>();
  final cartC = Get.find<CartController>();
  final wishlistC = Get.find<WishlistController>();

  // Part Scrroll
  @override
  Widget build(BuildContext context) {
    final data = homeC.findBySlug(Get.arguments);
    // find
    wishlistC.foundWishlist(data.id!);

    return Scaffold(
      body: Column(
        children: [
          Obx(
            () => HeaderDetailProduk(
              _scrollController,
              cartC.cart.length,
              box.read('isAuth'),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => homeC.photoProductByProductId.length == 1
                            ? Hero(
                                tag: data.slug!,
                                child: Container(
                                  height: 300.0,
                                  child: Center(
                                    // child: Image.network(
                                    //   "https://tokoterserah.com/storage/produk/thumb/604045a76c15eBERAS%20FORTUNE%205%20KG.png",
                                    //   fit: BoxFit.cover,
                                    // ),
                                    child: Image.network(
                                      baseUrlFile +
                                          "storage/produk/" +
                                          data.image!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                            : CarouselSlider(
                                options: CarouselOptions(
                                    height: 300.0,
                                    autoPlay: false,
                                    enlargeCenterPage: true,
                                    viewportFraction: 0.9,
                                    aspectRatio: 2.0,
                                    initialPage: 2,
                                    onPageChanged: (index, reason) {
                                      homeC.carouselIndex.value = index;
                                    }),
                                items: <Widget>[
                                  for (var i = 0;
                                      i < homeC.photoProductByProductId.length;
                                      i++)
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 20.0, left: 20.0),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(baseUrlFile +
                                              "storage/produk/" +
                                              homeC.photoProductByProductId[i]
                                                  .name!),
                                          fit: BoxFit.fitHeight,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(32.0),
                                      ),
                                    ),
                                ],
                              ),
                      ),
                      Center(
                        child: SizedBox(
                          height: 30,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: homeC.photoProductByProductId.length,
                              itemBuilder: (context, i) {
                                return Obx(() => homeC.carouselIndex.value == i
                                    ? Container(
                                        width: 8.0,
                                        height: 8.0,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 2.0),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xff16A085),
                                        ),
                                      )
                                    : Container(
                                        width: 8.0,
                                        height: 8.0,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 2.0),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color.fromRGBO(0, 0, 0, 0.4),
                                        ),
                                      ));
                              }),
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
                              'Rp${formatCurrency.format(data.price!)}',
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                            (box.read('isAuth') == true)
                                ? Obx(
                                    () => wishlistC.isWishlist.isFalse
                                        ? InkWell(
                                            onTap: () {
                                              wishlistC.postData(data.id);
                                              wishlistC.isWishlist.value = true;
                                            },
                                            child: Icon(
                                              Icons.favorite_border,
                                              size: 23,
                                            ),
                                          )
                                        : InkWell(
                                            onTap: () {
                                              wishlistC.deleteDatabyIdProduct(
                                                  data.id!);
                                              wishlistC.isWishlist.value =
                                                  false;
                                            },
                                            child: Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                              size: 23,
                                            ),
                                          ),
                                  )
                                : InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.LOGIN);
                                    },
                                    child: Icon(
                                      Icons.favorite_border,
                                      size: 23,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(16, 0, 16, 20),
                        child: Text(
                          data.name!,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(16, 0, 16, 20),
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                "Terjual 0",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  // color: Colors.green,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(7.0),
                                  ),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.star_rounded,
                                        color: Colors.amber,
                                      ),
                                      Text(
                                        "0.0",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("(0)")
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(flex: 5, child: Container())
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 9,
                        color: Color(0xffD1D1D1),
                      ),
                      Container(
                        margin: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(
                                Icons.account_circle_rounded,
                                size: 60,
                                color: Colors.black,
                              ),
                              title: const Text(
                                "Gapoktan",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "Indramayu ",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 16,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "4.2",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Rating dan Ulasan",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 60,
                                  child: VerticalDivider(
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    // Respond to button press
                                  },
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        width: 2.0, color: Color(0xff16A085)),
                                  ),
                                  child: Text(
                                    '     Lihat Toko    ',
                                    style: TextStyle(
                                      color: Color(0xff16A085),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 9,
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
                            Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                              style: TextStyle(
                                color: Color(0xff919A92),
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(
                              height: 70,
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
                                  onPressed: () {
                                    if (box.read('isAuth') == true) {
                                      Get.toNamed(Routes.CHAT);
                                    } else {
                                      Get.toNamed(Routes.LOGIN);
                                    }
                                  },
                                  child: Icon(
                                    Icons.message,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  if (box.read('isAuth') == true) {
                                    Get.toNamed(Routes.PENGIRIMAN);
                                  } else {
                                    Get.toNamed(Routes.LOGIN);
                                  }
                                },
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
                                  if (box.read('isAuth') == true) {
                                    cartC.postData(data.id, 1);
                                  } else {
                                    Get.toNamed(Routes.LOGIN);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xff16A085), // background
                                ),
                                child: Text('+ Keranjang'),
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
