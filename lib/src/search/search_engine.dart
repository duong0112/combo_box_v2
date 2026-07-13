import '../models/combo_box_item_model.dart';

abstract class SearchEngine {
  Future<List<ComboBoxItemModel>> search(String keyword);
}
