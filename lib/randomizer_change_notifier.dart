import 'dart:math';

import 'package:flutter/foundation.dart';

class RandomizerChangeNotifier extends ChangeNotifier {
  int min = 0;
  int max = 0;

  final _randomGenerator = Random();

  int? _generatedNumber;

  int? get generatedNumber => _generatedNumber;

  void generateNumber() {
    _generatedNumber = _randomGenerator.nextInt(max + 1 - min) + min;
    notifyListeners();
  }
}
