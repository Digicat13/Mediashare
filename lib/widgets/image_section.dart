import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  ImageSection(
      {Key key, this.image = 'assets/images/photo_2020-05-06_20-24-46.jpg'})
      : super(key: key);
  String image;

  @override
  Widget build(BuildContext context) {
    image = image.replaceAll(RegExp(r'data:image.*,'), '');
    return Image.asset(
      image,
      fit: BoxFit.cover,
    );
//    return Image.memory(
//      dataFromBase64String(image),
//      fit: BoxFit.cover,
//    );
  }

  Uint8List dataFromBase64String(String base64String) {
    return Base64Decoder().convert(base64String);
  }
}
