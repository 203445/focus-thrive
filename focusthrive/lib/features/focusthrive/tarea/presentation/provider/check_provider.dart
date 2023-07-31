import 'package:flutter/foundation.dart';

class CheckboxStateNotifier extends ChangeNotifier {
  bool _isChecked = false;

  bool get isChecked => _isChecked;

  void toggleCheckbox(bool value) {
    _isChecked = value;
    notifyListeners();
  }
}
