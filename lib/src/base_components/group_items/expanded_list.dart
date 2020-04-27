import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/list_items/address_item.dart';

class ExpandedList extends StatelessWidget {
  final String title;
  final List<AddressItem>
      children; // เปลี่ยน type ของ item เป็นสิ่งที่จะแสดงเป็นไอเทมลูกใน expanded list
  final Image icon;

  const ExpandedList(
      {Key key, @required this.title, @required this.children, this.icon})
      : assert(title != null),
        assert(children != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Row(
        children: <Widget>[
          icon != null ? icon : Container(width: 0, height: 0),
          SizedBox(width: 5),
          Text(
            '$title',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
      children: children
          .map((item) => AddressItem(
                address: item.address,
                addressTitle: item.addressTitle,
              ))
          .toList(),
    );
  }
}
