import 'package:flutter/material.dart';

class ItemHistory extends StatelessWidget {
  final String name;
  final String address;
  final String date;
  final String time;
  final double distanc;
  final String imageUrl;

  const ItemHistory({
    Key key,
    @required this.name,
    @required this.address,
    @required this.date,
    @required this.time,
    @required this.distanc,
    @required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  child: Image.network(
                    '$imageUrl',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '$name',
                        style: TextStyle(fontSize: 16),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            size: 12,
                          ),
                          Text(
                            '$address',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Text('Date: $date', style: TextStyle(fontSize: 12)),
                      Text('Time : $time', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.all(5),
              height: 100,
              child: Text('$distanc km'),
            )
          ],
        ),
      ),
    );
  }
}
