import 'package:flutter/material.dart';

_defaultOnPressed() => {};

class OutlinedButton extends StatelessWidget {
  OutlinedButton({
    Key key,
    this.color = Colors.cyan,
    @required this.text,
    this.onPressed = _defaultOnPressed,
  }) : super(key: key);
  final Color color;
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(color: color, width: 2.0),
      ),
      child: Text(text,
          style: TextStyle(
              fontSize: 18, color: color, fontWeight: FontWeight.bold)),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
    );
  }
}
