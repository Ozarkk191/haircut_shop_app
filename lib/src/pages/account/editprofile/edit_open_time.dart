import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/appbars/custom_appbar.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/round_width_height_button.dart';
import 'package:haircut_delivery_shop/src/base_components/colors/haircut_colors.dart';
import 'package:haircut_delivery_shop/src/pages/account/item_listview/item_edit_open_time.dart';

class EditOpenTime extends StatelessWidget {
  final List<String> items = [
    tr('account_monday'),
    tr('account_tuesday'),
    tr('account_wednesday'),
    tr('account_thursday'),
    tr('account_friday'),
    tr('account_saturday'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CustomAppbar(
            callback: () {
              Navigator.pop(context);
            },
            title: tr('account_open_data'),
          ),
          buildContainer(),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
            height: 350,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ItemEditOpenTime(
                  title: items[index],
                );
              },
              itemCount: items.length,
            ),
          ),
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
    );
  }

  Container buildContainer() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Text(
        tr('account_open_time'),
        style: TextStyle(
            color: HaircutColors.PRIMARY_COLOR,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
