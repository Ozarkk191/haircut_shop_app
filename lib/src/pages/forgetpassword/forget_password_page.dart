import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/round_width_height_button.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/text_back.dart';
import 'package:haircut_delivery_shop/src/pages/forgetpassword/requestemail/request_email.dart';
import 'package:haircut_delivery_shop/src/pages/forgetpassword/requestotp/request_otp.dart';

class ForgetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextBack(),
          Container(
            alignment: Alignment.center,
            child: Text(
              tr('forgot_password_title'),
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
          RoundWidthHeightButton(
            title: 'OTP',
            callback: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RequestOTP()));
            },
            width: 250,
            height: 40,
            marginTop: 20,
            textColor: Colors.white,
          ),
          RoundWidthHeightButton(
            title: 'Email',
            callback: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RequestEmail()));
            },
            width: 250,
            height: 40,
            marginTop: 20,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
