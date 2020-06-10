import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  TitleSection({Key key, this.userName, this.image = 'assets/images/photo_2020-05-06_20-24-46.jpg'}) : super(key: key);
  final String userName;
  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image:  Image.asset(
                  image,
                  fit: BoxFit.cover,
                ).image,
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(userName,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}
