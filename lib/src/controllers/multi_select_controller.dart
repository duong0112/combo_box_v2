import 'package:flutter/foundation.dart';

import 'combo_box_controller.dart';

class MultiSelectController<T>
    extends ChangeNotifier
    implements ComboBoxController {
  bool _isOpen = false;

  final Set<T> _selectedItems = {};

  @override
  bool get isOpen => _isOpen;

  List<T> get values => _selectedItems.toList();

  bool contains(T item) {
    return _selectedItems.contains(item);
  }

  void select(T item) {
    _selectedItems.add(item);

    notifyListeners();
  }

  void unSelect(T item) {
    _selectedItems.remove(item);

    notifyListeners();
  }

  void toggleItem(T item) {
    if (_selectedItems.contains(item)) {
      _selectedItems.remove(item);
    } else {
      _selectedItems.add(item);
    }

    notifyListeners();
  }

  void clear() {
    _selectedItems.clear();

    notifyListeners();
  }

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
}