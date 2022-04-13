import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.25),
        itemBuilder: (context, index) {
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
                style: TextStyle(fontSize: 10, color: Color(0xff919A92)),
              ),
            ],
          );
        },
      ),
    );
  }
}
