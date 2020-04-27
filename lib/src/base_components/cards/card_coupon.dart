import 'package:flutter/material.dart';

class CardCoupon extends StatelessWidget {
  final String couponImageUrl;
  final String couponTitle;
  final String couponContent;
  final double couponPrice;

  const CardCoupon({
    Key key,
    @required this.couponImageUrl,
    @required this.couponTitle,
    @required this.couponContent,
    @required this.couponPrice,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.only(left: 20),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      child: Container(
        height: 120,
        width: MediaQuery.of(context).size.width / 2,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
            children: <Widget>[
              Container(
                width: 100,
                height: 120,
                child: Image.network(
                  '$couponImageUrl',
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('$couponTitle'),
                    Text(
                      '${couponPrice.toString()}฿',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(2, 0, 2, 0),
                      child: Text(
                        '$couponContent',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    _getCode(context: context),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _getCode({@required BuildContext context}) {
    return Container(
      height: 17,
      width: 50,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 0),
        color: Theme.of(context).primaryColor,
        onPressed: () {},
        child: Text(
          'เก็บโค้ด',
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
