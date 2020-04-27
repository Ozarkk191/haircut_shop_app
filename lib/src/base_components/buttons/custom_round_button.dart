import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/colors/haircut_colors.dart';

class CustomRoundButton extends StatelessWidget {
  final Widget child;
  final double elevation;
  final double radius;
  final Color textColor;
  final Color backgroundColor;
  final Alignment alignment;
  final EdgeInsets padding;
  final VoidCallback callback;

  const CustomRoundButton({
    Key key,
    @required this.child,
    this.radius = 25,
    this.backgroundColor = Colors.white,
    this.textColor = HaircutColors.PRIMARY_FONT,
    this.alignment = Alignment.center,
    this.padding = const EdgeInsets.all(8),
    this.elevation = 0,
    this.callback,
  })  : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: padding,
      elevation: elevation,
      child: child,
      onPressed: callback,
      color: backgroundColor,
      textColor: textColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
