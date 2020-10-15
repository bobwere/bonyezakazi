import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PortfolioGalleryImageWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onImageTap;

  const PortfolioGalleryImageWidget(
      {Key key, @required this.imagePath, @required this.onImageTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.h)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.h)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onImageTap,
            child: CachedNetworkImage(
              imageUrl: imagePath,
              fadeOutDuration: const Duration(milliseconds: 250),
              fadeInDuration: const Duration(milliseconds: 250),
              placeholderFadeInDuration: const Duration(milliseconds: 50),
              placeholder: (context, url) =>
                  Container(color: randomChoice(kPlaceHolderColors)),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class PortfolioGalleryShimmerImageWidget extends StatelessWidget {
  const PortfolioGalleryShimmerImageWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.h)),
      ),
    );
  }
}
