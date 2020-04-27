import 'package:flutter/material.dart';

import '../../../base_components/switches/two_color_switch.dart';
import '../../bookinginfo/booking_info_page.dart';
import 'item_dashboard.dart';

class ItemExpansion extends StatelessWidget {
  final bool value;
  final String time;
  const ItemExpansion({Key key, @required this.value, @required this.time})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: ExpansionTile(
        children: <Widget>[
          buildInkWell(context),
          buildInkWell(context),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(time),
            TwoColorSwitch(
              onChanged: (value) {},
              value: value,
              inactiveColor: Colors.grey,
            )
          ],
        ),
      ),
    );
  }

  InkWell buildInkWell(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BookingInfoPage()));
      },
      child: ItemDashBoard(),
    );
  }
}
