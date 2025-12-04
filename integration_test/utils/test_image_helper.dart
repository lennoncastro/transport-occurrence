import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<String> createFakeImageFile() async {
  final directory = await getApplicationDocumentsDirectory();
  final fakeImagePath = '${directory.path}/fake_image.png';
  final sourceImagePath =
      'android/app/src/main/res/mipmap-mdpi/ic_launcher.png';
  final sourceImageFile = File(sourceImagePath);
  if (await sourceImageFile.exists()) {
    final imageBytes = await sourceImageFile.readAsBytes();
    final fakeImageFile = File(fakeImagePath);
    await fakeImageFile.writeAsBytes(imageBytes);
  } else {
    final fakeImageFile = File(fakeImagePath);
    final pngBytes = [
      0x89,
      0x50,
      0x4E,
      0x47,
      0x0D,
      0x0A,
      0x1A,
      0x0A,
      0x00,
      0x00,
      0x00,
      0x0D,
      0x49,
      0x48,
      0x44,
      0x52,
      0x00,
      0x00,
      0x00,
      0x01,
      0x00,
      0x00,
      0x00,
      0x01,
      0x08,
      0x06,
      0x00,
      0x00,
      0x00,
      0x1F,
      0x15,
      0xC4,
      0x89,
      0x00,
      0x00,
      0x00,
      0x0A,
      0x49,
      0x44,
      0x41,
      0x54,
      0x78,
      0x9C,
      0x63,
      0x00,
      0x01,
      0x00,
      0x00,
      0x05,
      0x00,
      0x01,
      0x0D,
      0x0A,
      0x2D,
      0xB4,
      0x00,
      0x00,
      0x00,
      0x00,
      0x49,
      0x45,
      0x4E,
      0x44,
      0xAE,
      0x42,
      0x60,
      0x82,
    ];
    await fakeImageFile.writeAsBytes(pngBytes);
  }
  return fakeImagePath;
}
