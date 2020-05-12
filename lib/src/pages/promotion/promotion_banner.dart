import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/appbars/custom_appbar.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/round_width_height_button.dart';
import 'package:haircut_delivery_shop/src/base_components/colors/haircut_colors.dart';

class PromotionBanner extends StatelessWidget {
  final String imageUrl;

  const PromotionBanner({Key key, this.imageUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CustomAppbar(
            title: 'Promotion',
            callback: () {
              Navigator.pop(context);
            },
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Image.network(
              '$imageUrl',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, bottom: 10),
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.topLeft,
            child: Text(
              'Title Campaign',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: HaircutColors.PRIMARY_COLOR),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30, 0, 20, 10),
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.topLeft,
            child: Text(
              'Description or content information and other ' +
                  'Description or content information and other ' +
                  'Description or content information and other ' +
                  'Description or content information and other ' +
                  'Description or content information and other ' +
                  'Description or content information and other ' +
                  'Description or content information and other ' +
                  'Description or content information and other ' +
                  'Description or content information and other ',
              style: TextStyle(color: HaircutColors.PRIMARY_COLOR),
            ),
          ),
          Container(
            height: 20,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Text(
              'Expire : 2020/05/06',
              style: TextStyle(color: HaircutColors.PRIMARY_COLOR),
            ),
          ),
          Container(
            height: 40,
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            child: RoundWidthHeightButton(
                title: tr('promotion_campaing'),
                textColor: Colors.white,
                callback: () {},
                width: 250,
                height: 40),
          ),
        ],
      ),
    );
  }
}
