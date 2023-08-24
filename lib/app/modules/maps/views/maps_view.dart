import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:synapsis/app/modules/home/controllers/sensor_controller.dart';
import 'package:synapsis/app/modules/maps/views/display_view.dart';
import 'package:synapsis/app/utils/location_service.dart';
import 'package:synapsis/app/utils/rounded_button.dart';

import '../../../utils/constants.dart';
import '../controllers/maps_controller.dart';

class MapsView extends GetView<MapsController> {
  const MapsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: ColorsBase.colorPrimary,
      appBar: AppBar(title:  Text("Camera",style: textTheme.titleLarge!.copyWith(color: ColorsBase.whiteBase,fontWeight: FontWeight.bold),),
      automaticallyImplyLeading: false,
      centerTitle: true,),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: Get.height,
               width: Get.width,
              margin: const EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(35.0),
                          topLeft: Radius.circular(35.0)),
                      color: ColorsBase.whiteBase,
                    ),
                    child: FutureBuilder(
                      future: controller.getCamera(),
                      builder: (context, snapshot) {
                        if(snapshot.connectionState == ConnectionState.done){
                          // controller.camController!.value.isInitialized? 
                    return ClipRRect(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(35.0),topRight: Radius.circular(35.0)),
                      child: AspectRatio(aspectRatio: controller.camController.value.aspectRatio,
                        child: CameraPreview(controller.camController,child: 
                         Padding(
                           padding:  const EdgeInsets.all(SpaceBase.paddingL),
                           child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(DateFormat("EEEE, d MMMM yyyy", "id_ID").format(DateTime.now()),
                                style: textTheme.labelMedium,),
                              Text("Long : ${UserLocation.long}, Lat : ${UserLocation.lat}",style: textTheme.labelMedium,),
                              Text("Magneto: \n X: ${Get.find<SensorController>().magnetometerValues[0]} \n Y: ${Get.find<SensorController>().magnetometerValues[1]} \n Z: ${Get.find<SensorController>().magnetometerValues[2]}",
                              style: textTheme.labelMedium,),
                            ],
                                                 ),
                         ),),),
                    );
                    // : const Center(child: CircularProgressIndicator(),),
                        }else{
                          return const Center(child: CircularProgressIndicator(),);
                        }
                      },)
          ),
          SizedBox(
            height: 50,
            child: RoundedButton(onPressed: ()async{
              final XFile? picture = await controller.take();
              if(picture !=null){
                Get.to(()=> DisplayWidget(imagePath: picture.path,));
              }
            },text: "take",))
        ],
      ),
      
    );
  }
}
