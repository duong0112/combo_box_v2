import '../core/debounce.dart';
import 'search_engine.dart';

class SearchControllerCustom<T> {
  SearchControllerCustom({
    required this.engine,
    Duration debounceDuration =
    const Duration(
      milliseconds: 300,
    ),
  }) : _debounce = Debounce(
    duration:
    debounceDuration,
  );

  final SearchEngine<T> engine;

  final Debounce _debounce;

  Future<void> search({
    required String keyword,
    required Function(
        List<T> result,
        ) onResult,
  }) async {
    _debounce.run(() async {
      final result =
      await engine.search(
        keyword,
      );

      onResult(result);
    });
  }

  void dispose() {
    _debounce.dispose();
  }
}