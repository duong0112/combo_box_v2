import 'package:flutter/material.dart';

typedef DisplayText<T> = String Function(T item);

typedef ItemBuilder<T> = Widget Function(
  BuildContext context,
  T item,
  bool selected,
);

typedef AsyncSearch<T> = Future<List<T>> Function(
  String keyword,
);

typedef OnChanged<T> = void Function(
  T? value,
);

typedef OnMultiChanged<T> = void Function(
  List<T> values,
);
