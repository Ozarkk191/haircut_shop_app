import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String hint;
  final Color textColor;
  final Color backgroundColor;
  final double fontSize;
  final double width;
  final double height;
  final double marginTop;
  final int maxLines;

  const TextFieldCustom({
    Key key,
    @required this.hint,
    this.textColor = Colors.black,
    this.backgroundColor = const Color(0xffEEEEEE),
    this.fontSize = 12,
    this.width = 40,
    this.height = 250,
    this.marginTop = 0,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(top: marginTop),
      child: TextField(
        textAlign: TextAlign.center,
        showCursor: true,
        maxLines: 1,
        style: TextStyle(fontSize: fontSize),
        decoration: InputDecoration.collapsed(
          hintText: '$hint',
          filled: true,
          fillColor: backgroundColor,
          focusColor: Colors.limeAccent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
        ),
      ),
    );
  }
}
