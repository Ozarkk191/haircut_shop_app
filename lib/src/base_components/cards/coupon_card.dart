import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/constants/haircut_enum.dart';
import 'package:haircut_delivery_shop/src/base_components/loadings/loading_indicator.dart';

class CouponCard extends StatelessWidget {
  final String couponImageUrl;
  final DiscountType discountType;
  final double discountValue;
  final String couponTitle;
  final String couponContent;
  final double width;
  final double height;

  const CouponCard({
    Key key,
    @required this.couponImageUrl,
    this.discountType = DiscountType.PRICE,
    this.discountValue = 0,
    @required this.couponTitle,
    @required this.couponContent,
    this.width = 100,
    this.height = 120,
  })  : assert(couponImageUrl != null),
        assert(couponTitle != null),
        assert(couponContent != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 3.0,
            offset: Offset(
              0, // horizontal, move right 10
              1.0, // vertical, move down 10
            ),
          ),
        ],
      ),
      height: height,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(0),
              width: width,
              height: height,
              child: CachedNetworkImage(
                imageUrl: couponImageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => LoadingIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              color: Colors.white,
              child: discountType == DiscountType.FREE
                  ? _buildFreeType(context: context)
                  : _buildDiscountType(context: context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFreeType({@required BuildContext context}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          couponTitle,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            height: 1,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          couponContent,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            height: 1,
          ),
          textAlign: TextAlign.center,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
        _getCode(context: context),
      ],
    );
  }

  Widget _buildDiscountType({@required BuildContext context}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'ส่วนลด',
          style: TextStyle(
            height: 1,
            color: Colors.black,
          ),
        ),
        Text(
          _showDiscount(),
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            height: 1,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'ยกเว้นบริการ',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            height: 1,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'ที่มีโปรโมชั่น',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            height: 1,
          ),
          textAlign: TextAlign.center,
        ),
        _getCode(context: context),
      ],
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

  String _showDiscount() {
    String discount = discountValue.toString();
    String unitType = '';

    discountType == DiscountType.PERCENT ? unitType = '%' : unitType = '฿';

    return discount + unitType;
  }
}
