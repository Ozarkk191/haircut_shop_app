import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/textfields/textfield.dart';

class ItemEditDelivery extends StatelessWidget {
  final String title;
  final String price;

  const ItemEditDelivery({Key key, this.title, this.price}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('$title'),
          TextFieldCustom(
            hint: '$price',
            width: 70,
            height: 40,
          )
        ],
      ),
    );
  }
}
