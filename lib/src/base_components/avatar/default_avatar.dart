import 'package:flutter/material.dart';

class DefaultAvatar extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final BoxFit fit;

  const DefaultAvatar({
    Key key,
    this.color = Colors.white,
    this.width = 100,
    this.height = 100,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Image.asset(
        'assets/images/logo_red.png',
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }
}
