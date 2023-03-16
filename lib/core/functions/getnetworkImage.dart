import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:dashbord/core/constant/SizeConfig.dart';
import 'package:lottie/lottie.dart';

GetnetworkImage({required imageUri, imageSize = null}) {
  return Builder(builder: (context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: CachedNetworkImage(
        errorWidget: (context, url, error) {
          return Center(
            child: Text('not found'),
          );
        },
        // fit: BoxFit.scaleDown,
        imageUrl: '$imageUri',
        fadeInDuration: Duration(seconds: 2),
        placeholderFadeInDuration: Duration(seconds: 1),
        fadeOutDuration: Duration(seconds: 2),
        imageBuilder: (context, imageProvider) => Container(
          width: imageSize ?? SizeConfig(context).widthScreen / 4,
          height: imageSize ?? SizeConfig(context).heigthScreen / 4,
          decoration: BoxDecoration(
            // color: Colors.red,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: imageProvider,
              // fit: BoxFit.fitHeight,
            ),
          ),
        ),
        progressIndicatorBuilder: (context, url, downloadProgress) => Container(
          alignment: Alignment.center,
          width: SizeConfig(context).widthScreen / 4,
          height: SizeConfig(context).heigthScreen / 4,
          child: Lottie.asset('assets/lottie/loading.json'),
        ),
      ),
    );
  });
}
