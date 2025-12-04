import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

abstract interface class SignatureProvider {
  Future<String?> saveSignature(Uint8List? signature);
}

class SignatureProviderImpl implements SignatureProvider {
  @override
  Future<String?> saveSignature(Uint8List? signature) async {
    if (signature == null) return null;
    try {
      final directory = await getApplicationDocumentsDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final photosDir = Directory('${directory.path}/photos/$timestamp');
      await photosDir.create(recursive: true);
      final path = '${photosDir.path}/signature_$timestamp.png';
      await File(path).writeAsBytes(signature, flush: true);
      return path;
    } catch (_) {
      return null;
    }
  }
}
