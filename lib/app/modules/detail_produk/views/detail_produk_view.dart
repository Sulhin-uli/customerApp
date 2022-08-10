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
import 'package:givestarreviews/givestarreviews.dart';

import '../controllers/detail_produk_controller.dart';

class DetailProdukView extends GetView<DetailProdukController> {
  final box = GetStorage();
  final _scrollController = TrackingScrollController();
  final produkC = Get.find<ProdukController>();
  final cartC = Get.find<CartController>();
  final wishlistC = Get.find<WishlistController>();

  // Part Scrroll
  @override
  Widget build(BuildContext context) {
    final data = produkC.findBySlug(Get.arguments[0], Get.arguments[1]);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // // find
      wishlistC.foundWishlist(data.id!);
      controller.ulasanController.countRating(data.id!);
    });

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
                        () => produkC.photoProduct.length == 1
                            ? Hero(
                                tag: data.slug!,
                                child: Container(
                                  height: 370.0,
                                  child: Center(
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
                                    height: 370.0,
                                    autoPlay: false,
                                    enlargeCenterPage: true,
                                    viewportFraction: 0.9,
                                    aspectRatio: 2.0,
                                    reverse: false,
                                    initialPage: 2,
                                    onPageChanged: (index, reason) {
                                      produkC.carouselIndex.value = index;
                                    }),
                                items: <Widget>[
                                  for (var i = 0;
                                      i < produkC.photoProduct.length;
                                      i++)
                                    if (produkC.photoProduct[i].productId!.id ==
                                        data.id)
                                      InkWell(
                                        onTap: () => Get.toNamed(
                                            Routes.IMAGE_VIEW,
                                            arguments:
                                                produkC.photoProduct[i].name!),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(baseUrlFile +
                                                  "storage/produk/" +
                                                  produkC
                                                      .photoProduct[i].name!),
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                      )
                                ],
                              ),
                      ),
                      Center(
                        child: SizedBox(
                          height: 30,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: produkC.photoProduct
                                  .where((e) => e.productId!.id == data.id)
                                  .length,
                              itemBuilder: (context, i) {
                                return Obx(
                                    () => produkC.carouselIndex.value == i
                                        ? Container(
                                            width: 8.0,
                                            height: 8.0,
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 10.0,
                                                horizontal: 2.0),
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff16A085),
                                            ),
                                          )
                                        : Container(
                                            width: 8.0,
                                            height: 8.0,
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 10.0,
                                                horizontal: 2.0),
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.4),
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
                            (data.stockOut == null)
                                ? Container(
                                    child: Text(
                                      "Terjual 0",
                                      // "Terjual " + stock.toString(),
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  )
                                : Container(
                                    child: Text(
                                      "Terjual " + data.stockOut.toString(),
                                      // "Terjual " + stock.toString(),
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
                                      Obx(() => Text(
                                            // "0.0",
                                            controller.ulasanController
                                                .starsRatedResult.value,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Obx(() => Text("(" +
                                          controller.ulasanController
                                              .starsRatedLength.value +
                                          ")")),
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
                        color: Color.fromARGB(255, 245, 245, 245),
                      ),
                      Container(
                        margin: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            // ListTile(
                            //   leading: Icon(
                            //     Icons.store,
                            //     size: 60,
                            //     color: Colors.green,
                            //   ),
                            //   title: Text(
                            //     data.userId!.name!,
                            //     style: TextStyle(
                            //         fontSize: 16, fontWeight: FontWeight.bold),
                            //   ),
                            //   // subtitle: Text(
                            //   //   ,
                            //   //   style: TextStyle(
                            //   //       fontSize: 14,
                            //   //       color: Colors.black.withOpacity(0.5)),
                            //   // ),
                            // ),
                            // const SizedBox(
                            //   width: 20,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.store,
                                          color: Colors.green,
                                          size: 16,
                                        ),
                                        // Icon(
                                        //   Icons.star,
                                        //   color: Colors.amber,
                                        //   size: 16,
                                        // ),
                                        // const SizedBox(
                                        //   width: 5,
                                        // ),
                                        // Text(
                                        //   "4.2",
                                        //   style: TextStyle(
                                        //     fontSize: 12,
                                        //     color:
                                        //         Colors.black.withOpacity(0.5),
                                        //   ),
                                        // )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    // Text(
                                    //   "Rating dan Ulasan",
                                    //   style: TextStyle(
                                    //     fontSize: 12,
                                    //     color: Colors.black.withOpacity(0.5),
                                    //   ),
                                    // ),
                                    Text(
                                      data.userId!.name!,
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
                                    produkC.runDetailToko(
                                        data.userId!.id!, data.userId!.name!);
                                  },
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        width: 2.0, color: Color(0xff16A085)),
                                  ),
                                  child: Text(
                                    '     Detail Toko    ',
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
                        color: Color.fromARGB(255, 245, 245, 245),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                        child: Text(
                          "Deskripsi Produk",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(left: 16, right: 16, bottom: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const SizedBox(
                                  width: 80,
                                  child: Text(
                                    "Etalase",
                                    style: TextStyle(
                                      color: Color(0xff919A92),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 50,
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    data.categoryProductId!.name!,
                                    style: const TextStyle(
                                      color: Color(0xff919A92),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              color: Color(0xff919A92),
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 80,
                                  child: Text(
                                    "Stok",
                                    style: TextStyle(
                                      color: Color(0xff919A92),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 50,
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    data.stoke!.toString(),
                                    style: const TextStyle(
                                      color: Color(0xff919A92),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              color: Color(0xff919A92),
                            ),
                            Text(
                              // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                              data.desc!,
                              style: TextStyle(
                                color: Color(0xff919A92),
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 9,
                        color: Color.fromARGB(255, 245, 245, 245),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Ulasan Pembeli",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.toNamed(Routes.ALL_ULASAN,
                                      arguments: data.id);
                                },
                                child: Text(
                                  "Lihat Semua",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff16A085),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Obx(() => controller.ulasanController.review.isEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text("Belum Ada Ulasan"),
                            )
                          : ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Row(
                                    children: [
                                      StarRating(
                                        value: int.parse(controller
                                            .ulasanController.review
                                            .firstWhere(
                                                (e) => e.productId == data.id)
                                            .starsRated!),
                                        size: 16,
                                      ),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      Text(
                                        "oleh",
                                        style: TextStyle(fontSize: 13),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        controller.ulasanController.review
                                            .firstWhere(
                                                (e) => e.productId == data.id)
                                            .user!
                                            .name!,
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    controller.ulasanController.review
                                        .firstWhere(
                                            (e) => e.productId == data.id)
                                        .review!,
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            )),
                      SizedBox(
                        height: 70,
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
                                      Get.toNamed(Routes.DETAIL_CHAT,
                                          arguments: data.userId!.id!);
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
                                    if (cartC.cart
                                        .where(
                                            (e) => e.productId!.id! == data.id)
                                        .isEmpty) {
                                      cartC.postData(data.id, 1);
                                      // print("false");
                                    } else {
                                      print("true");
                                      int idCart = cartC.cart
                                          .where((e) =>
                                              e.productId!.id! == data.id)
                                          .first
                                          .id!;
                                      int cartQty = cartC.cart
                                          .where((e) =>
                                              e.productId!.id! == data.id)
                                          .first
                                          .productQty!;
                                      cartC.updateQty(idCart, cartQty + 1);
                                      dialogSuccess(
                                          "Berhasil ditambahkan keranjang");
                                    }
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
