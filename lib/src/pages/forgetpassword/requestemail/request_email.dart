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
              'กรุณากรอก Email',
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            child: Text(
              'เพื่อรับ Email สำหรับตั้งค่ารหัสผ่านใหม่',
              style: TextStyle(
                color: Colors.red,
                fontSize: 14,
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
            title: 'Submit',
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
