import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePickerController extends GetxController {
  var selectedImage = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }
}
