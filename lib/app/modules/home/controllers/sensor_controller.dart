import 'dart:async';

import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorController extends GetxController{
  
   @override
  void onInit() {
    startSensorListeners();
    super.onInit();
  }
  
 @override
  void onReady() {
    updateInterval();
    super.onReady();
  }
  
  //variable untuk menangkap data sensor
  RxList<double> accelerometerValues = RxList<double>([0.0, 0.0, 0.0]);
  RxList<double> gyroscopeValues = RxList<double>([0.0, 0.0, 0.0]);
  RxList<double> magnetometerValues = RxList<double>([0.0, 0.0, 0.0]);

  //fungsi untuk memperbarui nilai dari sensor yang di tangkap (point B pada halaman B)
   updateInterval(){
    Timer.periodic(const Duration(seconds: 5), (timer) { 
      startSensorListeners();
    });
    update();
  }
  //fungsi sensor
  void startSensorListeners() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      accelerometerValues.value = [event.x, event.y, event.z];
    });
    
    gyroscopeEvents.listen((GyroscopeEvent event) {
      gyroscopeValues.value = [event.x, event.y, event.z];
    });

    magnetometerEvents.listen((MagnetometerEvent event) {
      magnetometerValues.value = [event.x, event.y, event.z];
    });
    update();
  }

  
}