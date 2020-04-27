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
              'Reset Password',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
            ),
          ),
          TextFieldCustom(
            hint: 'Password',
            width: 250,
            height: 40,
            marginTop: 20,
          ),
          TextFieldCustom(
            hint: 'Password (Repeat)',
            width: 250,
            height: 40,
            marginTop: 20,
          ),
          RoundWidthHeightButton(
            title: 'Submit',
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
