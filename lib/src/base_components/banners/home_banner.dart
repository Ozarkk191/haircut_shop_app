import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:haircut_delivery_shop/src/base_components/loadings/loading_indicator.dart';

class HomeBanner extends StatelessWidget {
  final List<String> sliderImages;
  final double height;

  const HomeBanner({Key key, @required this.sliderImages, this.height = 250})
      : assert(sliderImages.length > 0),
        assert(sliderImages != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return CachedNetworkImage(
            imageUrl: sliderImages[index],
            fit: BoxFit.fill,
            placeholder: (context, url) => LoadingIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          );
        },
        itemCount: sliderImages.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}
