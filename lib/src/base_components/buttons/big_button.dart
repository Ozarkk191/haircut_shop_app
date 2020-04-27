import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/colors/haircut_colors.dart';

class BigButton extends StatelessWidget {
  final Function callback;
  final String buttonText;
  final Color color;

  const BigButton(
      {Key key,
      @required this.callback,
      @required this.buttonText,
      this.color = HaircutColors.PRIMARY_COLOR})
      : assert(callback != null),
        assert(buttonText != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 100,
      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        padding: EdgeInsets.symmetric(horizontal: 0),
        color: color,
        onPressed: callback,
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
