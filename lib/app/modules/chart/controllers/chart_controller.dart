import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';


class DataPoint {
  final DateTime time;
  final double value;

  DataPoint(this.time, this.value);
}

class ChartController extends GetxController {
  @override
  void onReady() {
    chartSensorListener();
    super.onReady();
  }

  // Variabel untuk menyimpan data sensor
  RxList<DataPoint> accelerometerData = <DataPoint>[].obs;
  RxList<DataPoint> gyroscopeData = <DataPoint>[].obs;
  RxList<DataPoint> magnetometerData = <DataPoint>[].obs;

  //fungsi chart 
  void chartSensorListener() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      // Tambahkan data accelerometer ke daftar
      accelerometerData.add(DataPoint(DateTime.now(), event.x));
      update(); 
    });

    gyroscopeEvents.listen((GyroscopeEvent event) {
      // Tambahkan data gyroscope ke daftar
      gyroscopeData.add(DataPoint(DateTime.now(), event.x));
      update();
    });

    magnetometerEvents.listen((MagnetometerEvent event) {
      // Tambahkan data magnetometer ke daftar
      magnetometerData.add(DataPoint(DateTime.now(), event.x));
      update();
    });
  }
}
