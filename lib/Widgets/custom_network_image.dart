import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../Utilities/theme_helper.dart';
import '../generated/assets.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? url;
  final double? radius;
  final double width, height;
  final BoxFit fit;



  const CustomNetworkImage({
    Key? key,
    required this.url,
    required this.width,
    required this.height,
    this.radius,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (url == null) {
      print("Image URL: $url");

      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey,),
          borderRadius: BorderRadius.circular(radius ?? 8.r),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius ?? 8.r),
          // child: Image.asset(
          //   Assets.i
          //   width: width,
          //   height: height,
          //   fit: fit,
          // ),
        ),
      );
    }
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 8.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 8.r),
        child: Image.network(
          url!,
          width: width,
          height: height,
          fit: fit,
          loadingBuilder: (context, child, ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            if (loadingProgress.expectedTotalBytes == null) {
              return SizedBox(
                height: height/2,
                width: width/2,
                child: Center(
                  child: CircularProgressIndicator(
                    color: ThemeClass.of(context).primaryColor,

                  ),
                ),
              );
            }
            return Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: ThemeClass.of(context).background,
                borderRadius: BorderRadius.circular(radius ?? 8.r),
              ),
              alignment: Alignment.center,
              child: Center(
                child: CircularProgressIndicator(
                    color: ThemeClass.of(context).primaryColor,
                    value: loadingProgress.expectedTotalBytes == null
                        ? null
                        : loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!),
              ),
            );
          },
          errorBuilder: (context, error, _) {
            return Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: ThemeClass.of(context).background,
                borderRadius: BorderRadius.circular(radius ?? 8.r),
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.broken_image_outlined,
                color: ThemeClass.of(context).primaryColor,
                size: height / 3,
              ),
            );
          },
        ),
      ),
    );
  }
}