import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/custom_round_button.dart';
import 'package:haircut_delivery_shop/src/base_components/colors/haircut_colors.dart';

class AddLocationButton extends StatelessWidget {
  final String title;
  final Function callback;
  final bool isActive;

  const AddLocationButton({
    Key key,
    @required this.title,
    @required this.callback,
    this.isActive = true,
  })  : assert(title != null),
        assert(callback != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 31,
      child: CustomRoundButton(
        padding: EdgeInsets.symmetric(horizontal: 20),
        backgroundColor:
            isActive ? HaircutColors.PRIMARY_COLOR : HaircutColors.GREY_BUTTON,
        radius: 15,
        callback: callback,
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : HaircutColors.PRIMARY_FONT,
            fontSize: 15,
            // fontFamily: 'Prompt',
          ),
        ),
      ),
    );
  }
}
