import 'package:flutter/material.dart';

class MyBorder {
  static transparentTextFieldBorder() {
    return OutlineInputBorder(borderSide: BorderSide(width: 0, color: Colors.transparent));
  }

  static commonBorderRadius() {
    return BorderRadius.circular(16);
  }
}
