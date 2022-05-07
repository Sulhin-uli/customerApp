import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HeaderController extends GetxController {
  // late TrackingScrollController scrollController;
  Color? backgroundColor;
  Color? backgroundColorSearch;
  Color? colorIcon;
  double? opacity;
  double? offset;
  final opacityMax = 0.01;

  @override
  void onInit() {
    backgroundColor = Colors.transparent;
    backgroundColorSearch = Colors.white;
    colorIcon = Colors.white;
    opacity = 0.0;
    offset = 0.0;

    super.onInit();
  }

  scrollControllerFunc(TrackingScrollController scrollController) {
    scrollController.addListener(onScroll(scrollController));
  }

  onScroll(TrackingScrollController scrollController) {
    final scrollOffset = scrollController.offset;
    if (scrollOffset >= offset! && scrollOffset > 5) {
      opacity = double.parse((opacity! + opacityMax).toStringAsFixed(2));
      if (opacity! >= 1.0) {
        opacity = 1.0;
      }
    } else if (scrollOffset < 100) {
      opacity = double.parse((opacity! - opacityMax).toStringAsFixed(2));
      if (opacity! <= 1.0) {
        opacity = 0.0;
      }
    }

    if (scrollOffset <= 0) {
      backgroundColorSearch = Colors.white;
      colorIcon = Colors.white;
      offset = 0.0;
      opacity = 0.0;
      // getWindow().setStatusBarColor(0x00000000);
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    } else {
      backgroundColorSearch = Colors.grey[200];
      colorIcon = Colors.grey;
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    }

    backgroundColor = Colors.white.withOpacity(opacity!);
  }
}
