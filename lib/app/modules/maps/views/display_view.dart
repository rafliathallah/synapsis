import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:synapsis/app/utils/google_maps.dart';

import '../../../utils/constants.dart';

class DisplayWidget extends StatelessWidget {
  final String imagePath;
  const DisplayWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: ColorsBase.colorPrimary,
      appBar: AppBar(title:  Text("Maps",style: textTheme.titleLarge!.copyWith(color: ColorsBase.whiteBase,fontWeight: FontWeight.bold),),
      automaticallyImplyLeading: false,
      centerTitle: true,),
      floatingActionButton: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        child: Image.file(File(imagePath),height: Get.height * 0.3,)),
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
              child: const GMaps(),
          ),
          
        ],
      ),
    );
  }
}