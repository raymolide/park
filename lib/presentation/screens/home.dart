import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image/image.dart' as img;
import '../../application/image_text_service.dart';
import '../../data/repositories/image_text_repository.dart';

class ImageTextPage extends StatefulWidget {
  @override
  _ImageTextPageState createState() => _ImageTextPageState();
}

class _ImageTextPageState extends State<ImageTextPage> {
  final ImageTextService _useCase = ImageTextService(ImageTextRepository());
  String _extractedText = "Texto ainda não extraído";

  Future<void> _readTextFromImage(String imagePath) async {
    final imageText = await _useCase.readTextFromImage(imagePath);
    setState(() {
      _extractedText = imageText.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Leitura de Texto em Imagens"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Texto Extraído:"),
            SizedBox(height: 10),
            Text(_extractedText),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  _readTextFromImage("/storage/emulated/0/Pictures/car_id.jpg"),
              child: Text("Extrair Texto"),
            ),
          ],
        ),
      ),
    );
  }
}
