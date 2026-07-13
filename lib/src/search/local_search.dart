import '../models/combo_box_item_model.dart';
import '../models/typedefs.dart';
import 'search_engine.dart';

class LocalSearch implements SearchEngine {
  LocalSearch({required this.items, required this.displayText});

  final List<ComboBoxItemModel> items;

  final DisplayText<ComboBoxItemModel> displayText;

  @override
  Future<List<ComboBoxItemModel>> search(String keyword) async {
    if (keyword.isEmpty) {
      return items;
    }

    return items.where((e) {
      return displayText(e).toLowerCase().contains(keyword.toLowerCase());
    }).toList();
  }

}
