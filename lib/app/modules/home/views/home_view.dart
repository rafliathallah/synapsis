import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:synapsis/app/modules/home/controllers/sensor_controller.dart';
import 'package:synapsis/app/routes/app_pages.dart';
import 'package:synapsis/app/utils/constants.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:synapsis/app/utils/custom_text_form_field.dart';
import 'package:synapsis/app/utils/globalvariable.dart';
import 'package:synapsis/app/utils/local_storage.dart';
import 'package:synapsis/app/utils/location_service.dart';
import 'package:synapsis/app/utils/rounded_button.dart';
import '../controllers/home_controller.dart';
import 'package:intl/intl.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (){
         Get.toNamed(Routes.maps);
        },child: const Icon(Icons.camera_alt_rounded),),
        appBar: AppBar(
          centerTitle: false,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DigitalClock(
                  colon: const Text(
                    ":",
                  ),
                  areaHeight: 40,
                  areaAligment: AlignmentDirectional.center,
                  showSecondsDigit: true,
                  is24HourTimeFormat: true,
                  areaDecoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  hourDigitDecoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                  ),
                  minuteDigitDecoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                  ),
                  hourMinuteDigitTextStyle: textTheme.titleLarge!.copyWith(
                      color: ColorsBase.colorPrimary,
                      fontWeight: FontWeight.bold)),
              Text(
                DateFormat("EEEE, d MMMM yyyy", "id_ID").format(DateTime.now()),
                style: textTheme.titleMedium,
              ),
            ],
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(SpaceBase.paddingL),
          children: [
            GetBuilder<SensorController>(
              init: SensorController(),
              builder: (_) {
                return ExpansionTile(
                  title: Text(
                    "Sensors Device",
                    style: textTheme.titleMedium!.copyWith(
                      color: ColorsBase.colorPrimary,
                    ),
                  ),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Accelerometer Data'),
                    Text('X: ${_.accelerometerValues[0]}'),
                    Text('Y: ${_.accelerometerValues[1]}'),
                    Text('Z: ${_.accelerometerValues[2]}'),
                    const Divider(),
                    const Text('Gyroscope Data'),
                    Text('X: ${_.gyroscopeValues[0]}'),
                    Text('Y: ${_.gyroscopeValues[1]}'),
                    Text('Z: ${_.gyroscopeValues[2]}'),
                    const Divider(),
                    const Text('Magnetometer Data'),
                    Text('X: ${_.magnetometerValues[0]}'),
                    Text('Y: ${_.magnetometerValues[1]}'),
                    Text('Z: ${_.magnetometerValues[2]}'),
                    const Divider(),
                    Text("Lat : ${UserLocation.lat}"),
                    Text("Long : ${UserLocation.long}"),
                    const SizedBox(height: SpaceBase.paddingM,),
                    RoundedButton(onPressed: ()=> Get.toNamed(Routes.chart),text: "Show Chart",)
                  ],
                );
              },
            ),
            GetBuilder<HomeController>(
              init: HomeController(),
              builder: (_) {
                return Column(
                  children: [
                    ExpansionTile(
                      title: Text(
                        "Device Information",
                        style: textTheme.titleMedium!.copyWith(
                          color: ColorsBase.colorPrimary,
                        ),
                      ),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Level Baterai : ${controller.batteryLevel.value}%"),
                        Text(
                            'Manufacturer: ${controller.deviceInfo['manufacturer']}'),
                        Text('Model: ${controller.deviceInfo['model']}'),
                        Text(
                            'Build Number: ${controller.deviceInfo['buildNumber']}'),
                        Text('SDK Version: ${controller.deviceInfo['sdkInt']}'),
                        Text(
                            'Version Code: ${controller.deviceInfo['versionCode']}'),
                        const Divider()
                      ],
                    ),
                    ExpansionTile(title: Text(
                        "CRUD & Generade QR",
                        style: textTheme.titleMedium!.copyWith(
                          color: ColorsBase.colorPrimary,
                        ),
                      ),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        CustomTextFieldWidget(
                          controller: dataQR,
                          labelText: "Kata",
                        ),
                        const SizedBox(height: SpaceBase.paddingL,),
                        RoundedButton(onPressed: ()async{
                          if(controller.showQr.isFalse){
                          return await controller.generateQR(dataQR.text);
                          }
                          else{
                            dataQR.clear();
                             await controller.generateQR(dataQR.text);
                          }
                        },text: controller.showQr.isFalse? "Generate QR" :"DELETE",),
                        controller.showQr.isTrue?
                        QrImageView(data: dataQR.text,
                        version: QrVersions.auto,
                        size: 200.0,
                        ):Container()
                      ],
                      )
                  ],
                );
              },
            ),
            ExpansionTile(title: Text(
                        "Keluar dari app v${box.read(LocalData.versionApp)}",
                        style: textTheme.titleMedium!.copyWith(
                          color: ColorsBase.red,
                        ),
                      ),
                      children: [
                        RoundedButton(onPressed: ()async{
                          await box.remove(LocalData.boxLogin);
                          Get.offAllNamed(Routes.splash);
                        },text: "Keluar",color: ColorsBase.red,)
                      ],)
            
            
          ],
        ));
  }
}
