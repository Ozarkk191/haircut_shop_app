import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/avatar/default_avatar.dart';
import 'package:haircut_delivery_shop/src/base_components/loadings/loading_indicator.dart';

class ShopAddressCard extends StatelessWidget {
  final String imageUrl;
  final double imageWidth;
  final double imageHeight;
  final String shopName;
  final String shopAddress;
  final double distance;
  final double rating;

  const ShopAddressCard({
    Key key,
    this.imageUrl,
    this.imageWidth = 130,
    this.imageHeight = 120,
    @required this.shopName,
    this.distance = 1,
    this.rating = 0,
    @required this.shopAddress,
  })  : assert(shopName != null),
        assert(shopAddress != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(right: 10),
        child: Row(
          children: <Widget>[
            Container(
              child: imageUrl != null
                  ? CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => LoadingIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )
                  : DefaultAvatar(
                      width: imageWidth,
                      height: imageHeight,
                    ),
              width: imageWidth,
              height: imageHeight,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ClipOval(
                              child: Container(
                                color: Colors.green,
                                width: 10,
                                height: 10,
                              ),
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                '$shopName',
                                style: TextStyle(
                                  color: Color(0xff707070),
                                  fontSize: 18,
                                  height: 1,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '$distance km',
                        style: TextStyle(
                          height: 1,
                          color: Color(0xff707070),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 3),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.asset('assets/images/ic_marker_2.png'),
                            SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                '$shopAddress',
                                style: TextStyle(
                                  color: Color(0xff707070),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/images/ic_calendar.png',
                      )
                    ],
                  ),
                  SizedBox(height: 3),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 16,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '$rating',
                        style: TextStyle(
                          color: Color(0xff707070),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
