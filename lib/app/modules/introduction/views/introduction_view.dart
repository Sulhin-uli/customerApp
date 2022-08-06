import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            // title: "Title of first page",
            title: "Hasil Tani Organik",
            body: "Menyediakan Produk Hasil Tani Organik",
            image: Container(
              width: Get.width * 0.6,
              height: Get.width * 0.6,
              child: Center(
                child: Lottie.asset("assets/lottie/phone.json"),
                // child: Lottie.network("assets/lottie/phone.json"),
              ),
            ),
          ),
          PageViewModel(
            title: "Produk Petani",
            body: "Produk Dari Petani Langsung Tanpa Tengkulak Dan Perantara",
            image: Container(
              // width: Get.width * 0.3,
              // height: Get.width * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Center(
                    child: Lottie.asset("assets/lottie/farmer.json"),
                  ),
                ],
              ),
            ),
          ),
          PageViewModel(
            title: "Beragam Produk Tani",
            body: "Beragam Produk Hasil Tani Berkualitas",
            image: Container(
              width: Get.width * 0.6,
              height: Get.width * 0.6,
              child: Center(
                child: Lottie.asset("assets/lottie/beragam.json"),
              ),
            ),
          ),
        ],
        onDone: () => Get.offAllNamed(Routes.HOME),
        // onSkip: () {},
        // showBackButton: false,
        showSkipButton: true,
        skip: Text("Skip"),
        next: Text(
          "Next",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        done:
            const Text("Mulai", style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ),
    );
  }
}
