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
            title: "Title of first page",
            body:
                "Here you can write the description of the page, to explain someting...",
            image: Container(
              width: Get.width * 0.6,
              height: Get.width * 0.6,
              child: Center(
                child: Lottie.asset("assets/lottie/main-laptop-duduk.json"),
              ),
            ),
          ),
          PageViewModel(
            title: "Title of first page",
            body:
                "Here you can write the description of the page, to explain someting...",
            image: Container(
              width: Get.width * 0.6,
              height: Get.width * 0.6,
              child: Center(
                child: Lottie.asset("assets/lottie/main-laptop-duduk.json"),
              ),
            ),
          ),
          PageViewModel(
            title: "Title of first page",
            body:
                "Here you can write the description of the page, to explain someting...",
            image: Container(
              width: Get.width * 0.6,
              height: Get.width * 0.6,
              child: Center(
                child: Lottie.asset("assets/lottie/main-laptop-duduk.json"),
              ),
            ),
          ),
          PageViewModel(
            title: "Title of first page",
            body:
                "Here you can write the description of the page, to explain someting...",
            image: Container(
              width: Get.width * 0.6,
              height: Get.width * 0.6,
              child: Center(
                child: Lottie.asset("assets/lottie/main-laptop-duduk.json"),
              ),
            ),
          ),
          PageViewModel(
            title: "Title of first page",
            body:
                "Here you can write the description of the page, to explain someting...",
            image: Container(
              width: Get.width * 0.6,
              height: Get.width * 0.6,
              child: Center(
                child: Lottie.asset("assets/lottie/main-laptop-duduk.json"),
              ),
            ),
          ),
        ],
        onDone: () => Get.offAllNamed(Routes.LOGIN),
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
