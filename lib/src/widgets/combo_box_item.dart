import 'package:flutter/material.dart';

import '../models/combo_box_item_model.dart';

class ComboBoxItem extends StatelessWidget {
  const ComboBoxItem({
    super.key,
    required this.item,
    required this.title,
    required this.selected,
    required this.highlighted,
    required this.onTap,
    required this.textStyle,
    required this.textStyleSelected,
    required this.bgColorSelected,
    required this.heightItem,
  });

  final ComboBoxItemModel item;

  final String title;

  final bool selected;

  final bool highlighted;

  final VoidCallback onTap;

  final TextStyle? textStyle;

  final TextStyle? textStyleSelected;

  final Color? bgColorSelected;

  final double heightItem;



  @override
  Widget build(BuildContext context) {
    Color? background;
    if (highlighted) {
      background = Colors.blue.shade50;
    } else if (selected) {
      background = Colors.grey.shade100;
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        height: heightItem,
        color: bgColorSelected??background,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.centerLeft,
        child: Text(title, style: selected? textStyleSelected : textStyle),
      ),
    );
  }
}
