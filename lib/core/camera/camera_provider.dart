import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:transport_occurrence/core/extensions/extensions.dart';

abstract interface class CameraProvider {
  Future<String?> takePhoto();
}

class CameraProviderImpl implements CameraProvider {
  final ImagePicker _picker = ImagePicker();

  @override
  Future<String?> takePhoto() async {
    try {
      final image = await _pickImageWithCamera();
      if (image == null) return null;
      final directory = await getApplicationDocumentsDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final photosDir = Directory('${directory.path}/photos/$timestamp');
      await photosDir.create(recursive: true);
      final path = '${photosDir.path}/${image.name}';
      await image.saveTo(path);
      return path;
    } catch (e) {
      rethrow;
    }
  }

  Future<XFile?> _pickImageWithCamera() async {
    final currentStatus = await Permission.camera.status;
    if (currentStatus.isResolved) {
      return _picker.pickImage(source: currentStatus.imageSource);
    }
    final requestedStatus = await Permission.camera.request();
    return _picker.pickImage(source: requestedStatus.imageSource);
  }
}
