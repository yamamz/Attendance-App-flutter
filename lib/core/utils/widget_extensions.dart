import 'package:flutter/material.dart';

extension ExtendedWidget on Widget {
  Widget paddingAll(double size) {
    return Padding(
      padding: EdgeInsets.all(size),
      child: this,
    );
  }
}
