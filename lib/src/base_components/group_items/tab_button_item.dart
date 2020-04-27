import 'package:flutter/material.dart';

class TabButtonItem extends StatelessWidget {
  final VoidCallback callback;
  final bool isActive;
  final Color activeColor;
  final Color inActiveColor;
  final BorderRadius borderRadius;
  final String title;

  const TabButtonItem({
    Key key,
    @required this.callback,
    this.isActive = false,
    this.activeColor = const Color(0xffDD133B),
    this.inActiveColor = const Color(0xffF9CCD0),
    this.borderRadius,
    @required this.title,
  })  : assert(callback != null),
        assert(isActive != null),
        assert(title != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return borderRadius != null ? _withRoundCorner() : _withoutRoundCorner();
  }

  Widget _withRoundCorner() {
    return Expanded(
      flex: 1,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          height: 45,
          color: isActive ? activeColor : inActiveColor,
          child: FlatButton(
            onPressed: callback,
            child: Text(
              title,
              style: isActive ? _whiteText() : _redText(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _withoutRoundCorner() {
    return Expanded(
      flex: 1,
      child: Container(
        height: 45,
        color: isActive ? Color(0xffDD133B) : Color(0xffF9CCD0),
        child: FlatButton(
          onPressed: callback,
          child: Text(
            title,
            style: isActive ? _whiteText() : _redText(),
          ),
        ),
      ),
    );
  }

  TextStyle _redText() {
    return TextStyle(color: Color(0xffE2002D), fontSize: 16);
  }

  TextStyle _whiteText() {
    return TextStyle(color: Colors.white, fontSize: 16);
  }
}
