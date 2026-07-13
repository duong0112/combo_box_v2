import 'package:flutter/material.dart';

typedef DisplayText<ComboBoxItemModel> = String Function(ComboBoxItemModel item);

typedef ItemBuilder<ComboBoxItemModel> =
    Widget Function(BuildContext context, ComboBoxItemModel item, bool selected);

typedef AsyncSearch<ComboBoxItemModel> = Future<List<ComboBoxItemModel>> Function(String keyword);

typedef OnChanged<ComboBoxItemModel> = void Function(ComboBoxItemModel? value);

typedef OnMultiChanged<ComboBoxItemModel> = void Function(List<ComboBoxItemModel> values);
