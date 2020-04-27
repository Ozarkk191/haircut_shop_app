import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/colors/haircut_colors.dart';

class RoundWidthHeightButton extends StatelessWidget {
  final String title;
  final Function callback;
  final Color textColor;
  final Color backgroundColor;
  final double fontSize;
  final double horizontalPadding;
  final double verticalPadding;
  final double width;
  final double height;
  final double marginTop;
  final double radius;

  const RoundWidthHeightButton({
    Key key,
    @required this.title,
    @required this.callback,
    @required this.width,
    @required this.height,
    this.textColor = const Color(0xff009900),
    this.marginTop = 0,
    this.backgroundColor = HaircutColors.PRIMARY_COLOR,
    this.fontSize = 16,
    this.horizontalPadding = 50,
    this.verticalPadding = 8,
    this.radius = 40,
  })  : assert(title != null),
        assert(callback != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(top: marginTop),
      child: RaisedButton(
        onPressed: callback,
        textColor: textColor,
        color: backgroundColor,
        child: Text(
          '$title',
          style: TextStyle(fontSize: fontSize),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(radius),
            side: BorderSide(color: Colors.transparent)),
      ),
    );
  }
}
