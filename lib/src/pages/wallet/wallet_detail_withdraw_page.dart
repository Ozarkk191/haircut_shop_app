import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/appbars/custom_appbar.dart';
import 'package:haircut_delivery_shop/src/base_components/colors/haircut_colors.dart';
import 'package:haircut_delivery_shop/src/pages/wallet/itemwallet/item_withdraw.dart';

class WalletDetailWithdrawPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CustomAppbar(
              title: 'Withdraw',
              callback: () {
                Navigator.pop(context);
              }),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ItemWithdraw();
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget appBarCustom(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      margin: EdgeInsets.only(top: 25),
      decoration: new BoxDecoration(
        color: HaircutColors.PRIMARY_COLOR,
        borderRadius: new BorderRadius.only(
          bottomLeft: const Radius.circular(20.0),
          bottomRight: const Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 15.0, // soften the shadow
            spreadRadius: 1.0, //extend the shadow
            offset: Offset(
              1.0, // Move to right 10  horizontally
              1.0, // Move to bottom 10 Vertically
            ),
          )
        ],
      ),
      child: Center(
        child: Stack(
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 20),
                child: Image.asset('assets/images/ic_back.png'),
              ),
            ),
            Center(
              child: Text(
                'Withdraw',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
