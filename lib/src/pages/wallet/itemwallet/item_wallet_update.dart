import 'package:flutter/material.dart';

class ItemWalletUpdate extends StatelessWidget {
  final String dateTime;
  final String income;
  final String commission;
  final String balance;

  const ItemWalletUpdate({
    Key key,
    @required this.dateTime,
    @required this.income,
    @required this.commission,
    @required this.balance,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                '$dateTime',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text(
                    'ลูกค้าชำระ',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Container(
                  child: Text(
                    '฿$income',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text(
                    'หักค่าคอมมิสชั่น',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Container(
                  child: Text(
                    '฿$commission',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text(
                    'รายได้เข้า wallet',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Container(
                  child: Text(
                    '฿$balance',
                    style: TextStyle(fontSize: 12, color: Colors.green),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
