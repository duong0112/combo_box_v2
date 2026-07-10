import 'package:flutter/foundation.dart';

import 'combo_box_controller.dart';

class SingleSelectController<T>
    extends ChangeNotifier
    implements ComboBoxController {
  bool _isOpen = false;

  T? _value;

  bool get hasValue => _value != null;

  T? get value => _value;

  @override
  bool get isOpen => _isOpen;

  @override
  void open() {
    _isOpen = true;
    notifyListeners();
  }

  @override
  void close() {
    _isOpen = false;
    notifyListeners();
  }

  @override
  void toggle() {
    _isOpen = !_isOpen;
    notifyListeners();
  }

  void select(T item) {
    _value = item;
    notifyListeners();
  }

  void clear() {
    _value = null;
    notifyListeners();
  }
}