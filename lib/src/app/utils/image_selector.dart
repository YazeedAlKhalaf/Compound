import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ImageSelector {
  Future<File> selectImage() async {
    return await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
  }
}
