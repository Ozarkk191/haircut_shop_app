import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/status_withdraw_button.dart';

class ItemPrommotionCampaign extends StatelessWidget {
  final String textDate;
  final String textStatus;
  final String description;
  final bool iscomplete;

  const ItemPrommotionCampaign(
      {Key key,
      this.textDate,
      this.textStatus,
      this.description,
      this.iscomplete = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text(
                    '$textDate',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  child: StatusWithdrawButton(
                    callback: () {},
                    title: '$textStatus',
                    fontSize: 10,
                    isComplete: iscomplete,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              child: Text('$description'),
            ),
          ],
        ),
      ),
    );
  }
}
