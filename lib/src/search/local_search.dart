import '../models/typedefs.dart';
import 'search_engine.dart';

class LocalSearch<T>
    implements SearchEngine<T> {
  LocalSearch({
    required this.items,
    required this.displayText,
  });

  final List<T> items;

  final DisplayText<T> displayText;

  @override
  Future<List<T>> search(
      String keyword,
      ) async {
    if (keyword.isEmpty) {
      return items;
    }

    return items.where((e) {
      return displayText(e)
          .toLowerCase()
          .contains(
        keyword.toLowerCase(),
      );
    }).toList();
  }
}