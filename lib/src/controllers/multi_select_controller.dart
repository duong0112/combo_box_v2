import 'package:flutter/foundation.dart';

import '../models/combo_box_item_model.dart';
import 'combo_box_controller.dart';

class MultiSelectController extends ChangeNotifier implements ComboBoxController {
  bool _isOpen = false;

  final Set<ComboBoxItemModel> _selectedItems = {};

  @override
  bool get isOpen => _isOpen;

  List<ComboBoxItemModel> get values => _selectedItems.toList();

  bool contains(ComboBoxItemModel item) {
    return _selectedItems.contains(item);
  }

  void select(ComboBoxItemModel item) {
    _selectedItems.add(item);

    notifyListeners();
  }

  void unSelect(ComboBoxItemModel item) {
    _selectedItems.remove(item);

    notifyListeners();
  }

  void toggleItem(ComboBoxItemModel item) {
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
