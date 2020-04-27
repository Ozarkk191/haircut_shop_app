import 'package:flutter/material.dart';

class ItemListView extends StatelessWidget {
  final String title;
  final String time;
  final Color color;

  const ItemListView({
    Key key,
    this.title,
    this.time,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 20,
      margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '$title',
            style: TextStyle(color: color),
          ),
          Text(
            '$time',
            style: TextStyle(color: color),
          )
        ],
      ),
    );
  }
}
