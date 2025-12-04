import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

extension CameraPermissionStatusExtension on PermissionStatus {
  bool get isResolved => isGranted || isPermanentlyDenied;

  ImageSource get imageSource =>
      isGranted ? ImageSource.camera : ImageSource.gallery;
}
