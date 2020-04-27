import 'package:flutter/material.dart';

import '../colors/haircut_colors.dart';

class WalletAppbar extends StatelessWidget {
  final double totalWallet;
  final double todayIncome;
  final double weekIncome;
  final double monthIncome;

  const WalletAppbar({
    Key key,
    @required this.totalWallet,
    @required this.todayIncome,
    @required this.weekIncome,
    @required this.monthIncome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 250,
          decoration: new BoxDecoration(
            color: HaircutColors.PRIMARY_COLOR,
            borderRadius: new BorderRadius.only(
              bottomLeft: const Radius.circular(25.0),
              bottomRight: const Radius.circular(25.0),
            ),
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 70,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
              height: 60,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      'Total Wallet',
                      style: TextStyle(fontSize: 12, color: Colors.green),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      totalWallet.toString(),
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                boxHeader('Today Income', todayIncome.toString()),
                boxHeader('Week Income', weekIncome.toString()),
                boxHeader('Month Income', monthIncome.toString()),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Container boxHeader(String title, String number) {
    return Container(
      width: 80,
      margin: EdgeInsets.only(top: 20),
      height: 50,
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 5),
            child: Text(
              '$title',
              style:
                  TextStyle(fontSize: 10, color: HaircutColors.PRIMARY_COLOR),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 5),
            child: Text(
              '$number',
              style: TextStyle(
                  fontSize: 20,
                  color: HaircutColors.PRIMARY_COLOR,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
