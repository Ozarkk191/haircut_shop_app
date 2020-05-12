import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/appbars/wallet_appbar.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/text_button.dart';
import 'package:haircut_delivery_shop/src/base_components/colors/haircut_colors.dart';
import 'package:haircut_delivery_shop/src/pages/wallet/itemwallet/item_wallet_update.dart';
import 'package:haircut_delivery_shop/src/pages/wallet/itemwallet/item_withdraw.dart';
import 'package:haircut_delivery_shop/src/pages/wallet/wallet_detail_withdraw_page.dart';

import '../../base_components/appbars/custom_appbar.dart';
import '../../base_components/constants/haircut_constants.dart';

class WalletReportPage extends StatelessWidget {
  final String dateTime = '2020/0305 | 15:54 น.';
  final String income = '160';
  final String commission = '16';
  final String balance = '144';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                WalletAppbar(
                    totalWallet: 4500,
                    todayIncome: 500,
                    weekIncome: 1000,
                    monthIncome: 3000),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: (MediaQuery.of(context).size.width) / 2.5,
                        height: 50,
                        decoration: BoxDecoration(
                          color: HaircutColors.PRIMARY_COLOR,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                          ),
                        ),
                        child: subHeader(tr('wallet_commission'), '906'),
                      ),
                      Container(
                        width: 1,
                        height: 50,
                      ),
                      Container(
                        width: (MediaQuery.of(context).size.width) / 2.5,
                        height: 50,
                        decoration: BoxDecoration(
                          color: HaircutColors.PRIMARY_COLOR,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: subHeader(tr('wallet_income'), '7,605'),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: Text(
                    tr('wallet_last_update'),
                    style: TextStyle(
                        color: HaircutColors.PRIMARY_COLOR, fontSize: 20),
                  ),
                ),
                Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return ItemWalletUpdate(
                        dateTime: dateTime,
                        income: income,
                        commission: commission,
                        balance: balance,
                      );
                    },
                    itemCount: 3,
                  ),
                ),
                TextButton(
                  callback: () {},
                  title: tr('wallet_see_more'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 2,
                  color: Color(0xffcccccc),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(20, 10, 0, 10),
                  child: Text(
                    tr('wallet_withdraw'),
                    style: TextStyle(
                        color: HaircutColors.PRIMARY_COLOR, fontSize: 20),
                  ),
                ),
                Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return ItemWithdraw();
                    },
                    itemCount: 3,
                  ),
                ),
                TextButton(
                  callback: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WalletDetailWithdrawPage()));
                  },
                  title: tr('wallet_see_more'),
                ),
              ],
            ),
          ),
          CustomAppbar(
            height: TOOL_BAR_HEIGHT,
            title: 'Wallet Report',
            callback: () {},
          ),
        ],
      ),
    );
  }

  Column subHeader(String title, String number) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 5),
          child: Text(
            '$title',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
        Text(
          '$number',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
