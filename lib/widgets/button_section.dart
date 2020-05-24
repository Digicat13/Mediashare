import 'package:flutter/material.dart';

class ButtonSection extends StatefulWidget {
  final int _likesCount;
  ButtonSection(this._likesCount);

  @override
  _ButtonSectionState createState() => _ButtonSectionState(_likesCount);
}

class _ButtonSectionState extends State<ButtonSection> {
//  final bool isFavourite;
  int _likesCount;
  bool _isFavorited = false;
  bool _isBookmarked = false;

  _ButtonSectionState(
//    this.isFavourite,
      this._likesCount);

  @override // Add from this line ...
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildButton(
                        (_isFavorited
                            ? Icon(Icons.favorite, color: Colors.red)
                            : Icon(Icons.favorite_border)),
                        _toggleFavorite),
                    _buildButton(Icon(Icons.mode_comment), _toggleComment),
                    _buildButton(Icon(Icons.send), _toggleSendPost),
                  ],
                ),
              ),
              _buildButton(
                  (_isBookmarked
                      ? Icon(Icons.bookmark)
                      : Icon(Icons.bookmark_border)),
                   _toggleAddBookmark)
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  _likesCount.toString() + ' likes',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _likesCount -= 1;
        _isFavorited = false;
      } else {
        _likesCount += 1;
        _isFavorited = true;
      }
    });
  }

  void _toggleComment() {}
  void _toggleSendPost() {}
  void _toggleAddBookmark() {
    setState(() {
      if (_isBookmarked) {
        _isBookmarked = false;
      } else {
        _isBookmarked = true;
      }
    });
  }
}

Widget _buildButton(Icon icon, Function onToggle) {
  return Container(
    child: IconButton(
      icon: icon,
      onPressed: onToggle,
    ),
  );
}
