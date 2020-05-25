import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  ImageSection({Key key, this.image}) : super(key: key);
  String image;

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      image = 'lib/assets/images/photo_2020-05-06_20-24-46.jpg';
    }
    return Container(
        child: Image.asset(
      image,
      fit: BoxFit.cover,
    ));
  }
}
