import 'package:flutter/material.dart';

/// Confirmation dialog.
class TwoBtnDialog extends StatelessWidget {
  final String message;
  final String cancelBtnString;
  final String confirmBtnString;
  final Function onConfirmed;
  final Function onCanceled;

  TwoBtnDialog({
    Key key,
    @required this.message,
    @required this.cancelBtnString,
    @required this.confirmBtnString,
    @required this.onConfirmed,
    @required this.onCanceled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(cancelBtnString),
      content: Text(message),
      actions: <Widget>[
        FlatButton(
          child: Text(cancelBtnString),
          onPressed: onCanceled,
        ),
        FlatButton(
          child: Text(confirmBtnString),
          onPressed: onConfirmed,
        ),
      ],
    );
  }
}
