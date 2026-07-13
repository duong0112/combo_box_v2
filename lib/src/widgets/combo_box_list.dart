import 'package:flutter/material.dart';

import '../models/combo_box_item_model.dart';
import '../models/typedefs.dart';
import 'combo_box_item.dart';

class ComboBoxList extends StatelessWidget {
  const ComboBoxList({
    super.key,
    required this.items,
    required this.displayText,
    required this.highlightedIndex,
    required this.valueSelected,
    required this.onSelected,
    required this.scrollController,
    required this.itemBuilder,
    required this.textStyle,
    required this.textStyleSelected,
    required this.bgColorSelected,
    required this.heightItem,
  });

  final List<ComboBoxItemModel> items;

  final DisplayText<ComboBoxItemModel> displayText;

  final int highlightedIndex;

  final Color? bgColorSelected;

  final int? valueSelected;

  final ValueChanged<ComboBoxItemModel> onSelected;

  final ScrollController scrollController;

  final ItemBuilder<ComboBoxItemModel>? itemBuilder;

  final TextStyle? textStyle;

  final TextStyle? textStyleSelected;

  final double heightItem;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: items.length,
      itemBuilder: (_, index) {
        final item = items[index];
        final selected = items[index].value == valueSelected;

        if (itemBuilder != null) {
          return InkWell(
            onTap: () {
              onSelected(item);
            },
            child: itemBuilder!(context, item, selected),
          );
        }

        return ComboBoxItem(
          item: item,
          title: displayText(item),
          selected: selected,
          textStyle: textStyle,
          textStyleSelected: textStyleSelected,
          bgColorSelected: bgColorSelected,
          highlighted: highlightedIndex == index,
          heightItem: heightItem,
          onTap: () {
            onSelected(item);
          },
        );
      },
    );
  }
}
