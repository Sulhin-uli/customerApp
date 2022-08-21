import 'package:customer_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:customer_app/app/modules/login/controllers/auth_controller.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Header extends StatefulWidget {
  Header(this.scrollController, this.countCart, this.countNotif, this.auth);
  final TrackingScrollController scrollController;
  final countCart, countNotif, auth;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  Color? _backgroundColor;
  Color? _backgroundColorSearch;
  Color? _colorIcon;
  double? _opacity;
  double? _offset;
  final _opacityMax = 0.01;

  @override
  void initState() {
    // TODO: implement initState
    _backgroundColor = Colors.transparent;
    _backgroundColorSearch = Colors.white;
    _colorIcon = Colors.white;
    _opacity = 0.0;
    _offset = 0.0;

    widget.scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Container(
      color: _backgroundColor,
      padding: EdgeInsets.all(8),
      child: SafeArea(
        child: Row(
          children: [
            _buildInputSearch(),
            _buildIconButton(
              // onPressed: () => Get.toNamed(Routes.CHAT),
              onPressed: () {
                AuthController authController = Get.put(AuthController());
                authController.googleLogin();
              },
              icon: Icons.mail,
              notification: 0,
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
            _buildIconButton(
              onPressed: () => {
                setState(() {
                  if (widget.auth == true) {
                    Get.toNamed(Routes.NOTIFIKASI);
                  } else {
                    Get.toNamed(Routes.LOGIN);
                  }
                })
              },
              icon: Icons.notifications,
              notification: (widget.auth == true) ? widget.countNotif : 0,
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
          // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
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
