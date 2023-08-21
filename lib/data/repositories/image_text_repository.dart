import 'dart:io';
import 'package:flutter/services.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import '../../domain/models/image_text.dart';
import '../../domain/repositories/IRepositoryTextImage.dart';

class ImageTextRepository implements IImageTextRepository {
  @override
  Future<ImageText> readTextFromImage(String imagePath) async {
    final File imageFile = File(imagePath);
    String extractedText = 'File not found';

    if (_checkFileExistsSync('/storage/emulated/0/Pictures/car_id.jpg')) {
      print("Entrou");

      final InputImage inputImage = InputImage.fromFilePath(imageFile.path);
      final textDetector = GoogleMlKit.vision.textRecognizer();

      final recognisedText = await textDetector.processImage(inputImage);

      for (TextBlock block in recognisedText.blocks) {
        for (TextLine line in block.lines) {
          extractedText += line.text + ' ';
        }
      }

      textDetector.close();
    }

    return ImageText(extractedText);
  }

  bool _checkFileExistsSync(String path) {
    return File(path).existsSync();
  }

  bool _checkDirectoryExistsSync(String path) {
    return Directory(path).existsSync();
  }
}
