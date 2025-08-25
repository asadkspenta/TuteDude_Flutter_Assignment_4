import 'dart:math';
import 'package:flutter/material.dart';

class DiceProvider with ChangeNotifier {
  int _leftDice = 1;
  int _rightDice = 1;
  bool _isButtonPressed = false;

  final Random _random = Random();

  int get leftDice => _leftDice;
  int get rightDice => _rightDice;
  bool get isButtonPressed => _isButtonPressed;

  void rollDice() {
    _leftDice = _random.nextInt(6) + 1;
    _rightDice = _random.nextInt(6) + 1;
    _animateButton();
    notifyListeners();
  }

  void _animateButton() {
    _isButtonPressed = true;
    notifyListeners();
    Future.delayed(const Duration(milliseconds: 600), () {
      _isButtonPressed = false;
      notifyListeners();
    });
  }
}
