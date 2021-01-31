import 'package:camera/camera.dart';

// Segédosztály a CameraController kezeléséhez
class CameraManager {
  CameraController _cameraController;
  Future<void> _initializeControllerFuture;
  final CameraDescription camera;

  CameraManager({this.camera});
  // CameraController inicializálása
  Future<void> initialize() async {
    _cameraController = CameraController(
      camera,
      // Felbontás beállítása
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _cameraController.initialize();
    await _initializeControllerFuture;
  }

  CameraController get cameraController => _cameraController;

  void dispose() {
    _cameraController.dispose();
  }
}
