import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/colors/haircut_colors.dart';

import '../constants/haircut_constants.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final Function callback;
  final double height;

  const CustomAppbar(
      {Key key,
      @required this.title,
      @required this.callback,
      this.height = 100})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      decoration: new BoxDecoration(
        color: HaircutColors.PRIMARY_COLOR,
        borderRadius: new BorderRadius.only(
          bottomLeft: const Radius.circular(APPBAR_ROUND_CORNER),
          bottomRight: const Radius.circular(APPBAR_ROUND_CORNER),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 2.0, // soften the shadow
            spreadRadius: 0.0, //extend the shadow
            offset: Offset(
              0.0, // Move to right 10  horizontally
              0.0, // Move to bottom 10 Vertically
            ),
          )
        ],
      ),
      child: Center(
        child: Stack(
          children: <Widget>[
            InkWell(
              onTap: callback,
              child: Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.only(left: 20, bottom: 25),
                child: Image.asset('assets/images/ic_back.png'),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 25),
              child: Text(
                '$title',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
