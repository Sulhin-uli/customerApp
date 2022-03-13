import 'package:customer_app/app/modules/home/views/widgets/banner_slider.dart';
import 'package:customer_app/app/modules/home/views/widgets/header.dart';
import 'package:customer_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // Part Scrroll
    final _scrollController = TrackingScrollController();

    return Scaffold(
        bottomNavigationBar: buildBottomNavigationMenu(context, controller),
        body: Obx(
          () => IndexedStack(
            index: controller.tabIndex.value,
            children: [
              Stack(
                children: [
                  Container(
                    height: 150.0,
                    decoration: new BoxDecoration(
                      color: Color(0xff16A085),
                      borderRadius: new BorderRadius.vertical(
                        bottom: new Radius.elliptical(
                            MediaQuery.of(context).size.width, 100.0),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 120,
                        ),
                        Container(
                          height: 130,
                          width: 400,
                          margin: EdgeInsets.all(16),
                          child: Card(
                            color: Colors.grey,
                            clipBehavior: Clip.antiAlias,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 220,
                          child: GridView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            scrollDirection: Axis.horizontal,
                            itemCount: 8,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 1.25),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    // color: index % 2 == 0 ? Colors.amber : Colors.red,
                                    width: 45,
                                    height: 45,
                                    child: FlatButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          side: BorderSide(
                                              color: Colors.black12)),
                                      padding: EdgeInsets.all(8),
                                      color: Colors.white,
                                      onPressed: () {},
                                      child: Image.network(
                                        "https://cdn.icon-icons.com/icons2/3361/PNG/512/preferences_user_interface_ux_apps_grid_options_ui_menu_categories_icon_210806.png",
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 11,
                                  ),
                                  Text(
                                    "Menu Title",
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xff919A92)),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Title",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextButton(
                                  onPressed: () {},
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
                        Stack(
                          children: [
                            Container(
                              height: 250,
                              width: double.infinity,
                              color: Color(0xff16A085),
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: 220,
                              ),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 8,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.fromLTRB(15, 16, 5, 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: Column(
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            width: 130,
                                            height: 200,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      "https://tokoterserah.com/storage/produk/thumb/604045a76c15eBERAS%20FORTUNE%205%20KG.png"),
                                                ),
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(8),
                                                    topRight:
                                                        Radius.circular(8))),
                                          ),
                                          flex: 75,
                                        ),
                                        Expanded(
                                          flex: 25,
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10),
                                            width: 130,
                                            height: 220,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                  "Name Product",
                                                  style: TextStyle(
                                                      color: Color(0xff919A92),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                  "Rp. 100.000",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(8),
                                                bottomRight: Radius.circular(8),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    child: SafeArea(
                      child: Row(
                        children: [
                          _buildInputSearch(),
                          _buildIconButton(
                            onPressed: () => Get.toNamed(Routes.LOGIN),
                            icon: Icons.mail,
                            notification: 9,
                          ),
                          _buildIconButton(
                            onPressed: () {},
                            icon: Icons.shopping_cart,
                            notification: 20,
                          ),
                          _buildIconButton(
                            onPressed: () {},
                            icon: Icons.notifications,
                            notification: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
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
      child: TextField(
        cursorColor: Colors.black,
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
            fillColor: Colors.white),
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
            color: Colors.white,
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

  // Tabbar Bottom
  final TextStyle unselectedLabelStyle = TextStyle(
    color: Colors.white.withOpacity(0.5),
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
  final TextStyle selectedLabelStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 54,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
            unselectedItemColor: Colors.grey,
            selectedItemColor: Color(0xff16A085),
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.home,
                    size: 20.0,
                  ),
                ),
                label: 'Home',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.search,
                    size: 20.0,
                  ),
                ),
                label: 'Home',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.location_history,
                    size: 20.0,
                  ),
                ),
                label: 'Home',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.settings,
                    size: 20.0,
                  ),
                ),
                label: 'Home',
                backgroundColor: Colors.white,
              ),
            ],
          ),
        )));
  }
}
