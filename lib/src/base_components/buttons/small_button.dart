import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  final Function callback;
  final String buttonText;
  final Color color;

  const SmallButton(
      {Key key,
      @required this.callback,
      @required this.buttonText,
      this.color = const Color(0xff1DAD1D)})
      : assert(callback != null),
        assert(buttonText != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 60,
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
            // fontFamily: 'Prompt',
          ),
        ),
      ),
    );
  }
}
