import 'package:flutter/cupertino.dart';

class WallpaperBgWidgets extends StatelessWidget {
  String imgUrls;
  double? mWidth;
  double? mHeight;

  WallpaperBgWidgets(
      {super.key, required this.imgUrls, this.mHeight = 220, this.mWidth = 150});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mHeight,
      width: mWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        image: DecorationImage(
            image: NetworkImage(
              imgUrls,
            ),
            fit: BoxFit.cover),
      ),
    );
  }
}
