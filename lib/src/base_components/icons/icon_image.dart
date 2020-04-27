import 'package:flutter/material.dart';

class IconImage extends StatelessWidget {
  final Color color;
  final String imageString;

  const IconImage(
      {Key key, this.color = Colors.white, @required this.imageString})
      : assert(imageString != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageString,
      color: color,
    );
  }
}
