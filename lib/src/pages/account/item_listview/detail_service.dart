import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/colors/haircut_colors.dart';
import 'package:haircut_delivery_shop/src/pages/account/item_listview/item.dart';

class ServiceItem extends StatelessWidget {
  final String headText;
  // final List<ModelAccount> data;
  final String leftText;
  final String rightText;
  final int count;

  const ServiceItem(
      {Key key, this.headText, this.leftText, this.rightText, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 20, top: 10),
          child: Text(
            '$headText',
            style: TextStyle(
              color: HaircutColors.PRIMARY_COLOR,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10, bottom: 10),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return ItemListView(
                title: '$leftText',
                time: '$rightText',
                color: HaircutColors.PRIMARY_COLOR,
              );
            },
            itemCount: count,
          ),
        ),
      ],
    );
  }
}
