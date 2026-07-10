import 'package:flutter/material.dart';

import '../models/typedefs.dart';
import 'combo_box_item.dart';

class ComboBoxList<T>
    extends StatelessWidget {
  const ComboBoxList({
    super.key,
    required this.items,
    required this.displayText,
    required this.highlightedIndex,
    required this.selectedItem,
    required this.onSelected,
    required this.scrollController,
    required this.itemBuilder,
  });

  final List<T> items;

  final DisplayText<T> displayText;

  final int highlightedIndex;

  final T? selectedItem;

  final ValueChanged<T>
  onSelected;

  final ScrollController
  scrollController;

  final ItemBuilder<T>? itemBuilder;

  @override
  Widget build(
      BuildContext context,
      ) {
    return ListView.builder(
      controller:
      scrollController,
      itemCount: items.length,
      itemBuilder:
          (_, index) {
        final item =
        items[index];
        if (itemBuilder != null) {
          return InkWell(
            onTap: () {
              onSelected(item);
            },
            child: itemBuilder!(
              context,
              item,
              selectedItem == item,
            ),
          );
        }

        return ComboBoxItem<T>(
          item: item,
          title: displayText(item),
          selected:
          selectedItem == item,
          highlighted:
          highlightedIndex ==
              index,
          onTap: () {
            onSelected(item);
          },
        );
      },
    );
  }
}