import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/appbars/custom_appbar.dart';

import 'package:haircut_delivery_shop/src/base_components/buttons/round_width_height_button.dart';
import 'package:haircut_delivery_shop/src/base_components/colors/haircut_colors.dart';
import 'package:haircut_delivery_shop/src/pages/account/item_listview/item_edit_delivery.dart';

class EditOutside extends StatelessWidget {
  final List<String> itemsKm = [
    'ค่าเดินทาง 0 - 3 km',
    'ค่าเดินทาง 3.1 - 5 km',
    'ค่าเดินทาง 5.1 - 10 km',
    'ค่าเดินทาง 10.1 - 20 km',
    'ค่าเดินทาง 20 km +',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CustomAppbar(
              callback: () {
                Navigator.pop(context);
              },
              title: 'Delivery',
            ),
            buildContainer(),
            checkDelivery(),
            listViewContainer(),
            SizedBox(height: 20),
            RoundWidthHeightButton(
              title: tr('btn_save'),
              callback: () {
                Navigator.pop(context);
              },
              textColor: Colors.white,
              backgroundColor: HaircutColors.PRIMARY_COLOR,
              height: 40,
              width: 200,
            ),
          ],
        ),
      ),
    );
  }

  Container listViewContainer() {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return ItemEditDelivery(
            title: itemsKm[index],
            price: '${index + 1}' + '0',
          );
        },
        itemCount: itemsKm.length,
      ),
    );
  }

  Row checkDelivery() {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Checkbox(value: false, onChanged: (value) {}),
        ),
        Text(
          tr('account_accept_service'),
          style: TextStyle(
            color: HaircutColors.PRIMARY_COLOR,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Container buildContainer() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Text(
        tr('account_offsite_service'),
        style: TextStyle(
            color: HaircutColors.PRIMARY_COLOR,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
