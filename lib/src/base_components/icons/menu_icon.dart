import 'package:flutter/material.dart';

class MenuIcon extends StatelessWidget {
  final String imagePath;

  const MenuIcon({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      AssetImage(imagePath),
    );
  }
}
