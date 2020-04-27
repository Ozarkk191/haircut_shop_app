import 'package:flutter/material.dart';

import '../../../base_components/colors/haircut_colors.dart';

class ItemBookingService extends StatelessWidget {
  final String title;
  final String price;

  const ItemBookingService(
      {Key key, @required this.title, @required this.price})
      : assert(title != null || price != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '$title',
                style: TextStyle(
                  fontSize: 16,
                  color: HaircutColors.PRIMARY_COLOR,
                ),
              ),
              Text(
                '฿$price',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
