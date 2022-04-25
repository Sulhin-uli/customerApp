import 'package:customer_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Menu extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: Obx(
        () => controller.menu.isEmpty
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 12),
                scrollDirection: Axis.horizontal,
                itemCount: controller.menu.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.25),
                itemBuilder: (context, index) {
                  final data = controller.menu[index];
                  return Column(
                    children: [
                      Container(
                        // color: index % 2 == 0 ? Colors.amber : Colors.red,
                        width: 37,
                        height: 37,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                              side: BorderSide(color: Colors.black12)),
                          padding: EdgeInsets.all(8),
                          color: Colors.white,
                          onPressed: () {},
                          child: Image.network(
                            "https://cdn.icon-icons.com/icons2/3361/PNG/512/preferences_user_interface_ux_apps_grid_options_ui_menu_categories_icon_210806.png",
                            color: data.color!,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      Text(
                        data.title!,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 10, color: Color(0xff919A92)),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
