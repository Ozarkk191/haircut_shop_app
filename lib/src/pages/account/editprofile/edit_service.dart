import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/appbars/custom_appbar.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/big_button.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/round_width_height_button.dart';
import 'package:haircut_delivery_shop/src/base_components/colors/haircut_colors.dart';
import 'package:haircut_delivery_shop/src/pages/account/item_listview/item_service.dart';

class EditService extends StatelessWidget {
  final List<String> lists = [
    'ตัดผมชาย',
    'ตัดผมหญิง',
    'ทำเล็บ',
    'นวด',
    'แต่งหน้า'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CustomAppbar(
            callback: () {
              Navigator.pop(context);
            },
            title: 'Service',
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: _getWidth(context),
            height: 40,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return BigButton(callback: () {}, buttonText: lists[index]);
              },
              itemCount: lists.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
            width: _getWidth(context),
            child: Text(
              'ตัดผมชาย',
              style: TextStyle(color: HaircutColors.PRIMARY_COLOR),
            ),
          ),
          Container(
            height: 420,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ItemService();
              },
              itemCount: 3,
            ),
          ),
          RoundWidthHeightButton(
            title: 'Save',
            callback: () {},
            width: 250,
            height: 40,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }

  _getWidth(BuildContext context) {
    final double getWidthScreen = MediaQuery.of(context).size.width;
    return getWidthScreen;
  }

  // _getHeight(BuildContext context) {
  //   final double getHeightScreen = MediaQuery.of(context).size.height;
  //   return getHeightScreen;
  // }

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
                'Service',
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
