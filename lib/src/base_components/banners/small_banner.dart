import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/loadings/loading_indicator.dart';

class SmallBanner extends StatelessWidget {
  final String imageUrl;
  final double height;

  const SmallBanner({Key key, @required this.imageUrl, this.height = 130})
      : assert(imageUrl != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: height,
      width: MediaQuery.of(context).size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.fill,
            placeholder: (context, url) => LoadingIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
