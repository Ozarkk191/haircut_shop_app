import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/transitions/marketplace_text_styles.dart';

TextStyle textStyleWithLocale({
  @required BuildContext context,
  FontWeight fontWeight = FontWeight.normal,
  double fontSize = 14,
  Color color,
  TextDecoration decoration = TextDecoration.none,
  double height,
}) {
  String languageCode = Localizations.localeOf(context).languageCode;

  return MarketPlaceTextStyles.withLocale(
    color: color,
    languageCode: languageCode,
    fontWeight: fontWeight,
    size: fontSize,
    decoration: decoration,
    height: height,
  );
}
