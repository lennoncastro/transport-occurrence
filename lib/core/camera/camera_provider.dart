import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

abstract interface class CameraProvider {
  Future<String?> takePhoto();
}

class CameraProviderImpl implements CameraProvider {
  @override
  Future<String?> takePhoto() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
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
}
