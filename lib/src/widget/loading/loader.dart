
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  EdgeInsets margin;

  Loader({this.margin});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: margin,
        width: 36,
        height: 36,
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class ProgressLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Loader(),
    );
  }
}
