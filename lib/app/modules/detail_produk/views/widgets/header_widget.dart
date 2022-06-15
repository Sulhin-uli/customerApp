import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HeaderDetailProduk extends StatefulWidget {
  HeaderDetailProduk(this.scrollController, this.countCart, this.auth);
  final TrackingScrollController scrollController;
  final countCart, auth;

  @override
  State<HeaderDetailProduk> createState() => _HeaderDetailProdukState();
}

class _HeaderDetailProdukState extends State<HeaderDetailProduk> {
  Color? _backgroundColor;
  Color? _backgroundColorSearch;
  Color? _colorIcon;
  double? _opacity;
  double? _offset;
  final _opacityMax = 0.01;

  @override
  void initState() {
    // TODO: implement initState
    _backgroundColor = Colors.white;
    _backgroundColorSearch = Colors.grey[200];
    _colorIcon = Colors.grey;
    _opacity = 0.0;
    _offset = 0.0;

    widget.scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgroundColor,
      padding: EdgeInsets.all(8),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                _buildIconButton(
                  onPressed: () => Get.back(),
                  icon: Icons.arrow_back_sharp,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  "Detail Produk",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
            _buildIconButton(
              onPressed: () => {
                setState(() {
                  if (widget.auth == true) {
                    Get.toNamed(Routes.CART);
                  } else {
                    Get.toNamed(Routes.LOGIN);
                  }
                })
              },
              icon: Icons.shopping_cart,
              notification: (widget.auth == true) ? widget.countCart : 0,
            ),
          ],
        ),
      ),
    );
  }

  // fuction widget
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
          fillColor: _backgroundColorSearch,
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
            color: _colorIcon,
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

  void _onScroll() {
    final scrollOffset = widget.scrollController.offset;
    if (scrollOffset >= _offset! && scrollOffset > 5) {
      _opacity = double.parse((_opacity! + _opacityMax).toStringAsFixed(2));
      if (_opacity! >= 1.0) {
        _opacity = 1.0;
      }
    } else if (scrollOffset < 100) {
      _opacity = double.parse((_opacity! - _opacityMax).toStringAsFixed(2));
      if (_opacity! <= 1.0) {
        _opacity = 0.0;
      }
    }

    setState(
      () {
        if (scrollOffset <= 0) {
          _backgroundColorSearch = Colors.white;
          _colorIcon = Colors.white;
          _offset = 0.0;
          _opacity = 0.0;
          // getWindow().setStatusBarColor(0x00000000);
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
        } else {
          _backgroundColorSearch = Colors.grey[200];
          _colorIcon = Colors.grey;
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
        }
        _backgroundColor = Colors.white.withOpacity(_opacity!);
      },
    );
  }
}
