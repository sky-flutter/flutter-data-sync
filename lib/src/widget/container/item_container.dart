import 'package:flutter/material.dart';
import 'package:flutter_app/src/theme/color.dart';
import 'package:flutter_app/src/widget/border/border.dart';

class MyItemContainer extends StatelessWidget {
  Widget children;
  EdgeInsets margin, padding;
  Color outlineColor, shadowColor;

  MyItemContainer(
      {this.children,
      this.margin,
      this.shadowColor = MyColors.color_FFFFFF,
      this.padding,
      this.outlineColor = MyColors.color_FFFFFF});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          border: Border.all(color: outlineColor, width: 1),
          color: Colors.white,
          borderRadius: MyBorder.commonBorderRadius(),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]),
      child: children,
    );
  }
}
