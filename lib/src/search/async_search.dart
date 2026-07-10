import '../models/typedefs.dart';
import 'search_engine.dart';

class AsyncSearchEngine<T>
    implements SearchEngine<T> {
  AsyncSearchEngine(
      this.searchFunction,
      );

  final AsyncSearch<T>
  searchFunction;

  @override
  Future<List<T>> search(
      String keyword,
      ) {
    return searchFunction(keyword);
  }
}