import 'package:flutter/material.dart';

class ItemPromotionBanner extends StatelessWidget {
  final String imageUrl;

  const ItemPromotionBanner({Key key, @required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
      width: 200,
      height: 120,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Image.network('$imageUrl', fit: BoxFit.cover),
      ),
    );
  }
}
