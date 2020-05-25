import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({Key key, this.userName, this.image}) : super(key: key);
  final userName;
  final image;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 40.0,
          height: 40.0,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
              fit: BoxFit.fill,
              image: new Image.asset(
                'lib/assets/images/photo_2020-05-06_20-24-46.jpg',
                fit: BoxFit.cover,
              ).image,
            ),
          ),
        ),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(userName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
      ],
    );
  }
}
