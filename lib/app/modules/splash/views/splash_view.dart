import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:synapsis/app/utils/constants.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) => Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const CircularProgressIndicator(),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration:  const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/logo.png")),
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
        ColorsBase.colorPrimary,
        ColorsBase.whiteBase,
        ColorsBase.colorPrimarySoft,
        ],
        ),
        ),
      )
    ),);
  }
}
