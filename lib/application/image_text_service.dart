import '../data/repositories/image_text_repository.dart';
import '../domain/models/image_text.dart'; 

class ImageTextService {
  final ImageTextRepository _repository;

  ImageTextService(this._repository);

  Future<ImageText> readTextFromImage(String imagePath) {
    return _repository.readTextFromImage(imagePath);
  }
}
