import 'package:get/get.dart';
import 'package:synapsis/app/modules/home/controllers/sensor_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<SensorController>(
      () => SensorController(),
    );
  }
}
