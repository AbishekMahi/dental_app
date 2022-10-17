import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

pickImg(ImageSource source) async {
  final ImagePicker _imgPicker = ImagePicker();
  XFile? _file = await _imgPicker.pickImage(source: source);
  if (_file != null) {
    return await _file.readAsBytes();
  }
  print('Noimg Selected');
}

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}
