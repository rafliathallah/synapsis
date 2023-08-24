
import 'package:get/get.dart';
import 'package:camera/camera.dart';



class MapsController extends GetxController {

  @override
  void onClose() {
    camController.dispose();
    super.onClose();
  }
  late List<CameraDescription> cameras;
  late CameraController camController;

  
  
  Future<void> getCamera() async {
    cameras = await availableCameras();
    final firstCamera = cameras.firstWhere((camera) => camera.lensDirection ==CameraLensDirection.front,
    orElse: () => cameras.first,);
    
    camController =  CameraController(
      firstCamera,
      ResolutionPreset.high,
    );
    await camController.initialize();
    update();
  }

  Future<XFile?>take()async{
    if (!camController.value.isInitialized) {
      return null;
    }
    try {
      final XFile picture = await camController.takePicture();
     
        update();
      return picture;
    } catch (e) {
      print("Error taking picture: $e");
      return null;
    }
  }
}
