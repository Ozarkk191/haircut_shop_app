import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/app.dart';

void main() => runApp(
      EasyLocalization(
        child: App(),
        supportedLocales: [
          Locale('en', 'US'),
          Locale('th', 'TH'),
        ],
        path: 'assets/strings',
        fallbackLocale: Locale('en', 'US'),
      ),
    );
