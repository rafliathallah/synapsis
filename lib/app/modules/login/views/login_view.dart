import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:synapsis/app/utils/common.dart';
import 'package:synapsis/app/utils/custom_text_form_field.dart';
import 'package:synapsis/app/utils/rounded_button.dart';

import '../../../utils/constants.dart';
import '../../../utils/globalvariable.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: Get.height,
        width: Get.width,
        decoration:  const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
        ColorsBase.colorPrimary,
        ColorsBase.colorPrimarySoft,
        ColorsBase.whiteBase,
        ],
        ),
        ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Image.asset("assets/images/logo.png",scale:15.0,),
        body:  Center(
          child: ListView(
            shrinkWrap: true,
                    padding:  const EdgeInsets.symmetric(
                      horizontal: SpaceBase.paddingXL,
                      vertical: SpaceBase.paddingXL*2
                    ),
                    physics: const ScrollPhysics(),
            children: [
              Text("LogIn.",style: textTheme.displayMedium!.copyWith(color: ColorsBase.whiteBase,fontWeight: FontWeight.bold)),
              const SizedBox(height: SpaceBase.paddingL,),
              boxTransparent(const EdgeInsets.all(SpaceBase.paddingL),  Column(
                children: [
                  Form(
                    key: formKeyLogin,
                    child: ExpansionTile(title: const Text("Login with Email"),
                    childrenPadding: const EdgeInsets.symmetric(vertical: SpaceBase.paddingM),
                    children: [
                        CustomTextFieldWidget(
                        controller: controller.email,
                        labelText: "Email",
                      ),
                      const SizedBox(height: SpaceBase.paddingM,),
                        CustomTextFieldWidget(
                          controller: controller.pass,
                        labelText: "Password",
                        obscureText: true,
                       ),
                      const SizedBox(height: SpaceBase.paddingL,),
                      Obx(() => RoundedButton(
                        loadingColor: ColorsBase.whiteBase,
                        loading: (controller.isLoading.isFalse)?false:true,
                        onPressed: ()async{
                         if (formKeyLogin.currentState!.validate()) {
                                          if (controller.isLoading.isFalse) {
                                        await controller.runWithEmail();
                                      }
                                      }
                      },text: "Login",))
                    ],),
                  ),
                    ExpansionTile(title: const Text("Login with NFC"),
                    children: [
                      RoundedButton(onPressed: (){},text: "Unavailable",color: ColorsBase.red,)
                    ],),
                    ExpansionTile(title: const Text("Login with Biometrick"),
                    children: [
                      RoundedButton(onPressed: (){},text: "Unavailable",color: ColorsBase.red,)
                    ],),
                  ExpansionTile(title: const Text("Login with  QR CODE"),
                  children: [
                    RoundedButton(onPressed: ()async{
                      await controller.scanQR();
                    },text: "Scan QR",)
                  ],),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
