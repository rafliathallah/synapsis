import 'dart:async';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/local_storage.dart';

class SplashController extends GetxController {
@override
  void onInit() {
    isLogin();
    super.onInit();
  }
  Future isLogin()async{
   bool hasLogin = box.read(LocalData.boxLogin) ?? false;
   var duration = const Duration(seconds: 2);
     return Timer(duration, (){
      if(hasLogin){
        Get.offNamed(Routes.home);
      }else{
         Get.offNamed(Routes.login);
      }
     });
 }
}
