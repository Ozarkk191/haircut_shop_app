import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/round_width_height_button.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/text_back.dart';
import 'package:haircut_delivery_shop/src/base_components/textfields/textfield.dart';
import 'package:haircut_delivery_shop/src/pages/forgetpassword/reset_password.dart';

class RequestEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TextBack(),
          Container(
            child: Text(
              tr('forgot_password_otp_email_instruction'),
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          TextFieldCustom(
            hint: 'Email',
            width: 250,
            height: 40,
            marginTop: 80,
          ),
          RoundWidthHeightButton(
            title: tr('btn_submit'),
            callback: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResetPassword()));
            },
            width: 250,
            height: 40,
            marginTop: 20,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
