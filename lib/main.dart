import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:synapsis/app/utils/constants.dart';
import 'app/routes/app_pages.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app/utils/local_storage.dart';

void main() async{
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.light,
    statusBarColor: Colors.transparent, // transparent status bar
  ));
   WidgetsFlutterBinding.ensureInitialized();
   await GetStorage.init();
   final cameras = await availableCameras();
   PackageInfo packageInfo = await PackageInfo.fromPlatform();
  var box = GetStorage();
  box.write(LocalData.versionApp,packageInfo.version);
  box.write(LocalData.versionCode,packageInfo.buildNumber);
   await initializeDateFormatting().then((value) => 
   runApp(
    GetMaterialApp(
      theme: lightTheme,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  ));
  
}
