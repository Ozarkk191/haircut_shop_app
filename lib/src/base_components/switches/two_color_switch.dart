import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/colors/haircut_colors.dart';

class TwoColorSwitch extends StatelessWidget {
  final Function onChanged;
  final bool value;
  final Color activeColor;
  final Color inactiveColor;

  const TwoColorSwitch({
    Key key,
    @required this.onChanged,
    @required this.value,
    this.activeColor = HaircutColors.LANGUAGE_SWITCH_COLOR,
    this.inactiveColor = HaircutColors.LANGUAGE_SWITCH_COLOR,
  })  : assert(value != null),
        assert(onChanged != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onChanged,
      activeTrackColor: activeColor,
      activeColor: Colors.white,
      inactiveTrackColor: inactiveColor,
      inactiveThumbColor: Colors.white,
    );
  }
}
