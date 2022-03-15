import 'package:get/get.dart';

import '../controllers/saya_controller.dart';

class SayaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SayaController>(
      () => SayaController(),
    );
  }
}
