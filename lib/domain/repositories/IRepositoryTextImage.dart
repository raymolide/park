 
import '../models/image_text.dart';

abstract class IImageTextRepository {
  Future<ImageText> readTextFromImage(String imagePath);
}
