import 'package:flutter/material.dart';

Color getColorByinitial(String initial) {
  print(initial.codeUnitAt(0).toInt());
  if (initial.codeUnitAt(0) >= 65 && initial.codeUnitAt(0) <= 70 ||
      initial.codeUnitAt(0) >= 97 && initial.codeUnitAt(0) <= 101) {
    return Colors.orange;
  } else if (initial.codeUnitAt(0) >= 71 && initial.codeUnitAt(0) <= 75 ||
      initial.codeUnitAt(0) >= 102 && initial.codeUnitAt(0) <= 106) {
    return Colors.green;
  } else if (initial.codeUnitAt(0) >= 76 && initial.codeUnitAt(0) <= 81 ||
      initial.codeUnitAt(0) >= 107 && initial.codeUnitAt(0) <= 111) {
    return Colors.blue;
  } else if (initial.codeUnitAt(0) >= 82 && initial.codeUnitAt(0) <= 86 ||
      initial.codeUnitAt(0) >= 112 && initial.codeUnitAt(0) <= 116) {
    return Colors.purple;
  } else if (initial.codeUnitAt(0) >= 87 && initial.codeUnitAt(0) <= 90 ||
      initial.codeUnitAt(0) >= 117 && initial.codeUnitAt(0) <= 122) {
    return Colors.deepPurple;
  }
  return Colors.redAccent;
}
