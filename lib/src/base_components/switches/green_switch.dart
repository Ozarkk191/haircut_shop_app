import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/colors/haircut_colors.dart';

class GreenSwitch extends StatelessWidget {
  final Function onChanged;
  final bool value;

  const GreenSwitch({Key key, @required this.onChanged, @required this.value})
      : assert(value != null),
        assert(onChanged != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onChanged,
      activeTrackColor: HaircutColors.LANGUAGE_SWITCH_COLOR,
      activeColor: Colors.white,
      inactiveTrackColor: HaircutColors.LANGUAGE_SWITCH_COLOR,
      inactiveThumbColor: Colors.white,
    );
  }
}
