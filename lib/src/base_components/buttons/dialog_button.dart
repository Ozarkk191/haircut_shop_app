import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/custom_round_button.dart';

class DialogButton extends StatelessWidget {
  final String title;
  final Function callback;
  final Color color;
  final double fontSize;
  final double horizontalPadding;
  final double verticalPadding;

  const DialogButton({
    Key key,
    @required this.title,
    @required this.callback,
    this.color = const Color(0xff009900),
    this.fontSize = 16,
    this.horizontalPadding = 30,
    this.verticalPadding = 0,
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
      backgroundColor: color,
      elevation: 3,
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.white,
        ),
      ),
      callback: callback,
    );
  }
}
