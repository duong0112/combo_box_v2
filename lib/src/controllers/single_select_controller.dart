import 'package:flutter/foundation.dart';

import '../models/combo_box_item_model.dart';
import 'combo_box_controller.dart';

class SingleSelectController
    extends ChangeNotifier
    implements ComboBoxController {
  bool _isOpen = false;

  ComboBoxItemModel? _value;

  bool get hasValue => _value != null;

  ComboBoxItemModel? get value => _value;

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

  void select(ComboBoxItemModel item) {
    _value = item;
    notifyListeners();
  }

  void clear() {
    _value = null;
    notifyListeners();
  }
}