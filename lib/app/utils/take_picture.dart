import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class TakePicture extends GetxController{


  static final ImagePicker _picker = ImagePicker();
  static XFile? image="".obs as XFile;
  static var  fileComp ="".obs;
  static var  fileFBS ="".obs;

  static Future<dynamic> take() async {
     image = await _picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front);
    if (image != null) {
      print("foto keambil");
      return image;
    }
    print('keluar dari kamera');
    return null;
  }

  static Future<dynamic>pick()async{
    image = await _picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      return image;
    }
  }

  
  
}