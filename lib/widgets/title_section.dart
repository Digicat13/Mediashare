import 'package:flutter/material.dart';

Widget titleSection = Container(
  padding: const EdgeInsets.all(10),
  child: Row(
    children: [
        Text('username',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        Text('Look at my cute kitten',),
    ],
  ),
);
