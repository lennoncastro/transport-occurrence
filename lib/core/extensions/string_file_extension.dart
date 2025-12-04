import 'dart:convert';
import 'dart:io';

extension StringFileExtension on String {
  Future<String?> readAsBase64() async {
    try {
      final file = File(this);
      if (!(await file.exists())) return null;
      final bytes = await file.readAsBytes();
      return base64Encode(bytes);
    } catch (e) {
      return null;
    }
  }
}
