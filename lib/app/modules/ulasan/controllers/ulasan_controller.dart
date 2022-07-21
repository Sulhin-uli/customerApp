import 'package:customer_app/app/data/models/review_model.dart';
import 'package:customer_app/app/data/providers/review_provider.dart';
import 'package:customer_app/app/modules/riwayat_pemesanan/controllers/riwayat_pemesanan_controller.dart';
import 'package:customer_app/app/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UlasanController extends GetxController {
  RiwayatPemesananController riwayatPemesananController =
      Get.put(RiwayatPemesananController());
  late TextEditingController ulasanController;
  var starsRated = 0.obs;
  var starsRatedResult = ''.obs;
  var starsRatedLength = ''.obs;
  // var starsRatedProduk = 0.obs;
  var review = List<Review>.empty().obs;

  @override
  void onInit() {
    getData();
    ulasanController = TextEditingController();
  }

  void getData() async {
    ReviewProvider().getData().then((response) {
      for (var e in response["data"]) {
        final data = Review.fromJson(e as Map<String, dynamic>);
        review.add(data);
        // print(review.length);
      }
    });
  }

  void countRating(int idProduct) {
    // var reviewLength =
    //     review.where((e) => e.productId == idProduct).toList().length;

    // review.where((e) => e.productId == idProduct).map((e) {
    //   // starsRatedProduk.value =
    //   print(e.starsRated);
    //   //     starsRatedProduk.value + int.parse(e.starsRated!);
    // });

    // // double result = reviewLength.toDouble() / starsRatedProduk.value.toDouble();
    // // starsRatedResult.value = result.toString();
    // print(reviewLength);
    // print(starsRatedResult.value);
    ReviewProvider().starRated(idProduct).then((response) {
      starsRatedResult.value = response["rate"].toString();
      starsRatedLength.value = response["length"].toString();
      // print(response["length"]);
    });
  }

  final box = GetStorage();

  void addData(
      int orderId, String productId, int starsRated, String reviewText) {
    final data = box.read("userData") as Map<String, dynamic>;

    ReviewProvider()
        .postData(data["id"], orderId, productId, starsRated, reviewText,
            data["token"])
        .then((response) {
      final data = Review.fromJson(response["data"] as Map<String, dynamic>);
      review.add(data);
      Get.back();
      dialogSuccess("Produk Berhasil diberi Ulasan");
    });
  }
}
