import 'package:flutter/material.dart';

class GetThisLocation extends StatelessWidget {
  final Function callback;
  final String title;

  const GetThisLocation(
      {Key key, @required this.callback, @required this.title})
      : assert(title != null),
        assert(callback != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: callback,
      title: Row(
        children: <Widget>[
          Image.asset('assets/images/ic_location.png'),
          SizedBox(width: 10),
          Text(
            '$title',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
