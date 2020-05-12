import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/round_width_height_button.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/text_back.dart';
import 'package:haircut_delivery_shop/src/base_components/textfields/textfield.dart';

class ResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TextBack(),
          Container(
            child: Text(
              tr('reset_password_title'),
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
            ),
          ),
          TextFieldCustom(
            hint: tr('reset_password_password'),
            width: 250,
            height: 40,
            marginTop: 20,
          ),
          TextFieldCustom(
            hint: tr('reset_password_repeat_password'),
            width: 250,
            height: 40,
            marginTop: 20,
          ),
          RoundWidthHeightButton(
            title: tr('btn_submit'),
            callback: () {},
            width: 250,
            height: 40,
            textColor: Colors.white,
            marginTop: 20,
          ),
        ],
      ),
    );
  }
}
