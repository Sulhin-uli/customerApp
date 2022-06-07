import 'package:customer_app/app/modules/home/controllers/home_controller.dart';
import 'package:customer_app/app/modules/login/controllers/auth_controller.dart';
import 'package:get/get.dart';

import '../controllers/saya_controller.dart';

class SayaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SayaController>(
      () => SayaController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
  }
}
