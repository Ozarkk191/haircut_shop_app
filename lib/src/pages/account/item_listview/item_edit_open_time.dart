import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/textfields/textfield.dart';

class ItemEditOpenTime extends StatelessWidget {
  final String title;

  const ItemEditOpenTime({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Checkbox(value: false, onChanged: (bool value) {}),
            Text('$title')
          ],
        ),
        Row(
          children: <Widget>[
            TextFieldCustom(
              hint: '00:00',
              height: 30,
              width: 60,
            ),
            Text(' - '),
            TextFieldCustom(
              hint: '00:00',
              height: 30,
              width: 60,
            ),
          ],
        ),
      ],
    );
  }
}
