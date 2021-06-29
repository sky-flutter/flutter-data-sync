import 'package:flutter/material.dart';
import "package:cached_network_image/cached_network_image.dart";
import 'package:flutter_app/src/utils/strings.dart';
import 'package:flutter_app/src/widget/loading/loader.dart';

class CustomNetworkImage extends StatefulWidget {
  final String imageUrl;
  final double height, width;

  CustomNetworkImage(
      {@required this.imageUrl,
      this.height = 80,
      this.width: 80,});

  @override
  _CustomNetworkImageState createState() => _CustomNetworkImageState();
}

class _CustomNetworkImageState extends State<CustomNetworkImage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.imageUrl,
      height: widget.height,
      progressIndicatorBuilder: (BuildContext context, String url, progress) {
        return Loader();
      },
      errorWidget: (context, url, error) => Image.asset(AssetImages.errorImagePlaceHolder),
      width: widget.width,
      fit: BoxFit.cover,
    );
  }
}
