import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:synapsis/app/utils/constants.dart';
import 'package:synapsis/app/utils/local_storage.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  //observable loading
  RxBool isLoading=false.obs;
  //penampung data
  var email = TextEditingController();
  var pass = TextEditingController();

  //mfungsi masuk menggunakan email
  runWithEmail()async{
    isLoading.value = true;
    final enteredEmail = email.text.trim();
    final enteredPass = pass.text.trim();

    if (enteredEmail == 'rafli@mail.com' && enteredPass == '123123') {
      // Redirect user to home screen
     await Future.delayed(const Duration(seconds: 2),(){
      //simpan kondisi jika user telah berhasil login
      box.write(LocalData.boxLogin, true);
      Get.offNamed(Routes.home); 
      });

    } else {
      // Menampilkan Snackbar jika email atau kata sandi salah
      Get.snackbar(
        "Login Failed",
        "Email or password is incorrect",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: ColorsBase.red,
        colorText: Colors.white,
      );
      isLoading.value = false;
    }
    update();
  }

  runWithQR({String val = "rafli123"})async{
    isLoading.value = true;
    if(val== "rafli123"){
       await Future.delayed(const Duration(seconds: 2),(){
        box.write(LocalData.boxLogin, true);
        Get.offNamed(Routes.home); 
      });
    }else{
      Get.snackbar(
        "Login Failed",
        "QR CODE WRONG",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: ColorsBase.red,
        colorText: Colors.white,
      );
      isLoading.value = false;
    }
    update();
  }

  scanQR()async{
    String ressultQR;
    try {
      ressultQR = await FlutterBarcodeScanner.scanBarcode(
                        "#4749A0",
                        "Kembali", 
                        true, 
                        ScanMode.QR);        
      runWithQR(val: ressultQR);
    } on PlatformException {
      ressultQR = "Gagal Mengambil data";
      
    }
    update();
  }

}
