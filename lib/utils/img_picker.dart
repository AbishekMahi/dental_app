import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

pickImg(ImageSource source) async {
  final ImagePicker imgPicker = ImagePicker();
  XFile? file = await imgPicker.pickImage(source: source);
  if (file != null) {
    return await file.readAsBytes();
  }
  return ('No image Selected');
}

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}
