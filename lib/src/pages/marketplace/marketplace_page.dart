import 'package:flutter/material.dart';

import '../../base_components/appbars/custom_appbar.dart';
import '../../base_components/constants/haircut_constants.dart';

class MarketPlacePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Text('Coming soon'),
          ),
          CustomAppbar(
            title: 'Marketplace',
            callback: () {},
            height: TOOL_BAR_HEIGHT,
          ),
        ],
      ),
    );
  }
}
