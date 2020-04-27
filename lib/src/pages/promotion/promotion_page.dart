import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/text_button.dart';
import 'package:haircut_delivery_shop/src/base_components/colors/haircut_colors.dart';
import 'package:haircut_delivery_shop/src/pages/promotion/itempromotion/item_promotion_banner.dart';
import 'package:haircut_delivery_shop/src/pages/promotion/itempromotion/item_promotion_campaign.dart';
import 'package:haircut_delivery_shop/src/pages/promotion/promotion_banner.dart';
import 'package:haircut_delivery_shop/src/pages/promotion/promotion_detail.dart';

import '../../base_components/appbars/custom_appbar.dart';
import '../../base_components/constants/haircut_constants.dart';

class PromotionPage extends StatelessWidget {
  final List<String> urls = [
    'https://promotions.co.th/wp-content/uploads/2018/11/central11.11-2.jpg',
    'https://www.ideaaddisplay.com/wp-content/uploads/2018/10/flash-01.png',
    'https://www.thumbsup.in.th/wp-content/uploads/2019/12/promotion-cover.jpeg',
    'https://promotions.co.th/wp-content/uploads/2018/11/central11.11-2.jpg',
    'https://www.ideaaddisplay.com/wp-content/uploads/2018/10/flash-01.png',
    'https://www.thumbsup.in.th/wp-content/uploads/2019/12/promotion-cover.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 70,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 20),
                  width: _getWidth(context),
                  child: Text(
                    'แนะนำสำหรับคุณ',
                    style: TextStyle(
                      color: HaircutColors.PRIMARY_COLOR,
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  width: _getWidth(context),
                  height: 125,
                  padding: EdgeInsets.only(bottom: 5),
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PromotionBanner(
                                        imageUrl: urls[index],
                                      )));
                        },
                        child: ItemPromotionBanner(imageUrl: urls[index]),
                      );
                    },
                    itemCount: urls.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Container(
                  width: _getWidth(context),
                  margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Text(
                    'Promotion',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: HaircutColors.PRIMARY_COLOR,
                    ),
                  ),
                ),
                campaignContainer(),
                TextButton(
                  callback: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PromotionDetail()));
                  },
                  title: 'see more',
                )
              ],
            ),
          ),
          CustomAppbar(
            height: TOOL_BAR_HEIGHT,
            title: 'Promotion',
            callback: () {},
          )
        ],
      ),
    );
  }

  Container campaignContainer() {
    return Container(
      height: 400,
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
        itemCount: 5,
      ),
    );
  }

  _getWidth(BuildContext context) {
    final double x = MediaQuery.of(context).size.width;
    return x;
  }
}
