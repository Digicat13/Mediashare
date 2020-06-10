import 'package:flutter/material.dart';

class ButtonSection extends StatefulWidget {
  int likesCount;
  bool isFavorited = false;
  bool isBookmarked = false;

  ButtonSection({this.likesCount, this.isFavorited = false, this.isBookmarked = false});

  @override
  _ButtonSectionState createState() => _ButtonSectionState();
}

class _ButtonSectionState extends State<ButtonSection> {

  _ButtonSectionState();

  @override // Add from this line ...
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildButton(
                        (widget.isFavorited ? Icons.favorite : Icons.favorite_border),
                        _toggleFavorite,
                        color: (widget.isFavorited ? Colors.red : null)),
                    _buildButton(Icons.mode_comment, _toggleComment),
                    _buildButton(Icons.send, _toggleSendPost),
                  ],
                ),
              ),
              _buildButton(
                  (widget.isBookmarked ? Icons.bookmark : Icons.bookmark_border),
                  _toggleAddBookmark)
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  '${widget.likesCount} likes',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      widget.likesCount = widget.isFavorited ? widget.likesCount - 1 : widget.likesCount + 1;
      widget.isFavorited = !widget.isFavorited;
    });
  }

  void _toggleComment() {}
  void _toggleSendPost() {}
  void _toggleAddBookmark() {
    setState(() {
      widget.isBookmarked = !widget.isBookmarked;
    });
  }
}

Widget _buildButton(IconData iconData, Function onToggle, {Color color}) {
  return  IconButton(
      icon: Icon(iconData, color: color),
      onPressed: onToggle,
    );
}
