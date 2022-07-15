import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff16A085),
        body: Center(
          child: Container(
            // height: Get.width * 0.7,
            // width: Get.width * 0.7,
            // child: Lottie.asset("assets/lottie/hello.json"),
            height: 130,
            width: 130,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: SvgPicture.asset(
              "assets/logo/logoTaniKula.svg",
            ),
          ),
        ),
      ),
    );
  }
}
