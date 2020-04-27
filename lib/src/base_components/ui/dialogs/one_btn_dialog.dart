import 'package:flutter/material.dart';

class OneBtnDialog extends StatelessWidget {
  final String message;
  final String title;
  final String closeBtnText;
  final VoidCallback onClosedCallback;

  OneBtnDialog({
    Key key,
    @required this.message,
    @required this.title,
    @required this.closeBtnText,
    @required this.onClosedCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        FlatButton(
          child: Text(closeBtnText),
          onPressed: onClosedCallback,
        ),
      ],
    );
  }
}
