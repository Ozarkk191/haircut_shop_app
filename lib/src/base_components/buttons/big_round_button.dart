import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/custom_round_button.dart';
import 'package:haircut_delivery_shop/src/base_components/colors/haircut_colors.dart';

class BigRoundButton extends StatelessWidget {
  final String title;
  final Function callback;
  final Color textColor;
  final Color backgroundColor;
  final double fontSize;
  final double horizontalPadding;
  final double verticalPadding;

  const BigRoundButton({
    Key key,
    @required this.title,
    @required this.callback,
    this.textColor = const Color(0xff009900),
    this.backgroundColor = HaircutColors.PRIMARY_FONT,
    this.fontSize = 16,
    this.horizontalPadding = 50,
    this.verticalPadding = 8,
  })  : assert(title != null),
        assert(callback != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomRoundButton(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      textColor: textColor,
      backgroundColor: backgroundColor,
      elevation: 3,
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          color: textColor,
        ),
      ),
      callback: callback,
    );
  }
}
