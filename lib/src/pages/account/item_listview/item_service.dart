import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/colors/haircut_colors.dart';
import 'package:haircut_delivery_shop/src/base_components/textfields/textfield.dart';

class ItemService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Checkbox(value: false, onChanged: (bool) {}),
                  Text(
                    'ตัดผมชาย',
                    style: TextStyle(
                      color: HaircutColors.PRIMARY_COLOR,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Row(
                children: <Widget>[
                  Text(
                    'เวลาที่ให้บริการ',
                    style: TextStyle(
                      color: HaircutColors.PRIMARY_COLOR,
                      fontSize: 12,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    width: 60,
                    height: 30,
                    child: TextField(
                      textAlign: TextAlign.center,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '',
                      ),
                    ),
                  ),
                  Text(
                    'นาที',
                    style: TextStyle(
                      color: HaircutColors.PRIMARY_COLOR,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 1,
          color: HaircutColors.PRIMARY_COLOR,
          margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            columnItemService('Booking', '200'),
            columnItemService('Delivery', '200'),
            columnItemService('ส่วนลดให้ลูกค้า', '200'),
          ],
        ),
      ],
    );
  }

  Column columnItemService(String title, String hint) {
    return Column(
      children: <Widget>[
        Text('$title'),
        TextFieldCustom(
          hint: '฿$hint',
          width: 70,
          height: 40,
        )
      ],
    );
  }
}
