import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/appbars/custom_appbar.dart';
import 'package:haircut_delivery_shop/src/pages/promotion/itempromotion/item_promotion_campaign.dart';

class PromotionDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        CustomAppbar(
          callback: () {
            Navigator.pop(context);
          },
          title: 'Promotion',
        ),
        Container(
          child: Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ItemPrommotionCampaign(
                  description:
                      'Description or content information and other will display 2 row',
                  textDate: 'Campaign Title',
                  textStatus: 'เข้าร่วมแล้ว',
                  iscomplete: true,
                );
              },
              itemCount: 10,
            ),
          ),
        ),
      ],
    ));
  }
}
