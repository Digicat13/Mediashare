import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  ImageSection({Key key, this.image = 'assets/images/photo_2020-05-06_20-24-46.jpg'}) : super(key: key);
  String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      fit: BoxFit.cover,
    );
  }
}
