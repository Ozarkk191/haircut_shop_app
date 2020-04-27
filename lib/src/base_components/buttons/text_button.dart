import 'package:flutter/material.dart';

class TextButton extends StatelessWidget {
  final Function callback;
  final String title;

  const TextButton({
    Key key,
    @required this.callback,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        height: 20,
        child: Text(
          '$title',
          style: TextStyle(
            fontSize: 12,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
