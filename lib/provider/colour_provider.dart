import 'dart:math';
import 'package:flutter/material.dart';

class ColorProvider with ChangeNotifier {
  Color _color = Colors.white;

  Color get color => _color;

  void changeColor() {
    _color = Color.fromARGB(
      255,
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
    );
    notifyListeners();
  }
}
