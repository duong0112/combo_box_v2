import '../core/debounce.dart';
import '../models/combo_box_item_model.dart';
import 'search_engine.dart';

class SearchControllerCustom {
  SearchControllerCustom({
    required this.engine,
    Duration debounceDuration = const Duration(milliseconds: 300),
  }) : _debounce = Debounce(duration: debounceDuration);

  final SearchEngine engine;

  final Debounce _debounce;

  Future<void> search(
      {required String keyword, required List<ComboBoxItemModel> items, required Function(List<ComboBoxItemModel> result) onResult}) async {
    _debounce.run(() async {
      final result = await engine.search(keyword);
      onResult(result);
    });
  }

  void dispose() {
    _debounce.dispose();
  }
}
