import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:synapsis/app/utils/constants.dart';


///**Created by Rafli Athallah 2023 *//
class BgWidget extends StatelessWidget {
  final AppBar? appBar;
  final Widget child;
  final Widget?fab;
  const BgWidget({super.key, this.appBar,this.fab,required this.child,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/background.png'),fit: BoxFit.cover)),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: fab,
        appBar: appBar,
        body: child
      ),
    );
  }
}
class BgHome extends StatelessWidget {
  final AppBar? appBar;
  final Widget child;
  final Widget?fab;
  const BgHome({super.key, this.appBar,this.fab,required this.child,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
        // image: DecorationImage(image: AssetImage('assets/images/background2.png'),fit: BoxFit.cover)
        ),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: fab,
        appBar: appBar,
        body: child
      ),
    );
  }
}

Widget boxTransparent(EdgeInsets padding, Widget child){
  return Container(
    padding: padding,
     decoration: BoxDecoration(
      color: const Color.fromARGB(52, 210, 210, 210),
        border: Border.all(color: const Color.fromARGB(53, 217, 217, 217),width: 1,),
          borderRadius: BorderRadius.circular(35),
                  ),
  child: child,
  );
}
ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackbarError(BuildContext context,{String text='', duration}){
  return ScaffoldMessenger.of(context).showSnackBar(text.isNotEmpty?SnackBar(content: Text(text),duration: Duration(seconds: duration ),):snakbarError);
}
const snakbarLoading = SnackBar(content: Text("Mohon Menunggu") );
const snakbarError = SnackBar(content: Text("Terjadi Kesalahan") );

void snackBarError({required String title,required String message}){
  Get.snackbar(title, message,backgroundColor: ColorsBase.red,colorText: ColorsBase.whiteBase);
}