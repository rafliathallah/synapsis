import 'dart:async';

import 'package:battery_plus/battery_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:synapsis/app/utils/globalvariable.dart';

import '../../../utils/get_location.dart';


class HomeController extends GetxController {
  //inisiasi Btrrey plus
  var battery = Battery();
  //observable battrey value
  RxInt batteryLevel = 0.obs;
  //inisiasi device info 
  RxMap<String, dynamic> deviceInfo = RxMap<String, dynamic>({});
  //observable widget qr
  RxBool showQr = false.obs;

  @override
  void onInit() {
    getLocation();
    _updateBatteryLevel();
    battery.onBatteryStateChanged.listen((BatteryState state) {
      _updateBatteryLevel();
    });
    getDeviceInfo();
    super.onInit();
  }
  //permission untuk mengaktifkan Layanan lokasi
  getLocation()async{
   bool istrue =  await GetLocation.start(context: Get.context!);
   if(istrue){
    await GetLocation.get(context: Get.context!,backOnConfirm: true);
   }
  }
  //fungsi untuk mengetahui battrey status
   Future<void> _updateBatteryLevel() async {
    final batteryLevelValue = await battery.batteryLevel;
    batteryLevel.value = batteryLevelValue;
    update();
  }
  //fungsi untuk mengambil informasi divce
   Future<void>getDeviceInfo() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    try {
      if (GetPlatform.isAndroid) {
        final AndroidDeviceInfo build = await deviceInfoPlugin.androidInfo;
        deviceInfo.assignAll({
          'manufacturer': build.manufacturer,
          'model': build.model,
          'buildNumber': build.version.incremental,
          'sdkInt': build.version.sdkInt,
          'versionCode': build.version.release
        });
      } else if (GetPlatform.isIOS) {
        final IosDeviceInfo data = await deviceInfoPlugin.iosInfo;
        deviceInfo.assignAll({
          'manufacturer': 'Apple',
          'model': data.model,
          'buildNumber': data.systemVersion,
          'sdkInt': -1, // iOS tidak memiliki SDK versi
          'versionCode': -1, // iOS tidak memiliki versi kode
        });
      }
    } catch (e) {
      print("Error getting device info: $e");
    }
  }
  
  generateQR(String qrData){
    if(qrData.isNotEmpty){
    qrData = dataQR.text;
    showQr.value = true;
    }else{
      showQr.value = false;
    }
    update();
  }
}
