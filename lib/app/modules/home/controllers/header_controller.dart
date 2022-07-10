import 'package:customer_app/app/routes/app_pages.dart';
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

  // scrollControllerFunc(TrackingScrollController scrollController) {
  //   scrollController.addListener(onScroll(scrollController));
  // }

  // onScroll(TrackingScrollController scrollController) {
  //   final scrollOffset = scrollController.offset;
  //   if (scrollOffset >= offset! && scrollOffset > 5) {
  //     opacity = double.parse((opacity! + opacityMax).toStringAsFixed(2));
  //     if (opacity! >= 1.0) {
  //       opacity = 1.0;
  //     }
  //   } else if (scrollOffset < 100) {
  //     opacity = double.parse((opacity! - opacityMax).toStringAsFixed(2));
  //     if (opacity! <= 1.0) {
  //       opacity = 0.0;
  //     }
  //   }

  //   if (scrollOffset <= 0) {
  //     backgroundColorSearch = Colors.white;
  //     colorIcon = Colors.white;
  //     offset = 0.0;
  //     opacity = 0.0;
  //     // getWindow().setStatusBarColor(0x00000000);
  //     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  //   } else {
  //     backgroundColorSearch = Colors.grey[200];
  //     colorIcon = Colors.grey;
  //     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  //   }

  //   backgroundColor = Colors.white.withOpacity(opacity!);
  // }

  void onScroll(TrackingScrollController scrollController) {
    scrollController.addListener(
      () {
        if (scrollController.offset >= offset! && scrollController.offset > 5) {
          opacity = double.parse((opacity! + opacityMax).toStringAsFixed(2));
          if (opacity! >= 1.0) {
            opacity = 1.0;
          }
        } else if (scrollController.offset < 100) {
          opacity = double.parse((opacity! - opacityMax).toStringAsFixed(2));
          if (opacity! <= 1.0) {
            opacity = 0.0;
          }
        }

        if (scrollController.offset <= 0) {
          backgroundColorSearch = Colors.white;
          colorIcon = Colors.white;
          offset = 0.0;
          opacity = 0.0;
          // getWindow().setStatusBarColor(0x00000000);
          // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
        } else {
          backgroundColorSearch = Colors.grey[200];
          colorIcon = Colors.grey;
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
        }

        backgroundColor = Colors.white.withOpacity(opacity!);
      },
    );
  }

  // void onScroll(TrackingScrollController scrollController) {
  //   final scrollOffset = scrollController.offset;
  // }

  // fuction widget
  buildInputSearch() {
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
      child: TextField(
        cursorColor: Colors.black,
        onTap: () => Get.toNamed(Routes.SEARCH),
        readOnly: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(4),
          isDense: true,
          enabledBorder: border,
          focusedBorder: border,
          hintText: "Cari di TaniKula",
          hintStyle: TextStyle(fontSize: 14, color: Color(0xff919A92)),
          prefixIcon: Icon(
            Icons.search,
            color: Color(0xff919A92),
          ),
          prefixIconConstraints: sizeIcon,
          suffixIconConstraints: sizeIcon,
          filled: true,
          fillColor: backgroundColorSearch,
        ),
      ),
    );
  }

  // Icon
  buildIconButton({
    VoidCallback? onPressed,
    IconData? icon,
    int notification = 0,
  }) =>
      Stack(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(icon),
            color: colorIcon,
            iconSize: 21,
          ),
          notification == 0
              ? SizedBox()
              : Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.red),
                    ),
                    constraints: BoxConstraints(minWidth: 22, minHeight: 22),
                    child: Text(
                      "$notification",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
        ],
      );
}
