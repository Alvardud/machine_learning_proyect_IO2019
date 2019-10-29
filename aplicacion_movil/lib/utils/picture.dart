import 'dart:io';
import 'package:image_picker/image_picker.dart';

File picture;
Future<bool> getImage() async {
  picture = await ImagePicker.pickImage(
      source: ImageSource.camera, maxWidth: 350.0, maxHeight: 350.0
  );

  //picture = AssetImage('assets/smile.png');

  if (picture != null) {
    return true;
  } else {
    return false;
  }
}