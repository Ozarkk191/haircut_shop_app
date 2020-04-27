import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/status_withdraw_button.dart';

class ItemWithdraw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text(
                    '2020/03/05',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  child: StatusWithdrawButton(
                    callback: () {},
                    title: 'อยู่ระหว่างเบิกจ่าย',
                    fontSize: 10,
                    isComplete: false,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              child: Text('ระบบอัตโนมัติเบิกถอนเงิน 7,460 บาท'),
            ),
          ],
        ),
      ),
    );
  }
}
