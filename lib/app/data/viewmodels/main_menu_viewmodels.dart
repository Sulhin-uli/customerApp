import 'package:customer_app/app/data/models/main_menu_model.dart';
import 'package:flutter/material.dart';

class MainMenuViewModel {
  List<MainMenuModel> getMainMenu() {
    return [
      MainMenuModel(
        image:
            "https://cdn2.iconfinder.com/data/icons/maps-navigation-linear-black/614/3683_-_Marker_I-512.png",
        title: "Menu 1",
        color: Colors.red,
      ),
      MainMenuModel(
          image:
              "https://cdn2.iconfinder.com/data/icons/maps-navigation-linear-black/614/3683_-_Marker_I-512.png",
          title: "Menu 2",
          color: Colors.yellow),
      MainMenuModel(
        image:
            "https://cdn2.iconfinder.com/data/icons/maps-navigation-linear-black/614/3683_-_Marker_I-512.png",
        title: "Menu 3",
        color: Colors.green,
      ),
      MainMenuModel(
        image:
            "https://cdn2.iconfinder.com/data/icons/maps-navigation-linear-black/614/3683_-_Marker_I-512.png",
        title: "Menu 4",
        color: Colors.purple,
      ),
      MainMenuModel(
        image:
            "https://cdn2.iconfinder.com/data/icons/maps-navigation-linear-black/614/3683_-_Marker_I-512.png",
        title: "Menu 5",
        color: Colors.cyan,
      ),
      MainMenuModel(
        image:
            "https://cdn2.iconfinder.com/data/icons/maps-navigation-linear-black/614/3683_-_Marker_I-512.png",
        title: "Menu 6",
        color: Colors.lightBlue,
      ),
      MainMenuModel(
        image:
            "https://cdn2.iconfinder.com/data/icons/maps-navigation-linear-black/614/3683_-_Marker_I-512.png",
        title: "Menu 7",
        color: Colors.pinkAccent,
      ),
    ];
  }
}
