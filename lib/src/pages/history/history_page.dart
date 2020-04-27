import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/appbars/custom_appbar.dart';

import 'package:haircut_delivery_shop/src/base_components/colors/haircut_colors.dart';
import 'package:haircut_delivery_shop/src/base_components/group_items/tab_button_group.dart';
import 'package:haircut_delivery_shop/src/pages/history/itemhistory/item_history.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CustomAppbar(
            callback: () {
              Navigator.pop(context);
            },
            title: 'Delivery',
          ),
          headButtonContainer(),
          Container(
            height: 500,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ItemHistory(
                  name: 'Customer Name',
                  address: 'Address Location',
                  date: '2020/03/04',
                  time: '17:17',
                  distanc: 5.0,
                  imageUrl:
                      'https://qph.fs.quoracdn.net/main-qimg-93995035cb7857b90fd78aee23fa4795',
                );
              },
              itemCount: 3,
            ),
          )
        ],
      ),
    );
  }

  Container headButtonContainer() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: TabButtonGroup(),
    );
  }

  Container appBarCustom(BuildContext context) {
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
                'Delivery',
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
