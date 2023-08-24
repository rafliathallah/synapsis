import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as loc;

import 'location_service.dart';

class GetLocation {
  GetLocation._();

  static Future<dynamic> start({required BuildContext context, bool isSkip = false}) async {
    loc.Location location = loc.Location();
    bool isOn = await location.requestService();
    loc.PermissionStatus isAllow = await location.requestPermission();
    if (isOn && isAllow == loc.PermissionStatus.granted) {
      return true;
    } else {
      if (!isSkip) {
        await _showLocationPermissionNeededDialog(context);
      }
    }
    return false;
  }

  static Future<dynamic> get({required BuildContext context, bool backOnConfirm = false}) async {
    loc.Location location = loc.Location();
    loc.LocationData locData;
    locData = await location.getLocation();
    print("locdata $locData");
    UserLocation.lat = locData.latitude!;
    UserLocation.long = locData.longitude!;
    UserLocation.isMock = locData.isMock!;
    if (locData.isMock!) {
      await _showFakeGPSDetectionDialog(context, backOnConfirm);
      return true;
    } else {
      return false;
    }
  }

  static Future<void> _showLocationPermissionNeededDialog(BuildContext context) async {
    CoolAlert.show(
      context: Get.context!,
      type: CoolAlertType.warning,
      text: "Location permission needed!",
      loopAnimation: true,
      barrierDismissible: false,
      confirmBtnText: "Exit", 
      onConfirmBtnTap: () {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop'); 
      },
    );
  }

  static Future<void> _showFakeGPSDetectionDialog(BuildContext context, bool backOnConfirm) async {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.warning,
      text: "Fake GPS Detection, Please turn OFF Mocklocation",
      loopAnimation: true,
      barrierDismissible: false,
      confirmBtnText: backOnConfirm ? "Exit" : "OK",
      onConfirmBtnTap: backOnConfirm
          ? () {
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            }
          : null,
    );
  }
}
