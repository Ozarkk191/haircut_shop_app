import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/custom_round_button.dart';
import 'package:haircut_delivery_shop/src/base_components/colors/haircut_colors.dart';

class StatusWithdrawButton extends StatelessWidget {
  final String title;
  final Function callback;
  final bool isComplete;
  final double fontSize;

  const StatusWithdrawButton({
    Key key,
    @required this.title,
    @required this.callback,
    this.isComplete = true,
    this.fontSize = 12,
  })  : assert(title != null),
        assert(callback != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: CustomRoundButton(
        padding: EdgeInsets.symmetric(horizontal: 20),
        backgroundColor:
            isComplete ? Color(0xff1DAD1D) : HaircutColors.PRIMARY_COLOR,
        radius: 20,
        callback: callback,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            // fontFamily: 'Prompt',
          ),
        ),
      ),
    );
  }
}
