import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/round_width_height_button.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/text_back.dart';
import 'package:haircut_delivery_shop/src/base_components/textfields/textfield.dart';
import 'package:haircut_delivery_shop/src/pages/forgetpassword/reset_password.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class RequestOTP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TextBack(),
          Container(
            child: Text(
              tr('forgot_password_otp_phone_instruction'),
              style: TextStyle(color: Colors.red, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          TextFieldCustom(
            hint: tr('forgot_password_otp_phone'),
            width: 250,
            height: 40,
            marginTop: 20,
          ),
          RoundWidthHeightButton(
            title: tr('forgot_password_otp_request_button'),
            callback: () {},
            width: 250,
            height: 40,
            textColor: Colors.grey,
            backgroundColor: Color(0xffcccccc),
            marginTop: 20,
          ),
          Container(
            margin: EdgeInsets.only(top: 100),
            child: PinCodeTextField(
              pinBoxHeight: 60,
              pinBoxWidth: 60,
              defaultBorderColor: Colors.transparent,
              hasTextBorderColor: Colors.transparent,
              pinBoxRadius: 10,
              wrapAlignment: WrapAlignment.center,
              pinBoxColor: Color(0xffeeeeee),
              pinTextStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          RoundWidthHeightButton(
            title: tr('forgot_password_otp_submit_button'),
            callback: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResetPassword()));
            },
            width: 250,
            height: 40,
            textColor: Colors.grey,
            backgroundColor: Color(0xffcccccc),
            marginTop: 20,
          ),
        ],
      ),
    );
  }
}
