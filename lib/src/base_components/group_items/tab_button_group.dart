import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/group_items/tab_button_item.dart';

class TabButtonGroup extends StatelessWidget {
  final String title1;
  final String title2;

  const TabButtonGroup({
    Key key,
    this.title1 = 'Booking',
    this.title2 = 'Service done',
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        TabButtonItem(
          isActive: true,
          callback: () {},
          title: '$title1',
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
          ),
        ),
        // TabButtonItem(
        //   callback: () {},
        //   title: 'Delivery',
        // ),
        TabButtonItem(
          callback: () {},
          title: '$title2',
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
          ),
        ),
      ],
    );
  }
}
