import 'package:get/get.dart';

import 'package:customer_app/app/modules/home/controllers/widget_controller.dart';
import 'package:customer_app/app/modules/home/controllers/widget_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WidgetController>(
      () => WidgetController(),
    );
    Get.lazyPut<WidgetController>(
      () => WidgetController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
